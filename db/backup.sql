--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-1.pgdg120+1)
-- Dumped by pg_dump version 15.12 (Debian 15.12-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: student_profiles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.student_profiles (
    sub text NOT NULL,
    poziom text,
    lokalizacja text,
    opis text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    znajomi uuid[]
);


ALTER TABLE public.student_profiles OWNER TO "user";

--
-- Name: tutor_profiles; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.tutor_profiles (
    id integer NOT NULL,
    sub uuid NOT NULL,
    specjalizacja text NOT NULL,
    opis text NOT NULL,
    przedmioty text[] NOT NULL,
    cena numeric(6,2) NOT NULL,
    lokalizacja text NOT NULL,
    dostepnosc text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    znajomi uuid[]
);


ALTER TABLE public.tutor_profiles OWNER TO "user";

--
-- Name: tutor_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.tutor_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tutor_profiles_id_seq OWNER TO "user";

--
-- Name: tutor_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.tutor_profiles_id_seq OWNED BY public.tutor_profiles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    sub character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    picture character varying(255)
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tutor_profiles id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tutor_profiles ALTER COLUMN id SET DEFAULT nextval('public.tutor_profiles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: student_profiles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.student_profiles (sub, poziom, lokalizacja, opis, created_at, updated_at, znajomi) FROM stdin;
37481d44-4238-43b6-8c78-9d814a572a3a	liceum	Toruń	informacje	2025-05-21 20:34:55.762827+00	2025-05-21 20:34:55.762827+00	\N
4620de1a-532b-4f19-a0ba-0bc80b06f40b	szkola_podstawowa	Warszawa	opis	2025-05-21 20:38:12.091458+00	2025-05-21 20:38:12.091458+00	\N
a162d48a-d0e6-4860-aec8-d6dd0cccff21	liceum	dsadsa	dsadas	2025-05-21 20:49:16.679481+00	2025-05-21 20:49:16.679481+00	\N
996fa941-7390-4b39-b25a-851cfd02d54e	liceum	Toruń	szszsz	2025-05-21 20:58:38.975843+00	2025-05-21 20:58:38.975843+00	\N
0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17	studia	Gdańsk	oczekiwania	2025-05-22 14:57:37.334899+00	2025-05-22 14:57:37.334899+00	{205eb7a2-0027-467f-9e48-fb0abb8601e6,96587bc2-c38d-4090-bf50-c4618fec7e9c,92a5df78-6921-4e1e-9a55-a521e194db92,6753c4ac-dcd3-41dd-acce-b949bf2f3ee5,d5e222f3-34eb-4be5-ae19-aec60814442d,30c3e34c-13f1-4edb-8f46-1c7dc32192d4,42d38f83-34e5-4369-b082-f387d3651ba9}
\.


--
-- Data for Name: tutor_profiles; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.tutor_profiles (id, sub, specjalizacja, opis, przedmioty, cena, lokalizacja, dostepnosc, created_at, updated_at, znajomi) FROM stdin;
2	8b229330-10b5-4cd6-b751-9a16348a458a	Biologia	Biologia	{Biologia}	100.00	Gdańsk Wrzeszcz Górny	Śr: 12:00-18:00	2025-05-21 17:33:58.778377	2025-05-21 17:33:58.778377	\N
1	d5e222f3-34eb-4be5-ae19-aec60814442d	Matematyka	cos tam cos tam cos tam	{Matematyka,Fizyka}	100.00	Gdańsk	Pon-pt: 16:00 - 20:00	2025-05-21 13:06:53.405714	2025-05-21 13:06:53.405714	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
4	30c3e34c-13f1-4edb-8f46-1c7dc32192d4	Fizyka	opis	{Fizyka}	200.00	Toruń	Pon-pt: 15:00-18:00	2025-05-21 20:40:59.561665	2025-05-21 20:40:59.561665	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
5	205eb7a2-0027-467f-9e48-fb0abb8601e6	Historia	Historia	{Historia}	250.00	Toruń	Pon-Pt: 15:00-18:00	2025-05-21 20:53:27.773704	2025-05-21 20:53:27.773704	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
3	92a5df78-6921-4e1e-9a55-a521e194db92	Matematyka	opis	{Matematyka}	150.00	Toruń	Pn-pt: 15:00-17:00	2025-05-21 20:18:52.022572	2025-05-21 20:18:52.022572	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
6	d8c539e3-da0f-42da-acad-c3d09d702349	Fizyka	fizyka	{Fizyka}	50.00	Toruń	Pon-Pt: 15:00 - 16:00	2025-05-22 16:38:12.597292	2025-05-22 16:38:12.597292	\N
8	498d2de8-bf94-46d3-9404-29b700355ef2	Informatyka	opis	{Informatyka,Matematyka,Fizyka}	250.00	Gdańsk	Pon-Pt: 12:00 - 18:00	2025-05-22 22:24:38.53667	2025-05-22 22:24:38.53667	\N
9	4a4cfff8-936b-4df6-baf6-6878a92566d6	Informatyka	opis	{Matematyka,Informatyka}	200.00	Toruń	Pon-Pt: 15:00 - 20:00	2025-05-22 22:28:44.026165	2025-05-22 22:28:44.026165	\N
10	6753c4ac-dcd3-41dd-acce-b949bf2f3ee5	Informatyka	opis	{Matematyka,Informatyka}	250.00	Toruń	Pon-Pt: 15:00 - 20:00	2025-05-22 22:32:32.187589	2025-05-22 22:32:32.187589	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
11	42d38f83-34e5-4369-b082-f387d3651ba9	Chemia	dsadas	{Chemia}	100.00	Toruń	Pon-Pt: 12:00 - 16:00	2025-05-23 16:13:21.168499	2025-05-23 16:13:21.168499	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
12	96587bc2-c38d-4090-bf50-c4618fec7e9c	Kupa	opis	{Gówno}	400.00	Gdańsk	dniasndas	2025-05-23 19:17:21.90392	2025-05-23 19:17:21.90392	{0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17}
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, sub, email, name, picture) FROM stdin;
59	abd8472c-32e4-4613-a416-e0d141a2925b	sigma2@sigma.com	sigma sigma	\N
60	7f5370fc-f1c1-4d41-bbf7-7c01a8aea30c	maja@maja.com	maja maja	\N
65	24a5334c-1215-4ea2-ba25-8ebe46e1d9ff	maciek10@gmail.com	Maciej Adamski	\N
66	64422749-21a7-442d-afe5-2e0505ce5f57	korepetytor@gmail.com	test testtest	\N
6	bc62bc0f-50b1-479d-abc0-500ef19002ae	maciek2@wp.pl	maciek2 adamski2	\N
73	636a1b23-063c-455c-81ad-505861af7ed0	korepetytor2@gmail.com	korepetytor rotyteperok	\N
74	d5e222f3-34eb-4be5-ae19-aec60814442d	korepetytor3@gmail.com	jan adamski	\N
75	8b229330-10b5-4cd6-b751-9a16348a458a	majak@gmail.com	Maja Wis	\N
76	92a5df78-6921-4e1e-9a55-a521e194db92	sigma10@sigma.com	sigma sigma	\N
77	37481d44-4238-43b6-8c78-9d814a572a3a	uczendobry@gmail.com	uczen dobry	\N
78	4620de1a-532b-4f19-a0ba-0bc80b06f40b	uczenzly@gmail.com	uczen zly	\N
79	30c3e34c-13f1-4edb-8f46-1c7dc32192d4	korepetytor72@gmail.com	korepetytor cos	\N
30	c126ac08-fc6b-4c94-9344-2275f87dab49	sigma@sigma.com	sigma sigma	\N
80	a162d48a-d0e6-4860-aec8-d6dd0cccff21	macieka@gmail.com	maciek adamski	\N
23	d02d94b0-8ff6-4f6c-b537-8765275f1462	a.maciek@protonmail.com	maciek10 adamski10	\N
81	205eb7a2-0027-467f-9e48-fb0abb8601e6	korepetytor22@gmail.com	sigma sigma	\N
82	996fa941-7390-4b39-b25a-851cfd02d54e	test99@gmail.com	test test	\N
83	0cf9a1a3-c1ad-41ce-a4d7-accc9aca3b17	maciekox2@gmail.com	maciek adamski	\N
88	6753c4ac-dcd3-41dd-acce-b949bf2f3ee5	maciek.adamski9@gmail.com	Maciej Adamski	\N
90	42d38f83-34e5-4369-b082-f387d3651ba9	korepetytorssr@gmail.com	test Test	\N
92	96587bc2-c38d-4090-bf50-c4618fec7e9c	majson@gmail.com	majson Wiszniewska	\N
\.


--
-- Name: tutor_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.tutor_profiles_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 93, true);


--
-- Name: student_profiles student_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.student_profiles
    ADD CONSTRAINT student_profiles_pkey PRIMARY KEY (sub);


--
-- Name: tutor_profiles tutor_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tutor_profiles
    ADD CONSTRAINT tutor_profiles_pkey PRIMARY KEY (id);


--
-- Name: tutor_profiles tutor_profiles_sub_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.tutor_profiles
    ADD CONSTRAINT tutor_profiles_sub_key UNIQUE (sub);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_sub_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_sub_key UNIQUE (sub);


--
-- PostgreSQL database dump complete
--

