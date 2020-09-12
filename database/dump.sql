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
ALTER TABLE ONLY public.coupons DROP CONSTRAINT coupons_pkey;
ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.coupons ALTER COLUMN coupon_id DROP DEFAULT;
ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
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
39	3	Marriott	1 free night up to 35K	2	2021-01-31T20:00:00.000Z	2020-07-05 22:50:50.093706+00	f
41	3	Ruth's Chris Steak House	$25 off with any entree purchase	1	2020-11-30T20:00:00.000Z	2020-07-05 23:16:15.650156+00	f
72	16	hi	hi	1	2020-08-09T02:41:30.637Z	2020-08-09 02:41:42.685644+00	t
73	16	jjj	jjj	1	2020-08-09T02:41:54.353Z	2020-08-09 02:42:01.441312+00	t
74	16	jjj	jjj	1	2020-08-09T02:42:06.045Z	2020-08-09 02:42:11.907882+00	f
75	16	kkk	kkk	1	2020-08-09T02:42:15.062Z	2020-08-09 02:42:21.115329+00	f
68	3	Dunkin Dount	1 free beverage	1	2020-08-15T19:00:00.000Z	2020-07-31 05:36:14.916809+00	t
53	3	Chipotle	1 free meal	1	2020-07-11T20:06:06.590Z	2020-07-11 20:06:24.904242+00	t
37	3	Calvin Klein	20% off birthday coupon	5	2020-07-31T19:00:00.000Z	2020-07-05 20:43:35.302883+00	t
57	3	Gina's Pizza	Pizza BOGO	1	2020-07-25T19:00:00.000Z	2020-07-19 20:01:52.90786+00	f
55	3	Portola Coffee	1 free beverage	1	2020-07-25T19:00:00.000Z	2020-07-19 20:00:20.890062+00	t
54	3	Churned Creamery	1 free single scoop of ice cream	1	2020-07-25T19:00:00.000Z	2020-07-19 19:59:05.393333+00	t
58	3	El Pollo Loco	$5 off any purchase. Coupon in app 	1	2020-08-01T19:00:00.000Z	2020-07-19 20:03:07.476998+00	t
56	3	Ding Tea - Irvine	Drink BOGO	1	2020-07-25T19:00:00.000Z	2020-07-19 20:00:55.016991+00	t
31	3	Shell	Use app pay with PayPal $3 off 	5	2020-07-31T19:00:00.000Z	2020-07-03 18:14:19.189666+00	t
59	3	Fast5xpress	1 free silver car wash, bring printed email	5	2020-08-08T19:00:00.000Z	2020-07-19 20:09:10.576278+00	t
40	3	Hyatt	1 free night up to category 4	2	2021-01-01T20:00:00.000Z	2020-07-05 22:58:22.863846+00	t
62	3	Starbucks	Birthday 1 free drink on 7/25 only	1	2020-07-25T19:00:00.000Z	2020-07-23 18:22:20.78677+00	t
65	3	Farmer Boys	1 free entree	1	2020-08-06T19:00:00.000Z	2020-07-26 03:32:34.053985+00	f
64	3	Boiling Point	$10 off any purchase	1	2020-08-02T19:00:00.000Z	2020-07-25 08:30:37.280104+00	t
71	3	85 Cafe	1 free M sea salt oolong tea	1	2020-08-31T19:00:00.000Z	2020-08-08 22:42:42.755243+00	t
66	3	85 Cafe	1 free birthday cake	1	2020-07-31T19:00:00.000Z	2020-07-28 23:58:45.081582+00	t
38	3	Peet's 	1 free beverage, any size	1	2020-12-31T20:00:00.000Z	2020-07-05 20:47:53.615886+00	f
69	3	AMC	1 free beverage	4	2020-12-31T20:00:00.000Z	2020-08-02 18:15:47.718945+00	f
67	3	85 Cafe	1 free sea salt drink, size M	1	2020-08-15T19:00:00.000Z	2020-07-28 23:59:50.751598+00	t
79	17	AMC	20% Family tickets to AMC on a weekday	4	2020-11-27T20:00:00.000Z	2020-08-26 22:09:33.817213+00	f
61	3	Noah's Bagel	Birthday free egg sandwich	1	2020-09-03T19:00:00.000Z	2020-07-22 23:40:26.88416+00	t
78	3	Kura Sushi	$5 off with order over $15	1	2020-09-18T19:00:00.000Z	2020-08-15 06:00:53.347489+00	f
60	3	Dunkin Dount	1 free beverage, any size	1	2020-11-13T20:00:00.000Z	2020-07-22 22:43:13.108484+00	f
77	3	Panera Bread	$5 off with order over $20 with code: SUMMERFIVE	1	2020-09-06T19:00:00.000Z	2020-08-13 19:36:47.086215+00	t
76	3	IHG	1 free anniversary reward night under 40,000 point	2	2020-12-31T20:00:00.000Z	2020-08-10 21:50:58.513203+00	t
80	3	IKEA	$10 off and 1 free frozen yogurt	5	2020-10-31T19:00:00.000Z	2020-09-01 18:19:08.505716+00	t
81	20	AMC	1 free movie ticket	4	2020-10-31T19:00:00.000Z	2020-09-08 04:11:54.066891+00	f
82	20	Marriot Bonvoy	1 free night for rooms under 50,000 points.	2	2020-12-31T20:00:00.000Z	2020-09-08 04:17:05.472628+00	f
83	20	Starbucks	1 free drink, any size	1	2020-10-11T19:00:00.000Z	2020-09-08 04:20:32.982835+00	f
84	20	Kura Sushi	$5 off with order over $15	1	2020-09-30T19:00:00.000Z	2020-09-08 04:21:26.840522+00	f
85	20	Boiling Point	$10 off with pot order	1	2020-10-01T19:00:00.000Z	2020-09-08 04:21:58.504202+00	f
86	20	Regal	1 free small popcorn	4	2020-10-15T19:00:00.000Z	2020-09-08 04:22:30.02875+00	f
87	20	85 Cafe	1 free 85C coffee, size M	1	2020-10-30T19:00:00.000Z	2020-09-08 04:24:02.619422+00	f
88	20	Dave & Busters	$10 free game play	4	2020-10-19T19:00:00.000Z	2020-09-08 04:25:13.255536+00	f
89	20	Alaska Airline	Flight ticket buy one get one with $99	2	2020-10-04T19:00:00.000Z	2020-09-08 04:26:18.781742+00	f
90	20	Ralphs	1 free large eggs	5	2020-10-04T19:00:00.000Z	2020-09-08 04:27:51.614309+00	f
91	20	Amazon	$25 off any purchase	5	2020-11-30T20:00:00.000Z	2020-09-08 04:28:51.982365+00	f
92	20	IKEA	$10 off in store purchase	5	2020-10-15T19:00:00.000Z	2020-09-08 04:32:03.464615+00	f
93	20	Peet's	1 free beverage, any size	1	2020-10-10T19:00:00.000Z	2020-09-08 21:33:26.711475+00	f
94	20	Ruth's Chris Steak House	$25 off an entree with coupon	1	2020-12-31T20:00:00.000Z	2020-09-08 21:52:16.384475+00	f
95	20	Pusheen Shop	1 free Pusheen Box with coupon	5	2020-10-14T19:00:00.000Z	2020-09-09 02:51:02.758592+00	f
70	3	AMC	Birthday 1 free drink and popcorn, plus $5 reward	4	2020-10-31T19:00:00.000Z	2020-08-07 22:51:29.592813+00	f
96	14	Test	Test deal for free	1	2020-09-11T21:27:11.538Z	2020-09-11 21:27:25.308853+00	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, name, email, password, created_at, avatar_url, profile_image) FROM stdin;
4	John Doe	test@gmail.com	$2a$10$QauXThKu4m7l7etGfaiit.sKrvbEHIG8SEejfSxZfm2UotSCpuxR2	2020-06-14 22:11:38.577416+00	//www.gravatar.com/avatar/1aedb8d9dc4751e229a335e371db8058?s=200&r=pg&d=mm	\N
5	Jane Doe	test1@gmail.com	$2a$10$YIgIS9srOZJO5mZ.Qt4kKOzv4B1gQUpYz.Gj/T4T7P2UX2eR5/btC	2020-06-16 01:16:23.193553+00	//www.gravatar.com/avatar/245cf079454dc9a3374a7c076de247cc?s=200&r=pg&d=mm	\N
6	Jimmy McGill	jm@gmail.com	$2a$10$VfBtjtbUgoV2s7zevXwzQ.ewv4a/397JIfloDnozkCg1oj8HLTNC6	2020-06-21 20:06:01.273581+00	//www.gravatar.com/avatar/c898e0d48bd6242ae01e31f303069be5?s=200&r=pg&d=mm	\N
7	John Smith	js@gmail.com	$2a$10$MLB1UDOBmS.6MLpY1muuwOuLMP9vNtGCJWvQQAeBQVn0ZjYGfV4sK	2020-06-22 19:21:48.67922+00	//www.gravatar.com/avatar/38135c60b09c5f5a6cba9e09a5f87205?s=200&r=pg&d=mm	\N
8	Peter Griffin	pg@gmail.com	$2a$10$XIUQhxcCqg7xnpNcTQocCe57SobXg3WocARrY81vXigosEff0XSEm	2020-06-24 05:28:34.141608+00	//www.gravatar.com/avatar/7f228a94311694b72824466a46c971ad?s=200&r=pg&d=mm	\N
9	Walter White	ww@gmail.com	$2a$10$ytlJMYD1qsXdheUrTDE1ruKUFbGIPDnyBIcf/m.CVDDUQjxLh4rjy	2020-06-24 05:34:34.479347+00	//www.gravatar.com/avatar/854ff0f3a14711a12c795eb9df487117?s=200&r=pg&d=mm	\N
10	Emma Stone	es@gmail.com	$2a$10$EoIB2lEzH2D68IcsOMlvfOR0oblsKbrUys3Uh6MoxmbUApLEaIkcu	2020-06-24 05:44:08.473454+00	//www.gravatar.com/avatar/b9245b28e0753ede8d628a0c079d511f?s=200&r=pg&d=mm	\N
11	Krazy 8	k8@gmail.com	$2a$10$bF/j9g893HP1aNpTJjq5JOC9OOGjEIYkYfTaGDuIgCxnMstT1Wr2i	2020-06-24 05:51:46.601482+00	//www.gravatar.com/avatar/56a18757493e78019d4c4e65a6b716bc?s=200&r=pg&d=mm	\N
12	Luke Skywalker	ls@gmail.com	$2a$10$yIFo/bwWdmWN3y.1MN.cbeTKrECtXVcpPZ5SRf14Fd6vguhYrfwDm	2020-06-24 05:57:56.121143+00	//www.gravatar.com/avatar/27eb5383bc621e9e761d33c4b2a5f7f3?s=200&r=pg&d=mm	\N
13	Demo Man	demo@gmail.com	$2a$10$7/fLfbdsL1Lh6UFSuVNrcumwdcrrT8mbpFZue.boPx93F5e6.pS/y	2020-07-11 19:20:31.920328+00	//www.gravatar.com/avatar/bb90dcb0ceabfc8bf10c550f1ee95ee7?s=200&r=pg&d=mm	\N
14	Saul Goodman 	saul.goodman@gmail.com	$2a$10$NvJFgduLFK0XL3mgoZIlpeZjk2jDr0PCroaRm1G1vVcfSlPbFU.Ey	2020-07-11 19:53:17.200468+00	//www.gravatar.com/avatar/aac176fab8e73c7d64194e44ac671e75?s=200&r=pg&d=mm	\N
15	Debra	debrachiang1019@gmail.com	$2a$10$a4M9pKwCX/X09PAkWJkceu7lUGDU4OPwiKRaYMPT6qbxg9mwbXXoi	2020-07-25 00:09:13.743006+00	//www.gravatar.com/avatar/4fd86c5a36aa4fb6a5bbcbc13f685258?s=200&r=pg&d=mm	\N
16	Hi	hi@gmail.com	$2a$10$zOIks6D3BAfLsBjaq8Rhwu7PX/HJe4D39xY2gDRaZHcRjQsMGEXmC	2020-08-09 02:41:23.811378+00	//www.gravatar.com/avatar/b243cc95d53fbfc93dfd9f15c4cd39df?s=200&r=pg&d=mm	\N
17	Tim	a@b.cd	$2a$10$yMQIJMUECYnOWEW0VOSqKez46U1J74KE75ssbzI0IR8LOrJOjR/22	2020-08-26 22:08:27.283839+00	//www.gravatar.com/avatar/3a4651447c3ffc65b7a04611a4355a33?s=200&r=pg&d=mm	\N
3	Elvis Lee	elvislee0725@gmail.com	$2a$10$B74miPPFTn3fAQl/P/2ydOLhFCbQjkY58f1mqTaVkXMikKRE4vN.C	2020-06-14 21:44:45.123988+00	//www.gravatar.com/avatar/aaf2b27e19c09ec4a8173b0c0723e106?s=200&r=pg&d=mm	02faaa74-a4aa-4635-b18c-73abd1fa0649-profile2.jpg
20	John Doe	guest@demo.com	$2a$10$pZmzCljZAilxwtiyu5PbFuUhQM9HALumxQazq3SRkWhR/Z6hqI1cy	2020-09-07 23:50:27.372952+00	//www.gravatar.com/avatar/52f88efd0890e268fe8f4486c1a3e16a?s=200&r=pg&d=mm	\N
21	John Smith	demo@test.com	$2a$10$pti9WHAS1luXnoi6elk8PuK2BmdoZrYM14Yt/a6VANwnYLBQ/vqQe	2020-09-12 03:57:51.240734+00	//www.gravatar.com/avatar/7b6cfb77576b5a89d7a5f29fcbe3a60c?s=200&r=pg&d=mm	\N
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupons_coupon_id_seq', 98, true);


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

