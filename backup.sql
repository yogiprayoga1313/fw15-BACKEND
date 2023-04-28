--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-28 13:31:32

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 32812)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32811)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 32918)
-- Name: citites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citites (
    id integer NOT NULL,
    picture character varying(255),
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.citites OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32917)
-- Name: citites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.citites ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.citites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 32838)
-- Name: eventCategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."eventCategories" (
    id integer NOT NULL,
    "eventId" character varying(255),
    "categoryId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."eventCategories" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32837)
-- Name: eventCategories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."eventCategories" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventCategories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 32828)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    picture character varying(255),
    title character varying(255),
    date date,
    "cityId" integer,
    descriptions text,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone,
    "categoriesId" integer,
    "createdBy" integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32827)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.events ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 32956)
-- Name: forgotRequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."forgotRequest" (
    id integer NOT NULL,
    email character varying(255),
    code character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."forgotRequest" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 32955)
-- Name: forgotRequest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."forgotRequest" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."forgotRequest_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 32845)
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    picture character varying(255),
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32844)
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.partners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 32870)
-- Name: paymentMethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."paymentMethod" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."paymentMethod" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32869)
-- Name: paymentMethod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."paymentMethod" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."paymentMethod_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 32803)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    picture character varying(255),
    "fullName" character varying(255),
    "phoneNumber" character varying(255),
    gender boolean,
    profession character varying(255),
    nationality character varying(255),
    "birthDate" date,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone,
    "userId" integer
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32802)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 32854)
-- Name: reservationSection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."reservationSection" (
    id integer NOT NULL,
    name character varying(255),
    price character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."reservationSection" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32853)
-- Name: reservationSection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."reservationSection" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationSection_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 32863)
-- Name: reservationStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."reservationStatus" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."reservationStatus" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32862)
-- Name: reservationStatus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."reservationStatus" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationStatus_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 32884)
-- Name: reservationTickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."reservationTickets" (
    id integer NOT NULL,
    "reservationId" integer,
    "sectionId" integer,
    quantity integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."reservationTickets" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 32883)
-- Name: reservationTickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."reservationTickets" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationTickets_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 32877)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "statusId" integer,
    "paymentMethod" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 32949)
-- Name: reservationsTickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."reservationsTickets" (
    id integer NOT NULL,
    "reservationId" integer,
    "sectionId" integer,
    quantity integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."reservationsTickets" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 32948)
-- Name: reservationsTickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."reservationsTickets" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationsTickets_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 32876)
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reservations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 32938)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 32937)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 32784)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32783)
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.wishlist ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3438 (class 0 OID 32812)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, "createdAt", "updateAt") FROM stdin;
4	Film 	2023-04-19 13:25:00.417716	\N
3	Action	2023-04-13 20:19:55.655459	\N
\.


--
-- TOC entry 3456 (class 0 OID 32918)
-- Dependencies: 238
-- Data for Name: citites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citites (id, picture, name, "createdAt", "updateAt") FROM stdin;
20	1681610335982.jpg	majenang	2023-04-14 14:49:31.16016	\N
17	1681887234639.jpg	bandung	2023-04-14 12:41:01.820179	\N
12	1681887283603.jpg	jogja	2023-04-14 08:37:58.599607	\N
\.


--
-- TOC entry 3442 (class 0 OID 32838)
-- Dependencies: 224
-- Data for Name: eventCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."eventCategories" (id, "eventId", "categoryId", "createdAt", "updateAt") FROM stdin;
4	idul fitri	2024	2023-04-16 10:23:52.379641	\N
\.


--
-- TOC entry 3440 (class 0 OID 32828)
-- Dependencies: 222
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, picture, title, date, "cityId", descriptions, "createdAt", "updateAt", "categoriesId", "createdBy") FROM stdin;
4	1681962380362.jpg	New events	2023-01-02	12	test new events	2023-04-20 10:46:20.553499	\N	4	\N
2	1681465248055.jpg	evnets 1	2023-01-01	20	ahjdadjkadahdjadma	2023-04-14 16:40:48.218535	\N	3	\N
1	1681478014258.jpeg	hmm	2023-10-10	17	hahahahahahahaahha	2023-04-14 16:33:23.615754	\N	3	\N
5	1682513945557.jpg	Expo	2022-03-13	20	hoyeahhhhh	2023-04-26 19:59:05.694397	\N	3	18
6	1682514521381.jpg	Expo	2022-03-13	20	hoyeahhhhh	2023-04-26 20:08:41.510972	\N	\N	18
7	1682514605750.jpg	Expo	2022-03-13	20	hoyeahhhhh	2023-04-26 20:10:05.912966	\N	\N	18
8	1682516473576.jpeg	IDE	2022-03-13	20	jiabngssssss	2023-04-26 20:11:43.711022	\N	3	18
\.


--
-- TOC entry 3462 (class 0 OID 32956)
-- Dependencies: 244
-- Data for Name: forgotRequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."forgotRequest" (id, email, code, "createdAt", "updateAt") FROM stdin;
1	newacc@mail.com	450810	2023-04-18 15:45:11.100129	\N
2	newacc@mail.com	887430	2023-04-18 16:19:54.443702	\N
3	newacc@mail.com	271290	2023-04-18 16:22:30.587105	\N
4	newacc@mail.com	321700	2023-04-18 16:23:46.994997	\N
5	newacc@mail.com	893300	2023-04-18 16:24:13.991993	\N
6	newacc@mail.com	233750	2023-04-18 16:27:16.698371	\N
7	newacc@mail.com	443930	2023-04-18 16:28:11.980752	\N
8	newacc@mail.com	179310	2023-04-18 16:30:46.834339	\N
9	newacc@mail.com	205320	2023-04-18 16:35:41.641227	\N
10	newacc@mail.com	830930	2023-04-18 16:37:32.030304	\N
11	newacc@mail.com	944260	2023-04-18 16:38:33.037639	\N
12	newacc@mail.com	163130	2023-04-18 16:41:57.343093	\N
\.


--
-- TOC entry 3444 (class 0 OID 32845)
-- Dependencies: 226
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, picture, name, "createdAt", "updateAt") FROM stdin;
2	1681481668489.jpeg	binance	2023-04-14 21:14:28.494336	\N
\.


--
-- TOC entry 3450 (class 0 OID 32870)
-- Dependencies: 232
-- Data for Name: paymentMethod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."paymentMethod" (id, name, "createdAt", "updateAt") FROM stdin;
2	dana	2023-04-15 13:03:23.028047	\N
4	Credit Card	2023-04-15 13:04:13.424564	\N
5	Credit Card	2023-04-16 09:38:44.356427	\N
1	QRIS	2023-04-15 13:03:07.128622	\N
\.


--
-- TOC entry 3436 (class 0 OID 32803)
-- Dependencies: 218
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, picture, "fullName", "phoneNumber", gender, profession, nationality, "birthDate", "createdAt", "updateAt", "userId") FROM stdin;
16	1681713472867.jpg	aminudin	343434344	f	developers	IND	1998-01-13	2023-04-17 13:34:34.117495	\N	10
17	\N	adminuser2	\N	\N	\N	\N	\N	2023-04-17 15:47:49.327113	\N	15
18	1681827364535.jpg	Yogi Prayoga	087676767	t	Developers	indo	1998-01-13	2023-04-18 15:44:08.602872	\N	16
19	1682478887142.jpg	dewaonlyfans	087676767	t	ceo	indo	1998-01-13	2023-04-18 21:27:58.552312	\N	17
20	\N	newacc 1	\N	\N	\N	\N	\N	2023-04-26 19:24:46.247042	\N	18
\.


--
-- TOC entry 3446 (class 0 OID 32854)
-- Dependencies: 228
-- Data for Name: reservationSection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationSection" (id, name, price, "createdAt", "updateAt") FROM stdin;
3	yogi	online	2023-04-15 12:10:18.273376	\N
4	dewa	online	2023-04-15 12:10:22.577129	\N
6	new acc	online	2023-04-15 12:10:39.655946	\N
2	amin new	offline	2023-04-15 12:08:16.530809	\N
1	not present	\N	2023-04-15 12:08:02.464262	\N
\.


--
-- TOC entry 3448 (class 0 OID 32863)
-- Dependencies: 230
-- Data for Name: reservationStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationStatus" (id, name, "createdAt", "updateAt") FROM stdin;
1	present	2023-04-15 12:36:11.462988	\N
3	not present	2023-04-15 12:39:25.271316	\N
4	not present	2023-04-15 12:39:28.188247	\N
5	not present	2023-04-15 12:39:30.441789	\N
6	not present	2023-04-15 12:39:32.672781	\N
7	not present	2023-04-15 12:39:35.121464	\N
8	parents	2023-04-16 09:33:15.616852	\N
\.


--
-- TOC entry 3454 (class 0 OID 32884)
-- Dependencies: 236
-- Data for Name: reservationTickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationTickets" (id, "reservationId", "sectionId", quantity, "createdAt", "updateAt") FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 32877)
-- Dependencies: 234
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (id, "eventId", "userId", "statusId", "paymentMethod", "createdAt", "updateAt") FROM stdin;
2	12345	23455	11155	123	2023-04-15 14:50:37.94404	\N
3	12345	23455	11155	123	2023-04-15 14:58:23.889897	\N
4	1234	1234	1234	1234	2023-04-15 15:00:01.427841	\N
\.


--
-- TOC entry 3460 (class 0 OID 32949)
-- Dependencies: 242
-- Data for Name: reservationsTickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationsTickets" (id, "reservationId", "sectionId", quantity, "createdAt", "updateAt") FROM stdin;
3	\N	1	1	2023-04-16 09:50:51.627675	\N
4	1	1	1	2023-04-16 09:51:40.681027	\N
\.


--
-- TOC entry 3458 (class 0 OID 32938)
-- Dependencies: 240
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, "createdAt", "updateAt") FROM stdin;
10	amin udin	aminudinbaru@mail.com	$argon2id$v=19$m=65536,t=3,p=4$4knFzJVeZrY0Z3nFRBJORg$ewDl3Gs7aqBGXBal7p5ICtb6g2SujJP4mCNC3T+dOfI	2023-04-17 13:34:34.020945	\N
15	\N	adminuser2@mail.com	$argon2id$v=19$m=65536,t=3,p=4$C0ClOvcvNeu8/ghRiMC/6Q$L2jheZP2302Y+xSNmdMIXXrnwLdrWu4c/yjeQegDLks	2023-04-17 15:47:49.274396	\N
16	\N	newacc@mail.com	$argon2id$v=19$m=65536,t=3,p=4$7GDPeYHBA5yW+PSJOfDobw$yb2z1cH05v/sbaw37pDW7fCc+ms6F+vHsKywxaDDMAI	2023-04-18 15:44:08.551171	\N
17	\N	dewaonly@mail.com	$argon2id$v=19$m=65536,t=3,p=4$ypkWmKj5LhyY9XL2va+BiA$RdxuyNCuMR6KR/y7hWGY4Zr9Ekhy858ne2RQcStvCbk	2023-04-18 21:27:58.502287	\N
18	\N	newacc1@mail.com	$argon2id$v=19$m=65536,t=3,p=4$d0/Jb8+5rNg+lPQKxtAthg$XnsXfooXIjiDLviDzKb/Gh+NPx8HgAuT2saegcvzCYM	2023-04-26 19:24:46.235171	\N
\.


--
-- TOC entry 3434 (class 0 OID 32784)
-- Dependencies: 216
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, "eventId", "userId", "createdAt", "updateAt") FROM stdin;
2	12	12	2023-04-15 21:56:39.53662	\N
5	1	1	2023-04-16 10:03:36.731845	\N
4	123	123	2023-04-15 22:02:52.137028	\N
6	\N	17	2023-04-26 18:57:01.077964	\N
7	4	17	2023-04-26 19:03:10.272611	\N
8	1	17	2023-04-26 19:10:55.020558	\N
9	1	17	2023-04-26 19:20:44.378486	\N
10	2	17	2023-04-26 19:24:07.722595	\N
11	2	18	2023-04-26 19:25:18.247588	\N
\.


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 4, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 237
-- Name: citites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citites_id_seq', 20, true);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 223
-- Name: eventCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."eventCategories_id_seq"', 4, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 8, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 243
-- Name: forgotRequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."forgotRequest_id_seq"', 12, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 225
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 2, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 231
-- Name: paymentMethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."paymentMethod_id_seq"', 5, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 217
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 20, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 227
-- Name: reservationSection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationSection_id_seq"', 6, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 229
-- Name: reservationStatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationStatus_id_seq"', 8, true);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 235
-- Name: reservationTickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationTickets_id_seq"', 1, false);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 241
-- Name: reservationsTickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationsTickets_id_seq"', 4, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 233
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_id_seq', 4, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 239
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 18, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 215
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 11, true);


--
-- TOC entry 3264 (class 2606 OID 32817)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 32925)
-- Name: citites citites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citites
    ADD CONSTRAINT citites_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 32843)
-- Name: eventCategories eventCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."eventCategories"
    ADD CONSTRAINT "eventCategories_pkey" PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 32835)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 32963)
-- Name: forgotRequest forgotRequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."forgotRequest"
    ADD CONSTRAINT "forgotRequest_pkey" PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 32852)
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 32875)
-- Name: paymentMethod paymentMethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentMethod"
    ADD CONSTRAINT "paymentMethod_pkey" PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 32810)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 32861)
-- Name: reservationSection reservationSection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationSection"
    ADD CONSTRAINT "reservationSection_pkey" PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 32868)
-- Name: reservationStatus reservationStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationStatus"
    ADD CONSTRAINT "reservationStatus_pkey" PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 32889)
-- Name: reservationTickets reservationTickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationTickets"
    ADD CONSTRAINT "reservationTickets_pkey" PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 32954)
-- Name: reservationsTickets reservationsTickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationsTickets"
    ADD CONSTRAINT "reservationsTickets_pkey" PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 32882)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 32947)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3286 (class 2606 OID 32945)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 32789)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


-- Completed on 2023-04-28 13:31:33

--
-- PostgreSQL database dump complete
--

