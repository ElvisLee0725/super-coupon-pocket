--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_pkey;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.history ALTER COLUMN history_id DROP DEFAULT;
ALTER TABLE public.coupons ALTER COLUMN coupon_id DROP DEFAULT;
ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.history_history_id_seq;
DROP TABLE public.history;
DROP SEQUENCE public.coupons_coupon_id_seq;
DROP TABLE public.coupons;
DROP SEQUENCE public.categories_category_id_seq;
DROP TABLE public.categories;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category character varying(255) NOT NULL
);


--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupons (
    coupon_id integer NOT NULL,
    user_id integer NOT NULL,
    merchant character varying(255) NOT NULL,
    discount character varying(255) NOT NULL,
    category_id integer NOT NULL,
    expiration_date character varying(255),
    created_at timestamp(6) with time zone DEFAULT now() NOT NULL,
    used boolean DEFAULT false NOT NULL
);


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coupons_coupon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coupons_coupon_id_seq OWNED BY public.coupons.coupon_id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.history (
    history_id integer NOT NULL,
    coupon_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    used_at timestamp with time zone,
    used boolean DEFAULT false
);


--
-- Name: history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.history_history_id_seq OWNED BY public.history.history_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp(6) with time zone DEFAULT now() NOT NULL,
    avatar_url character varying(255),
    profile_image character varying(255)
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: coupons coupon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons ALTER COLUMN coupon_id SET DEFAULT nextval('public.coupons_coupon_id_seq'::regclass);


--
-- Name: history history_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history ALTER COLUMN history_id SET DEFAULT nextval('public.history_history_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (category_id, category) FROM stdin;
1	restaurant
2	travel
4	entertainment
5	other
\.


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.coupons (coupon_id, user_id, merchant, discount, category_id, expiration_date, created_at, used) FROM stdin;
3	4	AMC	1 free large drink	4	\N	2020-06-17 04:48:10.211285+00	f
123	20	Alaska Airline	Flight ticket buy one, get one with $99. Log in account to redeem	2	2021-09-30T19:00:00.000Z	2020-10-06 23:57:29.341895+00	f
124	20	Boiling Point	$10 off with pot order. Redeem in app	1	2020-11-30T20:00:00.000Z	2020-10-06 23:58:32.730463+00	f
72	16	hi	hi	1	2020-08-09T02:41:30.637Z	2020-08-09 02:41:42.685644+00	t
73	16	jjj	jjj	1	2020-08-09T02:41:54.353Z	2020-08-09 02:42:01.441312+00	t
74	16	jjj	jjj	1	2020-08-09T02:42:06.045Z	2020-08-09 02:42:11.907882+00	f
75	16	kkk	kkk	1	2020-08-09T02:42:15.062Z	2020-08-09 02:42:21.115329+00	f
125	20	Kura Sushi	$5 off with order over $15. Redeem with email coupon	1	2020-11-15T20:00:00.000Z	2020-10-06 23:59:24.642953+00	f
126	20	AMC	1 free movie ticket with coupon	4	2020-10-31T19:00:00.000Z	2020-10-07 00:00:05.716376+00	f
127	20	Regal Theatre	1 free small popcorn, redeem in app	4	2020-11-06T20:00:00.000Z	2020-10-07 00:01:06.856987+00	f
128	20	85 Cafe	1 free 85C coffee, size M	1	2020-10-31T19:00:00.000Z	2020-10-07 00:01:59.196224+00	f
129	20	Dave & Busters	$10 free game play. redeem with email coupon	4	2020-10-24T19:00:00.000Z	2020-10-07 00:02:46.623128+00	f
130	20	Amazon	$10 off with order over $50. Pay with AMEX card	5	2020-11-20T20:00:00.000Z	2020-10-07 00:04:24.284561+00	f
131	20	IKEA	$10 off in store purchase with email coupon	5	2020-10-31T19:00:00.000Z	2020-10-07 00:05:05.553656+00	f
132	20	Pusheen Shop	1 free Pusheen Box with email coupon	5	2020-10-19T19:00:00.000Z	2020-10-07 00:07:56.06812+00	f
133	20	Marriot Bonvoy	3 reward nights up to 50K points	2	2021-12-31T20:00:00.000Z	2020-10-07 00:10:21.180954+00	f
134	20	Starbucks Coffee	1 free beverage any size, redeem in app	1	2020-11-29T20:00:00.000Z	2020-10-07 00:12:00.418904+00	f
121	3	Panera Bread	$10 off coupon x2, redeem in app	1	2020-10-22T19:00:00.000Z	2020-10-06 23:40:54.224173+00	t
135	3	El Pollo Loco	1 free burrito	1	2020-11-02T20:00:00.000Z	2020-10-21 21:24:35.921324+00	f
136	3	Yoshinoya	1 free regular bowl with drink purchase	1	2020-11-05T20:00:00.000Z	2020-10-21 21:54:47.880969+00	f
120	3	Target	$5 off paper coupon	5	2020-10-27T19:00:00.000Z	2020-10-06 23:38:47.463181+00	t
79	17	AMC	20% Family tickets to AMC on a weekday	4	2020-11-27T20:00:00.000Z	2020-08-26 22:09:33.817213+00	f
116	3	Ruth's Chris Steak House	$25 off with any entree purchase, paper coupon	1	2020-12-31T20:00:00.000Z	2020-10-06 23:29:46.795277+00	f
117	3	Dunkin Dount	1 free beverage, any size. Redeem in app.	1	2020-12-06T20:00:00.000Z	2020-10-06 23:32:40.452494+00	f
118	3	AMC	Member birthday 1 free drink and popcorn reward, plus $5 reward dollar. Redeem in app	4	2020-10-31T19:00:00.000Z	2020-10-06 23:35:00.396244+00	f
119	3	AMC	1 free beverage with email coupon	4	2020-12-31T20:00:00.000Z	2020-10-06 23:37:21.243435+00	f
114	3	Peet's Coffee	1 free beverage, any size	1	2020-12-31T20:00:00.000Z	2020-10-06 23:26:05.12088+00	f
115	3	Marriott	1 free reward night up to 35K points	2	2021-01-31T20:00:00.000Z	2020-10-06 23:27:55.300577+00	f
122	3	Starbucks Coffee	1 free beverage any size. Redeem in app	1	2020-10-06T23:41:54.383Z	2020-10-06 23:42:15.816677+00	t
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.history (history_id, coupon_id, user_id, created_at, used_at, used) FROM stdin;
6	114	3	2020-10-06 23:26:05.126372+00	\N	f
8	116	3	2020-10-06 23:29:46.79727+00	\N	f
9	117	3	2020-10-06 23:32:40.456128+00	\N	f
10	118	3	2020-10-06 23:35:00.398168+00	\N	f
11	119	3	2020-10-06 23:37:21.245011+00	\N	f
7	115	3	2020-10-06 23:27:55.302336+00	\N	f
14	122	3	2020-10-06 23:42:15.818246+00	2020-10-06 23:47:58.653+00	t
15	123	20	2020-10-06 23:57:29.343661+00	\N	f
16	124	20	2020-10-06 23:58:32.732415+00	\N	f
17	125	20	2020-10-06 23:59:24.645181+00	\N	f
18	126	20	2020-10-07 00:00:05.718127+00	\N	f
19	127	20	2020-10-07 00:01:06.858769+00	\N	f
20	128	20	2020-10-07 00:01:59.19764+00	\N	f
21	129	20	2020-10-07 00:02:46.625173+00	\N	f
22	130	20	2020-10-07 00:04:24.286946+00	\N	f
23	131	20	2020-10-07 00:05:05.5609+00	\N	f
24	132	20	2020-10-07 00:07:56.070512+00	\N	f
25	133	20	2020-10-07 00:10:21.183801+00	\N	f
26	134	20	2020-10-07 00:12:00.420773+00	\N	f
13	121	3	2020-10-06 23:40:54.227678+00	2020-10-14 18:36:17.014+00	t
27	135	3	2020-10-21 21:24:35.928873+00	\N	f
28	136	3	2020-10-21 21:54:47.883094+00	\N	f
12	120	3	2020-10-06 23:38:47.466097+00	2020-10-26 23:14:48.505+00	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, name, email, password, created_at, avatar_url, profile_image) FROM stdin;
14	Saul Goodman 	saul.goodman@gmail.com	$2a$10$NvJFgduLFK0XL3mgoZIlpeZjk2jDr0PCroaRm1G1vVcfSlPbFU.Ey	2020-07-11 19:53:17.200468+00	//www.gravatar.com/avatar/aac176fab8e73c7d64194e44ac671e75?s=200&r=pg&d=mm	\N
15	Debra	debrachiang1019@gmail.com	$2a$10$a4M9pKwCX/X09PAkWJkceu7lUGDU4OPwiKRaYMPT6qbxg9mwbXXoi	2020-07-25 00:09:13.743006+00	//www.gravatar.com/avatar/4fd86c5a36aa4fb6a5bbcbc13f685258?s=200&r=pg&d=mm	\N
20	John Doe	guest@demo.com	$2a$10$pZmzCljZAilxwtiyu5PbFuUhQM9HALumxQazq3SRkWhR/Z6hqI1cy	2020-09-07 23:50:27.372952+00	//www.gravatar.com/avatar/52f88efd0890e268fe8f4486c1a3e16a?s=200&r=pg&d=mm	\N
3	Elvis Lee	elvislee0725@gmail.com	$2a$10$PhfUE.rJdnFQeEDKQ8ELyOdTxqYsZCzX5YUdJJmCzIz7KRjiDMyM6	2020-06-14 21:44:45.123988+00	//www.gravatar.com/avatar/aaf2b27e19c09ec4a8173b0c0723e106?s=200&r=pg&d=mm	scp/images/userProfile/be24f799-67a3-4d0a-8ad0-874fbdfe2fae-profile1.jpg
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupons_coupon_id_seq', 136, true);


--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_history_id_seq', 28, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (coupon_id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

