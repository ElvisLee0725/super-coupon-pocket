--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18 (Ubuntu 10.18-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.18 (Ubuntu 10.18-0ubuntu0.18.04.1)

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
    used boolean DEFAULT false NOT NULL,
    update_at timestamp without time zone
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

COPY public.coupons (coupon_id, user_id, merchant, discount, category_id, expiration_date, created_at, used, update_at) FROM stdin;
3	4	AMC	1 free large drink	4	\N	2020-06-17 04:48:10.211285+00	f	2020-06-17 04:48:10.211285
72	16	hi	hi	1	2020-08-09T02:41:30.637Z	2020-08-09 02:41:42.685644+00	t	2020-08-09 02:41:42.685644
73	16	jjj	jjj	1	2020-08-09T02:41:54.353Z	2020-08-09 02:42:01.441312+00	t	2020-08-09 02:42:01.441312
74	16	jjj	jjj	1	2020-08-09T02:42:06.045Z	2020-08-09 02:42:11.907882+00	f	2020-08-09 02:42:11.907882
75	16	kkk	kkk	1	2020-08-09T02:42:15.062Z	2020-08-09 02:42:21.115329+00	f	2020-08-09 02:42:21.115329
120	3	Target	$5 off paper coupon	5	2020-10-27T19:00:00.000Z	2020-10-06 23:38:47.463181+00	t	2020-10-06 23:38:47.463181
79	17	AMC	20% Family tickets to AMC on a weekday	4	2020-11-27T20:00:00.000Z	2020-08-26 22:09:33.817213+00	f	2020-08-26 22:09:33.817213
122	3	Starbucks Coffee	1 free beverage any size. Redeem in app	1	2020-10-06T23:41:54.383Z	2020-10-06 23:42:15.816677+00	t	2020-10-06 23:42:15.816677
138	3	Chick-fil-A	20% off, pay with CSR and Chase Freedom card.	1	2020-11-23T20:00:00.000Z	2020-11-08 02:40:25.152996+00	t	2020-11-08 02:40:25.151
130	20	Amazon	$10 off with order over $50. Pay with AMEX card	5	2020-11-22T20:00:00.000Z	2020-10-07 00:04:24.284561+00	t	2020-11-13 00:28:18.663
156	20	Mcdonalds	Get $10 off use this code: XY123	1	2020-11-18T20:00:00.000Z	2020-11-18 07:00:02.787+00	f	2020-11-18 07:00:02.787
147	3	Kura Sushi	$5 off with minimum $15 order	1	2020-11-21T20:00:00.000Z	2020-11-16 21:19:42.381+00	t	2020-11-16 21:19:42.382
148	3	Grubhub	$5 off $20 order. Use AMEX gold + GrubHub code	1	2020-11-25T20:00:00.000Z	2020-11-16 22:55:39.168+00	t	2020-11-21 22:53:55.693
139	3	DoorDash	$10 off with $30 order	1	2020-11-30T20:00:00.000Z	2020-11-08 02:43:57.057+00	t	2020-11-20 18:59:15.096
159	3	UberEats	$7 off $20	1	2020-11-30T20:00:00.000Z	2020-11-20 18:59:05.188+00	t	2020-11-20 18:59:05.188
114	3	Peet's Coffee	1 free beverage, any size	1	2020-12-31T20:00:00.000Z	2020-10-06 23:26:05.12088+00	t	2020-10-06 23:26:05.12088
162	3	Calvin Klein	20% off at checkout	5	2020-12-31T20:00:00.000Z	2020-12-02 00:52:44.501+00	t	2020-12-02 00:52:44.501
166	3	Starbucks	1 free beverage	1	2020-12-13T20:00:00.000Z	2020-12-07 20:24:14.479+00	t	2020-12-07 20:24:14.479
150	20	85C Cafe	1 free 85C coffee, size M	1	2020-12-15T20:00:00.000Z	2020-11-17 05:16:10.42+00	f	2020-11-17 05:16:10.42
157	3	Chick-fil-A	1 free chicken sandwich, redeem in app	1	2020-12-19T20:00:00.000Z	2020-11-19 18:23:30.156+00	t	2020-11-19 18:23:30.156
133	20	Marriot Bonvoy	3 reward nights up to 50K points	2	2021-11-03T19:00:00.000Z	2020-10-07 00:10:21.180954+00	f	2020-11-13 00:05:04.589
123	20	Alaska Airline	Flight ticket buy one, get one with $99. Log in account to redeem	2	2021-09-30T19:00:00.000Z	2020-10-06 23:57:29.341895+00	f	2020-10-06 23:57:29.341895
145	3	Amazon Fresh	$10 off $50 order, physical coupon	5	2020-12-20T20:00:00.000Z	2020-11-15 05:12:10.381+00	t	2020-12-14 04:40:46.847
116	3	Ruth's Chris Steak House	$25 off with any entree purchase, paper coupon	1	2020-12-31T20:00:00.000Z	2020-10-06 23:29:46.795277+00	t	2020-10-06 23:29:46.795277
177	3	Target	$50 get $21 using registered card	5	2020-12-31T20:00:00.000Z	2020-12-17 22:29:15.665+00	t	2020-12-17 22:29:15.665
167	20	Regal Theatre	1 free small popcorn, redeem in app	4	2021-10-31T19:00:00.000Z	2020-12-11 23:32:31.16+00	t	2021-08-05 18:08:45.119
160	3	Cherubic Tea	1 free drink	1	2020-12-28T20:00:00.000Z	2020-11-29 01:40:08.795+00	t	2020-11-29 01:40:08.795
175	3	DoorDash	$10 credit with Chase Freedom activation	1	2020-12-31T20:00:00.000Z	2020-12-15 19:42:01.537+00	t	2020-12-15 19:42:01.537
179	3	Amazon Fresh	$15 off with $60 order	5	2020-12-27T20:00:00.000Z	2020-12-21 22:17:47.134+00	t	2020-12-21 22:17:47.134
176	3	Peet's Coffee	1 free beverage redeem in app	1	2021-01-15T20:00:00.000Z	2020-12-16 18:44:22.476+00	t	2020-12-16 18:44:22.476
161	3	Panera Bread	Code: LUNCHBREAK $20 - $5	1	2020-12-31T20:00:00.000Z	2020-12-01 02:54:00.606+00	t	2020-12-01 02:54:00.606
181	3	Noah's Bagel	$5 off purchase in app	1	2021-01-11T20:00:00.000Z	2020-12-30 05:31:59.503+00	t	2020-12-30 05:31:59.504
117	3	Dunkin Dount	1 free beverage, any size. Redeem in app.	1	2021-01-22T20:00:00.000Z	2020-10-06 23:32:40.452494+00	t	2020-12-24 05:42:10.291
182	3	Panera Bread	1 free You Pick Two	1	2021-01-29T20:00:00.000Z	2020-12-30 22:15:09.894+00	t	2020-12-30 22:15:09.894
178	3	CPK	$5 off and 1 free small plate. 1 reward at a time. Do separate orders.	1	2021-01-17T20:00:00.000Z	2020-12-21 19:24:06.558+00	t	2021-01-11 19:30:02.887
170	20	Boiling Point	$10 off with pot order. Redeem in app	1	2021-04-30T19:00:00.000Z	2020-12-11 23:35:10.388+00	f	2020-12-11 23:35:10.388
171	20	AMC	1 free movie ticket with app coupon\nCODE: abcd1234	4	2021-11-30T20:00:00.000Z	2020-12-11 23:35:45.197+00	f	2021-01-26 18:54:58.499
168	20	Pusheen Shop	1 free Pusheen Box with email coupon	5	2021-10-31T19:00:00.000Z	2020-12-11 23:33:06.259+00	f	2020-12-11 23:33:06.259
185	3	85C Cafe	1 free M drink, redeem in app	1	2021-01-31T20:00:00.000Z	2021-01-26 22:05:46.628+00	t	2021-01-26 22:05:46.628
196	3	Blaze Pizza	11" pizza BOGO with code, redeem in app	1	2021-04-30T19:00:00.000Z	2021-03-14 18:47:54.453+00	t	2021-04-04 03:10:17.491
119	3	AMC	1 free large beverage and popcorn, use email coupon	4	2021-06-30T19:00:00.000Z	2020-10-06 23:37:21.243435+00	t	2020-12-24 20:45:24.316
186	3	Veggie Grill	$10 off coupon	1	2021-03-31T19:00:00.000Z	2021-01-29 01:58:09.333+00	t	2021-01-29 01:58:09.333
163	3	Calvin Klein	$20 reward dollar + $10 until 5/3	5	2021-03-05T20:00:00.000Z	2020-12-05 01:16:15.576+00	t	2021-02-02 02:53:14.184
189	3	Amazon Fresh	$10 off with $35 purchase. Use paper coupon	5	2021-02-16T20:00:00.000Z	2021-02-06 06:34:38.05+00	t	2021-02-09 05:13:32.959
183	3	IHG Ambassador Reward Night	1 free night with room points up to 40,000	2	2021-04-30T19:00:00.000Z	2021-01-05 18:31:17.986+00	t	2021-01-05 18:31:17.986
190	3	UberEats	$7 off with $20 order. Use code: FOODLOVE8N	1	2021-02-24T20:00:00.000Z	2021-02-12 22:45:27.882+00	t	2021-02-12 22:45:27.882
194	3	Starbucks	1 free beverage	1	2021-03-12T20:00:00.000Z	2021-03-10 02:29:23.39+00	t	2021-03-10 02:29:23.39
191	3	Peet's Coffee	1 free beverage	1	2021-03-20T19:00:00.000Z	2021-02-18 23:59:35.981+00	t	2021-02-18 23:59:35.982
193	3	Amazon	Amazon Photo credit, $10 off with min $25 order	5	2021-03-15T19:00:00.000Z	2021-02-28 19:54:42.649+00	t	2021-02-28 19:54:42.649
192	3	Panera Bread	$5 off entree	1	2021-03-28T19:00:00.000Z	2021-02-28 19:25:33.413+00	t	2021-02-28 19:25:33.413
180	3	Cheesecake Factory	1 free slice of cheesecake, redeem with email coupon	1	2021-03-31T19:00:00.000Z	2020-12-24 20:46:40.872+00	t	2021-02-16 07:40:46.044
172	20	Dave & Busters	$10 free game play. redeem with email coupon	4	2021-12-31T20:00:00.000Z	2020-12-11 23:37:18.397+00	t	2020-12-11 23:37:18.397
195	3	Kura Sushi	$5 off reward coupon with minimum order of $15	1	2021-04-15T19:00:00.000Z	2021-03-13 02:12:27.778+00	t	2021-03-25 18:32:10.042
174	20	UberEats	$7 off with order $20	1	2021-05-31T19:00:00.000Z	2020-12-11 23:41:13.365+00	f	2020-12-11 23:41:13.365
169	20	Kura Sushi	$5 off with order over $15. Redeem with email coupon	1	2021-08-31T19:00:00.000Z	2020-12-11 23:34:42.44+00	t	2021-05-16 18:25:26.794
187	3	Boiling Point	$10 off coupon in app reward	1	2021-03-16T19:00:00.000Z	2021-02-01 23:37:44.551+00	t	2021-02-01 23:37:44.551
209	3	Dunkin Dount	1 free beverage	1	2021-06-24T19:00:00.000Z	2021-05-25 17:32:35.253+00	t	2021-05-25 17:32:35.253
197	3	UberEats	Get 30% off using code LUCKYEATS21	1	2021-03-21T19:00:00.000Z	2021-03-15 16:50:43.784+00	t	2021-03-20 00:10:27.243
198	3	Caviar	$7 off with $15 order with code: HERES7	1	2021-03-25T19:00:00.000Z	2021-03-19 03:53:45.87+00	t	2021-03-19 05:41:56.207
200	3	UberEats	$12 off with minimum $20 order	1	2021-04-15T19:00:00.000Z	2021-04-10 02:28:00.887+00	t	2021-04-10 02:28:00.887
199	3	85C Cafe	1 free M Sea Salt drink, redeem in app	1	2021-04-30T19:00:00.000Z	2021-04-09 00:06:29.298+00	t	2021-04-09 00:06:29.298
201	3	Chipotle	1 free entree, redeem in app	1	2021-06-20T19:00:00.000Z	2021-04-21 05:05:53.647+00	t	2021-04-21 05:05:53.647
220	3	Amazon Fresh	$5 off with $15 order, use paper coupon	5	2021-06-22T19:00:00.000Z	2021-06-16 22:01:22.07+00	t	2021-06-16 22:01:22.071
219	3	Hahow	21% off coupon	5	2021-06-30T19:00:00.000Z	2021-06-13 21:30:04.329+00	t	2021-06-13 21:30:04.329
203	3	Marugame Udon	Online order $25 gets $5 off with code: HERITAGE 	1	2021-05-16T19:00:00.000Z	2021-05-14 19:01:47.446+00	t	2021-05-14 19:01:47.455
212	3	Kura Sushi	$5 off coupon	1	2021-06-25T19:00:00.000Z	2021-06-04 16:16:18.356+00	t	2021-06-04 16:16:18.356
223	3	Red Straw	BOGO 50% off	1	2021-07-02T19:00:00.000Z	2021-06-28 04:54:34.009+00	f	2021-06-28 04:54:34.009
206	3	Ding Tea - Tustin	25% off drinks	1	2021-05-28T19:00:00.000Z	2021-05-21 18:39:34.509+00	t	2021-05-21 18:39:34.509
204	3	Caviar	$7 off $15 order with code SUPSEVEN, use Hyatt card if delivery fee low.	1	2021-05-24T19:00:00.000Z	2021-05-14 19:20:01.565+00	t	2021-05-20 04:21:27.407
202	3	Churned Creamery	BOGO with five star app	1	2021-06-03T19:00:00.000Z	2021-05-04 21:06:48.662+00	t	2021-05-04 21:07:11.293
207	3	Weee	$15 off with $35 order	5	2021-05-29T19:00:00.000Z	2021-05-23 00:37:26.55+00	t	2021-05-23 00:37:26.55
208	3	Target	$10 off $50 with Google Pay code	1	2021-07-31T19:00:00.000Z	2021-05-24 19:26:46.086+00	t	2021-05-24 19:26:46.086
210	3	Caviar	25% off pizza order with code PIZZAYUM	1	2021-06-06T19:00:00.000Z	2021-06-02 01:11:49.302+00	t	2021-06-02 01:11:49.302
211	3	El Pollo Loco	30% off order in app	1	2021-06-08T19:00:00.000Z	2021-06-04 16:15:33.352+00	t	2021-06-04 16:15:33.352
213	3	Caviar	$5 off $20 order with code: PRIDE21	1	2021-06-30T19:00:00.000Z	2021-06-05 00:31:38.342+00	t	2021-06-05 00:31:38.342
215	3	China West Express	Lunch BOGO with code FRIEND621	1	2021-06-23T19:00:00.000Z	2021-06-10 21:18:44.684+00	f	2021-06-10 21:18:44.684
214	3	Caviar	$10 off of $25 with code: 10NICEFOOD	1	2021-06-20T19:00:00.000Z	2021-06-07 23:56:53.55+00	t	2021-06-13 17:53:15.412
233	3	Veggie Grill	$5 off birthday coupon	1	2021-08-01T19:00:00.000Z	2021-07-18 20:31:14.279+00	t	2021-07-18 20:31:14.279
221	3	Caviar	20% off with code ESCAPE	1	2021-06-18T19:00:00.000Z	2021-06-17 04:49:51.617+00	f	2021-06-17 04:49:51.617
216	3	DoorDash	25% off with order using code FOODNOWPLEASE	1	2021-06-30T19:00:00.000Z	2021-06-11 19:16:18.078+00	t	2021-06-11 19:16:18.078
205	3	Peet's Coffee	1 free beverage redeem in app	1	2021-07-08T19:00:00.000Z	2021-05-21 18:37:15.253+00	t	2021-06-13 17:51:07.825
224	3	Calvin Klein	20% off reward, can be combined at checkout	5	2021-07-26T19:00:00.000Z	2021-07-01 01:37:50.835+00	t	2021-07-01 01:37:50.836
218	3	Veggie Grill	$10 gift card	1	2021-08-31T19:00:00.000Z	2021-06-13 19:03:17.2+00	t	2021-06-13 19:03:17.2
225	3	Cherubic Tea	$5 off birthday reward, pay with linked card	1	2021-07-31T19:00:00.000Z	2021-07-01 16:59:13.215+00	t	2021-07-01 16:59:13.215
230	3	illy	15% off with code EMAIL15. Use AMEX to get further discount	1	2021-07-25T19:00:00.000Z	2021-07-16 06:55:36.815+00	t	2021-07-16 06:55:36.816
231	3	Amazon Fresh	$10 off with $20 minimum order, use email coupon	5	2021-07-25T19:00:00.000Z	2021-07-17 17:24:26.273+00	t	2021-07-17 17:24:26.273
228	3	豹投資	Pro一個月權限, above4817	5	2021-07-31T19:00:00.000Z	2021-07-10 18:00:22.262+00	t	2021-07-10 18:00:22.263
236	3	Churned Creamery	50% off purchase	1	2021-07-25T19:00:00.000Z	2021-07-18 22:05:35.187+00	t	2021-07-18 22:05:35.188
235	3	Ding Tea - Tustin	B-Day free drink	1	2021-07-25T19:00:00.000Z	2021-07-18 22:05:09.481+00	t	2021-07-18 22:05:09.481
239	3	Weee	$10 off with $35 order	5	2021-07-28T19:00:00.000Z	2021-07-23 06:09:02.755+00	t	2021-07-23 06:09:02.755
227	3	85C Cafe	Birthday free cake	1	2021-07-31T19:00:00.000Z	2021-07-08 21:35:55.31+00	t	2021-07-17 21:17:15.741
234	3	Ding Tea - Irvine	BOGO	1	2021-07-25T19:00:00.000Z	2021-07-18 22:04:28.174+00	t	2021-07-18 22:04:28.174
240	3	Starbucks	Birthday reward: 1 free beverage	1	2021-07-25T19:00:00.000Z	2021-07-23 17:26:25.918+00	t	2021-07-23 17:26:25.918
237	3	Redstraw	1 free birthday drink	1	2021-07-25T19:00:00.000Z	2021-07-18 22:06:23.982+00	t	2021-07-18 22:06:23.982
232	3	El Pollo Loco	$5 off birthday coupon	1	2021-08-01T19:00:00.000Z	2021-07-17 22:31:00.583+00	t	2021-07-22 21:06:04.05
247	3	DoorDash	$10 off with $20 pickup order using code HUNGRY	1	2021-08-02T19:00:00.000Z	2021-07-28 18:59:56.012+00	t	2021-07-28 18:59:56.012
226	3	AMC	1 free birthday beverage and popcorn	4	2021-07-31T19:00:00.000Z	2021-07-08 08:16:26.186+00	t	2021-07-08 08:16:26.187
248	3	AMC	1 free fountain drink	4	2021-09-06T19:00:00.000Z	2021-08-01 04:07:54.326+00	f	2021-08-01 04:07:54.328
241	3	Peet's Coffee	1 free birthday beverage	1	2021-08-08T19:00:00.000Z	2021-07-25 18:19:30.069+00	t	2021-07-25 18:19:30.069
246	3	Boiling Point	$10 off birthday reward	1	2021-08-02T19:00:00.000Z	2021-07-26 05:07:21.838+00	t	2021-07-26 05:07:21.839
229	3	Fast5xpress	1 free silver wash with printed email coupon	5	2021-08-01T19:00:00.000Z	2021-07-10 21:09:44.454+00	t	2021-07-31 00:50:54.477
244	3	Farmer Boys	1 free meal	1	2021-08-09T19:00:00.000Z	2021-07-25 18:30:34.169+00	t	2021-07-25 18:30:34.169
250	3	Caviar	$10 off with $30 order, use code POKE10	1	2021-08-05T19:00:00.000Z	2021-08-04 04:26:10.716+00	t	2021-08-04 04:26:10.716
251	3	IKEA	1 free frozen yogurt	5	2021-08-19T19:00:00.000Z	2021-08-06 16:14:01.842+00	f	2021-08-06 16:14:01.843
242	3	Meet Fresh	$5 off with reward points	1	2021-08-08T19:00:00.000Z	2021-07-25 18:23:13.521+00	t	2021-07-25 18:23:13.521
243	3	Regal Theatre	1 free small popcorn	4	2021-08-22T19:00:00.000Z	2021-07-25 18:28:06.817+00	t	2021-07-25 18:28:06.817
238	3	Dave & Busters	$10 free game play	4	2021-08-17T19:00:00.000Z	2021-07-19 00:40:12.529+00	t	2021-07-19 00:40:12.529
253	3	Peet's Coffee	1 free beverage	1	2021-09-08T19:00:00.000Z	2021-08-10 02:56:06.338+00	f	2021-08-10 02:56:06.338
254	3	Kura Sushi	$5 off with email coupon	1	2021-09-01T19:00:00.000Z	2021-08-11 17:52:54.589+00	f	2021-08-11 17:52:54.59
249	3	Chick-fil-A	1 free chicken sandwich, redeem in app	1	2021-09-01T19:00:00.000Z	2021-08-02 16:48:18.976+00	t	2021-08-02 16:48:18.977
252	3	Amazon Fresh	$10 paper coupon	5	2021-08-29T19:00:00.000Z	2021-08-09 16:56:49.047+00	f	2021-08-22 03:33:54.856
245	3	Panera Bread	$16 credits. Use it with coffee and get another coupon for 2nd order	1	2021-08-28T19:00:00.000Z	2021-07-25 18:36:05.724+00	t	2021-07-29 21:05:24.859
255	3	Caviar	$5 off with $20 order	1	2021-08-16T19:00:00.000Z	2021-08-14 00:29:15.01+00	t	2021-08-14 00:29:15.01
256	3	Target	$5 off with $15 order use paper coupon	5	2021-09-26T19:00:00.000Z	2021-08-27 00:23:28.327+00	f	2021-08-27 00:23:28.327
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.history (history_id, coupon_id, user_id, created_at, used_at, used) FROM stdin;
30	138	3	2020-11-08 02:40:25.155206+00	2020-11-17 05:11:43.509+00	t
10	118	3	2020-10-06 23:35:00.398168+00	\N	f
7	115	3	2020-10-06 23:27:55.302336+00	\N	f
14	122	3	2020-10-06 23:42:15.818246+00	2020-10-06 23:47:58.653+00	t
18	126	20	2020-10-07 00:00:05.718127+00	\N	f
19	127	20	2020-10-07 00:01:06.858769+00	\N	f
20	128	20	2020-10-07 00:01:59.19764+00	\N	f
21	129	20	2020-10-07 00:02:46.625173+00	\N	f
23	131	20	2020-10-07 00:05:05.5609+00	\N	f
24	132	20	2020-10-07 00:07:56.070512+00	\N	f
13	121	3	2020-10-06 23:40:54.227678+00	2020-10-14 18:36:17.014+00	t
27	135	3	2020-10-21 21:24:35.928873+00	\N	f
28	136	3	2020-10-21 21:54:47.883094+00	\N	f
12	120	3	2020-10-06 23:38:47.466097+00	2020-10-26 23:14:48.505+00	t
46	154	20	2020-11-17 06:16:49.063478+00	\N	f
29	137	3	2020-11-08 02:37:39.006753+00	\N	f
32	140	20	2020-11-12 22:46:50.310997+00	\N	f
26	134	20	2020-10-07 00:12:00.420773+00	\N	f
33	141	20	2020-11-12 23:55:19.195848+00	\N	f
34	142	20	2020-11-13 00:04:36.685124+00	\N	f
35	143	20	2020-11-13 00:16:09.428122+00	\N	f
36	144	20	2020-11-13 00:28:02.823956+00	\N	f
17	125	20	2020-10-06 23:59:24.645181+00	2020-11-13 00:29:02.339+00	t
38	146	3	2020-11-15 05:38:28.407078+00	\N	f
44	152	20	2020-11-17 05:20:26.002624+00	2020-11-18 06:57:14.411+00	t
41	149	20	2020-11-17 05:14:44.20706+00	2020-11-18 06:57:16.734+00	t
22	130	20	2020-10-07 00:04:24.286946+00	2020-11-18 06:57:16.959+00	t
16	124	20	2020-10-06 23:58:32.732415+00	2020-11-18 06:57:18.247+00	t
47	155	20	2020-11-18 06:59:19.030069+00	2020-11-18 06:59:33.561+00	t
48	156	20	2020-11-18 07:00:02.789973+00	\N	f
39	147	3	2020-11-16 21:19:42.389887+00	2020-11-19 18:21:38.67+00	t
50	158	3	2020-11-19 19:46:04.308872+00	\N	f
40	148	3	2020-11-16 22:55:39.171674+00	2020-11-25 01:24:37.489+00	t
31	139	3	2020-11-08 02:43:57.061479+00	2020-11-25 22:35:29.869+00	t
51	159	3	2020-11-20 18:59:05.195058+00	2020-11-28 23:11:43.011+00	t
6	114	3	2020-10-06 23:26:05.126372+00	2020-11-28 23:11:50.817+00	t
56	164	3	2020-12-05 20:43:29.771287+00	2020-12-05 20:43:34.37+00	t
54	162	3	2020-12-02 00:52:44.507483+00	2020-12-05 21:55:47.314+00	t
57	165	3	2020-12-05 20:43:53.756104+00	\N	f
58	166	3	2020-12-07 20:24:14.50271+00	2020-12-11 18:34:25.622+00	t
99	207	3	2021-05-23 00:37:26.555255+00	2021-05-26 01:52:10.492+00	t
63	171	20	2020-12-11 23:35:45.199636+00	\N	f
77	185	3	2021-01-26 22:05:46.633272+00	2021-01-31 04:27:00.526+00	t
45	153	20	2020-11-17 05:20:58.106272+00	\N	f
25	133	20	2020-10-07 00:10:21.183801+00	\N	f
15	123	20	2020-10-06 23:57:29.343661+00	\N	f
43	151	20	2020-11-17 05:18:59.899445+00	\N	f
42	150	20	2020-11-17 05:16:10.424521+00	\N	f
92	200	3	2021-04-10 02:28:00.89567+00	2021-04-12 22:18:20.743+00	t
49	157	3	2020-11-19 18:23:30.15824+00	2020-12-19 21:06:55.973+00	t
37	145	3	2020-11-15 05:12:10.392995+00	2020-12-19 21:07:18.647+00	t
78	186	3	2021-01-29 01:58:09.339799+00	2021-02-05 00:56:11.947+00	t
8	116	3	2020-10-06 23:29:46.79727+00	2020-12-24 20:44:18.497+00	t
69	177	3	2020-12-17 22:29:15.673869+00	2020-12-24 20:44:28.71+00	t
115	223	3	2021-06-28 04:54:34.018419+00	\N	f
52	160	3	2020-11-29 01:40:08.799022+00	2020-12-25 00:04:26.737+00	t
67	175	3	2020-12-15 19:42:01.555645+00	2020-12-26 08:22:49.116+00	t
71	179	3	2020-12-21 22:17:47.136559+00	2020-12-28 05:51:37.789+00	t
68	176	3	2020-12-16 18:44:22.483977+00	2020-12-30 20:57:56.618+00	t
53	161	3	2020-12-01 02:54:00.614631+00	2020-12-30 20:57:59.863+00	t
73	181	3	2020-12-30 05:31:59.50993+00	2020-12-31 18:37:43.613+00	t
9	117	3	2020-10-06 23:32:40.456128+00	2021-01-04 18:12:27.187+00	t
76	184	3	2021-01-14 00:36:59.607776+00	\N	f
70	178	3	2020-12-21 19:24:06.564327+00	2021-01-16 05:33:30.812+00	t
74	182	3	2020-12-30 22:15:09.896285+00	2021-01-23 23:02:05.266+00	t
80	188	3	2021-02-05 01:00:41.507997+00	\N	f
55	163	3	2020-12-05 01:16:15.595274+00	2021-02-08 07:18:26.504+00	t
88	196	3	2021-03-14 18:47:54.459038+00	2021-04-21 05:05:03.39+00	t
81	189	3	2021-02-06 06:34:38.056878+00	2021-02-14 09:04:43.967+00	t
91	199	3	2021-04-09 00:06:29.300177+00	2021-04-29 22:34:16.691+00	t
60	168	20	2020-12-11 23:33:06.261194+00	\N	f
93	201	3	2021-04-21 05:05:53.649352+00	2021-05-03 23:33:24.534+00	t
62	170	20	2020-12-11 23:35:10.39078+00	\N	f
82	190	3	2021-02-12 22:45:27.88828+00	2021-02-19 21:57:55.978+00	t
100	208	3	2021-05-24 19:26:46.089085+00	2021-05-31 08:22:43.932+00	t
86	194	3	2021-03-10 02:29:23.398294+00	2021-03-12 17:24:27.821+00	t
83	191	3	2021-02-18 23:59:35.987598+00	2021-03-13 19:45:33.651+00	t
85	193	3	2021-02-28 19:54:42.651613+00	2021-03-14 04:43:16.087+00	t
79	187	3	2021-02-01 23:37:44.556657+00	2021-03-15 00:52:32.012+00	t
84	192	3	2021-02-28 19:25:33.420809+00	2021-03-18 21:00:14.748+00	t
89	197	3	2021-03-15 16:50:43.790053+00	2021-03-21 20:04:07.917+00	t
90	198	3	2021-03-19 03:53:45.872428+00	2021-03-26 00:14:08.863+00	t
72	180	3	2020-12-24 20:46:40.878662+00	2021-03-27 05:16:27.794+00	t
75	183	3	2021-01-05 18:31:17.996713+00	2021-04-03 04:05:34.778+00	t
87	195	3	2021-03-13 02:12:27.781034+00	2021-04-09 00:04:10.684+00	t
102	210	3	2021-06-02 01:11:49.304934+00	2021-06-04 19:30:19.808+00	t
95	203	3	2021-05-14 19:01:47.468214+00	2021-05-15 01:53:07.06+00	t
64	172	20	2020-12-11 23:37:18.399944+00	2021-08-16 19:43:26.788+00	t
118	226	3	2021-07-08 08:16:26.195751+00	2021-08-01 00:07:20.337+00	t
65	173	20	2020-12-11 23:39:48.052375+00	\N	f
66	174	20	2020-12-11 23:41:13.36753+00	\N	f
98	206	3	2021-05-21 18:39:34.512117+00	2021-05-24 00:40:24.859+00	t
96	204	3	2021-05-14 19:20:01.568171+00	2021-05-24 19:06:27.48+00	t
94	202	3	2021-05-04 21:06:48.669574+00	2021-05-25 01:24:02.622+00	t
103	211	3	2021-06-04 16:15:33.364205+00	2021-06-08 20:43:30.622+00	t
105	213	3	2021-06-05 00:31:38.345102+00	2021-06-10 21:17:37.026+00	t
107	215	3	2021-06-10 21:18:44.686687+00	\N	f
106	214	3	2021-06-07 23:56:53.563671+00	2021-06-16 04:35:29.253+00	t
116	224	3	2021-07-01 01:37:50.843338+00	2021-07-06 05:06:41.186+00	t
108	216	3	2021-06-11 19:16:18.085867+00	2021-06-19 21:11:22.398+00	t
109	217	3	2021-06-12 23:25:46.878756+00	\N	f
113	221	3	2021-06-17 04:49:51.619479+00	\N	f
114	222	3	2021-06-19 05:23:03.561609+00	\N	f
101	209	3	2021-05-25 17:32:35.258078+00	2021-06-21 05:22:52.222+00	t
112	220	3	2021-06-16 22:01:22.08149+00	2021-06-23 04:07:51.984+00	t
111	219	3	2021-06-13 21:30:04.331815+00	2021-06-23 07:40:30.722+00	t
104	212	3	2021-06-04 16:16:18.358841+00	2021-06-25 06:46:57.755+00	t
11	119	3	2020-10-06 23:37:21.245011+00	2021-06-26 23:43:54.321+00	t
97	205	3	2021-05-21 18:37:15.258236+00	2021-07-04 18:45:53.062+00	t
110	218	3	2021-06-13 19:03:17.202827+00	2021-07-08 05:45:31.98+00	t
117	225	3	2021-07-01 16:59:13.22111+00	2021-07-11 03:29:14.766+00	t
124	232	3	2021-07-17 22:31:00.589291+00	2021-07-28 04:23:17.291+00	t
122	230	3	2021-07-16 06:55:36.822008+00	2021-07-18 04:07:13.637+00	t
119	227	3	2021-07-08 21:35:55.316562+00	2021-07-24 17:38:58.559+00	t
125	233	3	2021-07-18 20:31:14.282247+00	2021-07-22 21:05:25.304+00	t
123	231	3	2021-07-17 17:24:26.279975+00	2021-07-22 21:05:38.545+00	t
120	228	3	2021-07-10 18:00:22.270083+00	2021-07-31 00:13:28.517+00	t
61	169	20	2020-12-11 23:34:42.442265+00	2021-08-05 18:08:28.885+00	t
121	229	3	2021-07-10 21:09:44.463667+00	2021-08-02 04:22:44.472+00	t
128	236	3	2021-07-18 22:05:35.19009+00	2021-07-24 02:01:03.449+00	t
127	235	3	2021-07-18 22:05:09.483205+00	2021-07-24 02:01:05.675+00	t
131	239	3	2021-07-23 06:09:02.762869+00	2021-07-24 06:53:29.685+00	t
126	234	3	2021-07-18 22:04:28.178597+00	2021-07-24 23:37:37.516+00	t
132	240	3	2021-07-23 17:26:25.924048+00	2021-07-25 18:19:03.44+00	t
129	237	3	2021-07-18 22:06:23.984957+00	2021-07-26 03:32:14.812+00	t
139	247	3	2021-07-28 18:59:56.02009+00	2021-07-31 00:50:35.505+00	t
140	248	3	2021-08-01 04:07:54.350847+00	\N	f
133	241	3	2021-07-25 18:19:30.072906+00	2021-08-01 18:49:19.745+00	t
138	246	3	2021-07-26 05:07:21.841411+00	2021-08-01 22:35:46.902+00	t
136	244	3	2021-07-25 18:30:34.171341+00	2021-08-04 04:25:05.864+00	t
142	250	3	2021-08-04 04:26:10.718657+00	2021-08-05 19:46:37.471+00	t
143	251	3	2021-08-06 16:14:01.84876+00	\N	f
134	242	3	2021-07-25 18:23:13.523584+00	2021-08-07 02:15:33.874+00	t
135	243	3	2021-07-25 18:28:06.82005+00	2021-08-08 00:12:48.16+00	t
130	238	3	2021-07-19 00:40:12.532049+00	2021-08-09 02:51:21.666+00	t
145	253	3	2021-08-10 02:56:06.342043+00	\N	f
146	254	3	2021-08-11 17:52:54.597438+00	\N	f
137	245	3	2021-07-25 18:36:05.726962+00	2021-08-11 20:03:01.867+00	t
147	255	3	2021-08-14 00:29:15.019104+00	2021-08-15 22:48:58.269+00	t
59	167	20	2020-12-11 23:32:31.163917+00	2021-08-16 19:43:25.539+00	t
141	249	3	2021-08-02 16:48:18.984007+00	2021-08-17 22:03:27.479+00	t
144	252	3	2021-08-09 16:56:49.050791+00	\N	f
148	256	3	2021-08-27 00:23:28.33531+00	\N	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, name, email, password, created_at, avatar_url, profile_image) FROM stdin;
14	Saul Goodman 	saul.goodman@gmail.com	$2a$10$NvJFgduLFK0XL3mgoZIlpeZjk2jDr0PCroaRm1G1vVcfSlPbFU.Ey	2020-07-11 19:53:17.200468+00	//www.gravatar.com/avatar/aac176fab8e73c7d64194e44ac671e75?s=200&r=pg&d=mm	\N
15	Debra	debrachiang1019@gmail.com	$2a$10$a4M9pKwCX/X09PAkWJkceu7lUGDU4OPwiKRaYMPT6qbxg9mwbXXoi	2020-07-25 00:09:13.743006+00	//www.gravatar.com/avatar/4fd86c5a36aa4fb6a5bbcbc13f685258?s=200&r=pg&d=mm	\N
20	John Doe	guest@demo.com	$2a$10$pZmzCljZAilxwtiyu5PbFuUhQM9HALumxQazq3SRkWhR/Z6hqI1cy	2020-09-07 23:50:27.372952+00	//www.gravatar.com/avatar/52f88efd0890e268fe8f4486c1a3e16a?s=200&r=pg&d=mm	\N
23	Good Guy	g.guy@gmail.com	$2a$10$URP1C5CeBfAry5BhA6y10.BrSTumIFuRvvl/Vr.KaWhMPcy3Qm3A.	2020-11-13 00:05:57.492211+00	//www.gravatar.com/avatar/a011a81a716a15dd9bde43e416a037b3?s=200&r=pg&d=mm	scp/images/userProfile/701d717f-1e57-4f0e-9e62-922326b8e171-peopleimages.com-46529-zoom.jpg
24	Good Guy	gg@gmail.com	$2a$10$SAyHHFv9COwFdr/Dl6hceuwiShq0KqZ6NfeRGxThucrM4VZcrZSae	2020-11-13 00:17:40.697183+00	//www.gravatar.com/avatar/1208cd4bab8dd8c03d1ba8f20fb891dd?s=200&r=pg&d=mm	scp/images/userProfile/08300603-cd21-4979-9b09-83784482a150-peopleimages.com-46529-zoom.jpg
25	Good Guy	ggg@gmail.com	$2a$10$BY2MXAZDJ0Ey7SOZ7AqYy.Csn1ERovLgFUuHJN4ZhtbMIkUmPFZti	2020-11-13 00:29:35.894837+00	//www.gravatar.com/avatar/09cb98c3f027fbc9f7041222c78dcc59?s=200&r=pg&d=mm	scp/images/userProfile/ab900738-8684-4fb6-b751-7d1782f18da9-borat.jpg
3	Elvis Lee	elvislee0725@gmail.com	$2a$10$PhfUE.rJdnFQeEDKQ8ELyOdTxqYsZCzX5YUdJJmCzIz7KRjiDMyM6	2020-06-14 21:44:45.123988+00	//www.gravatar.com/avatar/aaf2b27e19c09ec4a8173b0c0723e106?s=200&r=pg&d=mm	scp/images/userProfile/be24f799-67a3-4d0a-8ad0-874fbdfe2fae-profile1.jpg
22	Good Guy	1234@gmail.com	$2a$10$AX3hl1ddgp1ovVjCbkd6seo7eoA/MA8E/C4RPbWpd464ir/BOHO9C	2020-11-12 23:05:03.544726+00	//www.gravatar.com/avatar/4819d3a8c96a5e77aee4838660c8d26b?s=200&r=pg&d=mm	scp/images/userProfile/0ec8aa2f-f187-4dac-b0bf-c4a0e80bf457-peopleimages.com-46529-zoom.jpg
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 5, true);


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupons_coupon_id_seq', 256, true);


--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.history_history_id_seq', 148, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 25, true);


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

