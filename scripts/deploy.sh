#!/bin/bash
set -e

NAMESPACE="korepetycje"

echo "Usuwam namespace $NAMESPACE (jeśli istnieje)..."
kubectl delete namespace $NAMESPACE --ignore-not-found

echo "Czekam aż namespace $NAMESPACE zostanie usunięty..."
while kubectl get namespace $NAMESPACE &> /dev/null; do
  sleep 1
done

echo "Tworzę namespace $NAMESPACE..."
kubectl create namespace $NAMESPACE

echo "Ustawiam kontekst na namespace $NAMESPACE..."
kubectl config set-context --current --namespace=$NAMESPACE

echo "Tworzę nowe zasoby z katalogu k8s/ w namespace $NAMESPACE..."
kubectl apply -f k8s/ -R

echo "Czekam aż pody będą w stanie Running i Ready 1/1..."

for app in ssr-client spa-client b2b-client backend keycloak db; do
  echo -n "Czekam na pod $app..."
  while true; do
    pod=$(kubectl get pods -l "io.kompose.service=$app" -n $NAMESPACE -o jsonpath="{.items[0].metadata.name}" 2>/dev/null)
    phase=$(kubectl get pod "$pod" -n $NAMESPACE -o jsonpath="{.status.phase}" 2>/dev/null)
    ready=$(kubectl get pod "$pod" -n $NAMESPACE -o jsonpath="{.status.containerStatuses[0].ready}" 2>/dev/null)

    if [ "$phase" == "Running" ] && [ "$ready" == "true" ]; then
      echo " OK"
      break
    fi

    sleep 1
  done
done

echo "Wszystkie pody działają. Uruchamiam port-forwarding..."

kubectl port-forward -n $NAMESPACE svc/ssr-client 3001:3000 &
kubectl port-forward -n $NAMESPACE svc/spa-client 3002:3000 &
kubectl port-forward -n $NAMESPACE svc/b2b-client 3003:3003 &
kubectl port-forward -n $NAMESPACE svc/backend 3000:3000 &
kubectl port-forward -n $NAMESPACE svc/keycloak 8080:8080 &
kubectl port-forward -n $NAMESPACE svc/db 5433:5432 &

echo "Port-forwarding uruchomiony:"
echo "SSR Client:   http://localhost:3001"
echo "SPA Client:   http://localhost:3002"
echo "B2B Client:   http://localhost:3003"
echo "Backend:      http://localhost:3000"
echo "Keycloak:     http://localhost:8080"
echo "DB (Postgres):postgres://localhost:5433"

wait
