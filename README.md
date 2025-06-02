# ProjektTB – Uruchamianie za pomocą Docker Compose

## Wymagania wstępne

- Zainstalowany [Docker](https://www.docker.com/)
- Zainstalowany [Docker Compose](https://docs.docker.com/compose/)

---

## 1. Budowanie obrazów Dockera (opcjonalnie)

Jeśli chcesz korzystać z własnych, najnowszych wersji aplikacji, zbuduj obrazy lokalnie:

```sh
docker-compose up --build
```

Jeśli korzystasz z gotowych obrazów z Docker Hub, ten krok możesz pominąć.

---

## 3. Uruchomienie wszystkich serwisów

```sh
docker-compose up -d
```

---

## 4. Sprawdzenie statusu

Aby sprawdzić, czy wszystkie serwisy działają:

```sh
docker-compose ps
```

---

## 5. Dostęp do aplikacji

- **SSR Client:**   http://localhost:3001
- **SPA Client:**   http://localhost:3002
- **B2B Client:**   http://localhost:3003
- **Backend:**      http://localhost:3000
- **Keycloak:**     http://localhost:8080
- **Postgres:**     postgres://localhost:5432

---

## 6. Logi serwisów

Aby podejrzeć logi wszystkich serwisów:

```sh
docker-compose logs -f
```

---

## 7. Zatrzymywanie i usuwanie kontenerów

Aby zatrzymać wszystkie serwisy:

```sh
docker-compose down
```

---

# ProjektTB – Uruchamianie na Kubernetes

## Wymagania wstępne

- Zainstalowany [Docker](https://www.docker.com/)
- Zainstalowany [kubectl](https://kubernetes.io/docs/tasks/tools/)
- Zainstalowany Klaster Kubernetes (np. Docker Desktop z włączonym Kubernetes)

---

## 1. Uruchomienie projektu 

### a) Uruchomienie wszystkiego automatycznie

W katalogu głównym projektu uruchom skrypt:

```sh
./scripts/deploy.sh
```

Skrypt:
- Usuwa namespace `korepetycje` (jeśli istnieje)
- Tworzy namespace i wszystkie zasoby z katalogu `k8s/`
- Czeka na uruchomienie wszystkich podów
- Ustawia port-forwarding do wszystkich serwisów

## 2. Port-forwarding 

Po uruchomieniu skryptu porty będą przekierowane automatycznie.  

## 3. Dostęp do aplikacji

- **SSR Client:**   http://localhost:3001
- **SPA Client:**   http://localhost:3002
- **B2B Client:**   http://localhost:3003
- **Backend:**      http://localhost:3000
- **Keycloak:**     http://localhost:8080
- **Postgres:**     postgres://localhost:5433

---

## 4. Usuwanie zasobów

Aby usunąć wszystko z klastra:

```sh
kubectl delete namespace korepetycje
```

---

## 5. Rozwiązywanie problemów

- Sprawdź status podów:
  ```sh
  kubectl get pods -n korepetycje
  ```
- Sprawdź logi wybranego poda:
  ```sh
  kubectl logs <nazwa-poda> -n korepetycje
  ```

---

## 6. Dodatkowe uwagi

- Wszystkie manifesty Kubernetes znajdują się w katalogu `k8s/`.
- Skrypt `scripts/deploy.sh` automatyzuje cały proces wdrożenia i port-forwardingu.

---

