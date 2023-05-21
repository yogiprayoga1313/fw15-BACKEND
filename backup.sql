--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-21 15:15:11

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
-- TOC entry 3458 (class 0 OID 0)
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
-- TOC entry 236 (class 1259 OID 32918)
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
-- TOC entry 235 (class 1259 OID 32917)
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
-- TOC entry 242 (class 1259 OID 32956)
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
-- TOC entry 241 (class 1259 OID 32955)
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
-- TOC entry 234 (class 1259 OID 32877)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "statusId" integer,
    "paymentMethodId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 32949)
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
-- TOC entry 239 (class 1259 OID 32948)
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
-- TOC entry 238 (class 1259 OID 32938)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "userName" character varying(255),
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 32937)
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
-- TOC entry 3430 (class 0 OID 32812)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, "createdAt", "updateAt") FROM stdin;
9	Music	2023-05-06 09:26:52.75873	\N
11	Outdoors	2023-05-06 09:27:14.085722	\N
12	Workshop	2023-05-06 09:27:25.700615	\N
13	Sport	2023-05-06 09:33:12.930457	\N
14	Festival	2023-05-06 09:33:27.950371	\N
15	Fashion	2023-05-06 09:33:37.086023	\N
10	Arts	2023-05-06 09:26:59.311059	\N
\.


--
-- TOC entry 3446 (class 0 OID 32918)
-- Dependencies: 236
-- Data for Name: citites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citites (id, picture, name, "createdAt", "updateAt") FROM stdin;
31	1683332305154.jpg	Bandung	2023-05-06 07:18:25.478123	\N
32	1683332327407.jpg	Bali	2023-05-06 07:18:47.797424	\N
33	1683332351464.jpg	Aceh	2023-05-06 07:19:11.89804	\N
34	1683332370402.jpg	Solo	2023-05-06 07:19:30.795402	\N
35	1683332397802.jpg	Yogyakarta	2023-05-06 07:19:58.247458	\N
36	1683332416741.jpg	Semarang	2023-05-06 07:20:17.1416	\N
30	1683510729352.jpg	Cilacap	2023-05-06 07:17:57.030222	\N
37	1683511374110.jpeg	Jakarta	2023-05-08 08:49:52.56172	\N
\.


--
-- TOC entry 3434 (class 0 OID 32838)
-- Dependencies: 224
-- Data for Name: eventCategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."eventCategories" (id, "eventId", "categoryId", "createdAt", "updateAt") FROM stdin;
11	28	14	2023-05-06 20:04:39.039829	\N
12	28	14	2023-05-06 20:18:56.848546	\N
13	28	14	2023-05-06 20:18:58.12872	\N
14	28	14	2023-05-06 20:18:59.336917	\N
15	28	14	2023-05-06 20:19:00.594399	\N
\.


--
-- TOC entry 3432 (class 0 OID 32828)
-- Dependencies: 222
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, picture, title, date, "cityId", descriptions, "createdAt", "updateAt", "categoriesId", "createdBy") FROM stdin;
18	1683345050771.jpg	Wedding Jhon & Nina	2023-08-15	35	The wedding invitation for you	2023-05-06 10:50:50.972541	\N	11	\N
19	1683345130585.jpg	Music festival 	2023-04-15	32	Music festival for you	2023-05-06 10:52:10.772661	\N	9	\N
21	1683345300362.jpg	Dieng Culture Festival	2023-05-30	34	Festival for you	2023-05-06 10:55:00.565867	\N	14	\N
22	1683345340251.jpg	Festival Lights	2023-08-03	36	Festival for you	2023-05-06 10:55:40.441631	\N	14	\N
17	1683344026263.jpg	World Cup	2022-01-15	30	Final world cup 	2023-05-06 10:33:46.462225	\N	13	\N
24	1683355080724.jpg	New Year Fashion	2024-01-02	36	Festival for you	2023-05-06 13:38:00.91358	\N	15	\N
25	1683355190268.jpg	New Year Education	2024-04-02	30	Festival for you	2023-05-06 13:39:50.484404	\N	12	\N
20	1683355405198.jpg	Grafity	2023-12-20	32	WTF Music Festival	2023-05-06 10:53:28.910785	\N	10	\N
28	1683378104499.jpg	Dieng Festival	2024-04-02	33	Festival for you	2023-05-06 20:01:44.794654	\N	14	\N
29	1683378106494.jpg	Dieng Festival	2024-04-02	33	Festival for you	2023-05-06 20:01:46.497991	\N	14	\N
30	1683378108001.jpg	Dieng Festival	2024-04-02	33	Festival for you	2023-05-06 20:01:48.005207	\N	14	\N
31	1683378109585.jpg	Dieng Festival	2024-04-02	33	Festival for you	2023-05-06 20:01:49.589957	\N	14	\N
16	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684246098/YogiPrayoga/1684246093449.png	Weeding Jhone & niana	2023-01-03	34	Wedding Invitation	2023-05-06 10:28:08.756135	\N	11	26
\.


--
-- TOC entry 3452 (class 0 OID 32956)
-- Dependencies: 242
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
13	yogiprayoga123@mail.com	473930	2023-05-01 19:27:46.352521	\N
14	aksarakode@mail.com	581640	2023-05-02 16:00:28.714561	\N
15	aksarakode@mail.com	456460	2023-05-08 23:44:38.181642	\N
\.


--
-- TOC entry 3436 (class 0 OID 32845)
-- Dependencies: 226
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, picture, name, "createdAt", "updateAt") FROM stdin;
12	1683365840520.jpg	partner 1	2023-05-06 16:37:20.690511	\N
13	1683365853744.jpg	partner 2	2023-05-06 16:37:33.915517	\N
14	1683365870494.jpg	partner 3	2023-05-06 16:37:50.694636	\N
15	1683365887061.jpg	partner 4	2023-05-06 16:38:07.257713	\N
16	1683365900818.jpg	partner 5	2023-05-06 16:38:21.066924	\N
17	1683365925919.jpg	partner 6	2023-05-06 16:38:46.135099	\N
\.


--
-- TOC entry 3442 (class 0 OID 32870)
-- Dependencies: 232
-- Data for Name: paymentMethod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."paymentMethod" (id, name, "createdAt", "updateAt") FROM stdin;
11	Credit / Debit Card	2023-05-20 15:30:33.80326	\N
12	Bank Transfer	2023-05-20 15:30:33.80326	\N
13	Retail	2023-05-20 15:30:33.80326	\N
14	E-Money	2023-05-20 15:30:33.80326	\N
\.


--
-- TOC entry 3428 (class 0 OID 32803)
-- Dependencies: 218
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, picture, "fullName", "phoneNumber", gender, profession, nationality, "birthDate", "createdAt", "updateAt", "userId") FROM stdin;
17	\N	adminuser2	\N	\N	\N	\N	\N	2023-04-17 15:47:49.327113	\N	15
18	1681827364535.jpg	Yogi Prayoga	087676767	t	Developers	indo	1998-01-13	2023-04-18 15:44:08.602872	\N	16
19	1682478887142.jpg	dewaonlyfans	087676767	t	ceo	indo	1998-01-13	2023-04-18 21:27:58.552312	\N	17
20	\N	newacc 1	\N	\N	\N	\N	\N	2023-04-26 19:24:46.247042	\N	18
21	\N	yogiutama	\N	\N	\N	\N	\N	2023-04-28 13:46:02.009029	\N	19
22	1682871034780.jpg	Yogi Prayoga	088888888	t	CEO	indonesia	1998-01-13	2023-04-30 23:10:35.040765	\N	\N
23	1682945069667.jpg	dewaonly	0813273330099	t	Developers	USA	1998-01-13	2023-05-01 19:27:04.035348	\N	20
24	\N	yogi new	\N	\N	\N	\N	\N	2023-05-02 10:44:38.077311	\N	21
25	\N	yogi prayoga	\N	\N	\N	\N	\N	2023-05-02 13:53:30.860203	\N	22
26	\N	aksara	\N	\N	\N	\N	\N	2023-05-02 15:58:41.404655	\N	24
28	\N	yogi prayoga	\N	\N	\N	\N	\N	2023-05-08 20:15:59.121966	\N	28
31	\N	yogiprayoga	\N	\N	\N	\N	\N	2023-05-09 21:11:14.227589	\N	31
32	\N	aksarakode@mail.com	\N	\N	\N	\N	\N	2023-05-09 21:53:09.709315	\N	32
33	\N	test	\N	\N	\N	\N	\N	2023-05-09 22:18:57.830583	\N	33
34	\N		\N	\N	\N	\N	\N	2023-05-09 22:19:35.643489	\N	34
36	\N	aksara baru	\N	\N	\N	\N	\N	2023-05-12 14:41:28.741943	\N	37
35	YogiPrayoga/1684047844898	yogi	\N	\N	\N	\N	\N	2023-05-10 08:55:56.338755	\N	36
37	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684047980/YogiPrayoga/1684047977107.png	kipak	\N	\N	\N	\N	\N	2023-05-14 10:57:16.268825	\N	38
27	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684547237/YogiPrayoga/1684547232098.png	Yogi Prayoga	00000000	f	Developers	Indonesia	1999-01-13	2023-05-02 15:59:21.423221	\N	26
38	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684549686/YogiPrayoga/1684549681091.png	dewaonly	\N	\N	Developers	Indonesia	\N	2023-05-20 08:49:17.456731	\N	39
39	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684551062/YogiPrayoga/1684551056028.png	anjays	\N	f	Developers	\N	\N	2023-05-20 09:28:51.483061	\N	40
30	\N	user1	\N	f	\N	\N	2023-05-10	2023-05-09 21:09:21.592164	\N	30
29	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684645968/YogiPrayoga/1684645965463.png	user	\N	f	Developers	Indonesia	\N	2023-05-09 21:08:04.684548	\N	29
\.


--
-- TOC entry 3438 (class 0 OID 32854)
-- Dependencies: 228
-- Data for Name: reservationSection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationSection" (id, name, price, "createdAt", "updateAt") FROM stdin;
7	REG, ROW 1	50000	2023-05-20 13:39:48.667816	\N
8	VIP, ROW 2	70000	2023-05-20 13:39:48.667816	\N
9	VVIP, ROW 3	100000	2023-05-20 13:39:48.667816	\N
\.


--
-- TOC entry 3440 (class 0 OID 32863)
-- Dependencies: 230
-- Data for Name: reservationStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationStatus" (id, name, "createdAt", "updateAt") FROM stdin;
9	UNPAID	2023-05-02 00:30:03.663141	\N
10	PAID	2023-05-02 11:17:47.39942	\N
11	EXPIERD	2023-05-02 11:18:02.729048	\N
\.


--
-- TOC entry 3444 (class 0 OID 32877)
-- Dependencies: 234
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservations (id, "eventId", "userId", "statusId", "paymentMethodId", "createdAt", "updateAt") FROM stdin;
13	10	20	\N	\N	2023-05-02 00:41:01.228343	\N
12	10	20	9	10	2023-05-01 20:17:15.661082	\N
11	10	20	9	4	2023-05-01 20:16:47.824064	\N
14	10	21	\N	\N	2023-05-02 14:14:11.745609	\N
15	12	26	10	1	2023-05-02 16:10:42.894252	\N
16	12	26	\N	\N	2023-05-02 21:28:58.958207	\N
17	12	26	10	1	2023-05-02 21:29:11.311187	\N
18	16	\N	\N	\N	2023-05-20 14:55:01.702689	\N
19	16	\N	\N	\N	2023-05-20 14:56:43.121199	\N
20	16	\N	\N	\N	2023-05-20 14:57:19.339888	\N
21	16	\N	\N	\N	2023-05-20 14:57:40.449494	\N
22	16	\N	\N	\N	2023-05-20 14:58:31.351256	\N
25	16	26	1	\N	2023-05-20 16:04:20.802691	\N
26	16	26	1	\N	2023-05-20 16:21:35.882351	\N
24	16	26	2	11	2023-05-20 15:06:57.300007	\N
27	18	29	1	\N	2023-05-21 14:12:54.733807	\N
28	18	29	1	\N	2023-05-21 14:13:11.31668	\N
29	18	29	1	\N	2023-05-21 14:39:09.217078	\N
30	18	29	1	\N	2023-05-21 14:39:18.171817	\N
31	18	29	1	\N	2023-05-21 14:44:20.147517	\N
32	18	29	1	\N	2023-05-21 14:44:37.228118	\N
33	18	29	1	\N	2023-05-21 14:53:16.660701	\N
\.


--
-- TOC entry 3450 (class 0 OID 32949)
-- Dependencies: 240
-- Data for Name: reservationsTickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationsTickets" (id, "reservationId", "sectionId", quantity, "createdAt", "updateAt") FROM stdin;
3	\N	1	1	2023-04-16 09:50:51.627675	\N
4	1	1	1	2023-04-16 09:51:40.681027	\N
5	18	7	2	2023-05-20 14:55:01.707004	\N
6	19	7	2	2023-05-20 14:56:43.139023	\N
7	20	7	2	2023-05-20 14:57:19.350379	\N
8	21	7	2	2023-05-20 14:57:40.452242	\N
9	22	7	2	2023-05-20 14:58:31.359341	\N
10	23	7	2	2023-05-20 14:59:55.493397	\N
11	24	7	2	2023-05-20 15:06:57.302167	\N
12	25	7	2	2023-05-20 16:04:20.805582	\N
13	26	7	2	2023-05-20 16:21:35.892777	\N
14	27	0	0	2023-05-21 14:12:54.739604	\N
15	28	9	1	2023-05-21 14:13:11.321069	\N
16	29	9	1	2023-05-21 14:39:09.229528	\N
17	30	8	1	2023-05-21 14:39:18.173476	\N
18	31	7	2	2023-05-21 14:44:20.158283	\N
19	32	8	1	2023-05-21 14:44:37.239596	\N
20	33	8	1	2023-05-21 14:53:16.673432	\N
\.


--
-- TOC entry 3448 (class 0 OID 32938)
-- Dependencies: 238
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, "userName", email, password, "createdAt", "updateAt") FROM stdin;
36	\N	yogi1333@mail.com	$argon2id$v=19$m=65536,t=3,p=4$jIFzjioEEN/6jBSslVocVQ$4lp5F+2Xx97SI0tDd+uWM/GtHIZUMkNglbevaozF5sc	2023-05-10 08:55:56.332583	\N
10	amin udin	aminudinbaru@mail.com	$argon2id$v=19$m=65536,t=3,p=4$4knFzJVeZrY0Z3nFRBJORg$ewDl3Gs7aqBGXBal7p5ICtb6g2SujJP4mCNC3T+dOfI	2023-04-17 13:34:34.020945	\N
15	\N	adminuser2@mail.com	$argon2id$v=19$m=65536,t=3,p=4$C0ClOvcvNeu8/ghRiMC/6Q$L2jheZP2302Y+xSNmdMIXXrnwLdrWu4c/yjeQegDLks	2023-04-17 15:47:49.274396	\N
16	\N	newacc@mail.com	$argon2id$v=19$m=65536,t=3,p=4$7GDPeYHBA5yW+PSJOfDobw$yb2z1cH05v/sbaw37pDW7fCc+ms6F+vHsKywxaDDMAI	2023-04-18 15:44:08.551171	\N
37	\N	aksarabaru@mail.com	$argon2id$v=19$m=65536,t=3,p=4$LA5mn+N+mWcUyxYc5fSSiA$cKfgzJGB+ULZpkToX/b3h7+85rP5qthX5P5q+ONQSBk	2023-05-12 14:41:28.7349	\N
17	\N	dewaonly@mail.com	$argon2id$v=19$m=65536,t=3,p=4$ypkWmKj5LhyY9XL2va+BiA$RdxuyNCuMR6KR/y7hWGY4Zr9Ekhy858ne2RQcStvCbk	2023-04-18 21:27:58.502287	\N
18	\N	newacc1@mail.com	$argon2id$v=19$m=65536,t=3,p=4$d0/Jb8+5rNg+lPQKxtAthg$XnsXfooXIjiDLviDzKb/Gh+NPx8HgAuT2saegcvzCYM	2023-04-26 19:24:46.235171	\N
19	\N	yogiutama@mail.com	$argon2id$v=19$m=65536,t=3,p=4$htBKoG/SSZD36SB/A4wvaA$DPWRaFLrJP0PZIZ8nVq0qRYyrOOFl4qw3TCpE234iV8	2023-04-28 13:46:01.982601	\N
40	\N	kipak10@mail.com	$argon2id$v=19$m=65536,t=3,p=4$/7ZdRTxgU2/H5Fbsg8p1VA$F1/afvEB4FyE7JqSv7vZJ8MsROVCO+i09vB5Cd3eu0A	2023-05-20 09:28:51.47216	\N
20	\N	yogiprayoga123@mail.com	$argon2id$v=19$m=65536,t=3,p=4$H5qozOdknoMc44LhkD4Z4w$3hgpKcKiSGtLFJ+HzReG64v0QwIWdfUk8MD42dUS19s	2023-05-01 19:27:04.032219	\N
21	\N	yoginew1234@mail.com	$argon2id$v=19$m=65536,t=3,p=4$ow3sMwc6GXG0hJy2ct0TWA$6jJRSx/9C8zujfs1bt+VcxPSLAs0UYANPz/3qYrfbLw	2023-05-02 10:44:38.06679	\N
22	\N	yogiprayoga123mail.com	$argon2id$v=19$m=65536,t=3,p=4$iPdisoEDMb9HNYh5MwvEzQ$hDq9I4DhP/YkV3JQ9bSE2zg2JaWQfMvsytFIP4L1GwA	2023-05-02 13:53:30.857403	\N
24	\N	aksara@mail.com	$argon2id$v=19$m=65536,t=3,p=4$NYOqgpfeQ5vKjW9+r0AlRA$fsbmyJIwkWFGGS4UMbpZPT87MSYhpy8MAierbKPGLi8	2023-05-02 15:58:41.393267	\N
38	\N	kipak@mail.com	$argon2id$v=19$m=65536,t=3,p=4$sLsn1+vLzj/ydALx476Llg$LLZquL7vKdI6utyKWBe8PIx5jEWxL4jsCHM62ithQ1E	2023-05-14 10:57:16.266205	\N
28	\N	yogiprayoga1234@mail.com	$argon2id$v=19$m=65536,t=3,p=4$MlgoKQ3djsMrKZfHshC1EA$GSFk+JohiqRGKac3xZLcMZ5w+OmLkM9dsG5EJgYEnsU	2023-05-08 20:15:59.111999	\N
31	\N	yogi13@mail.com	$argon2id$v=19$m=65536,t=3,p=4$JHWzOyc0qdf5mRzAZhG+ig$YtVuEWnz4u5FLl2+olxuY6J74g/q/8tem7r14x2C1RY	2023-05-09 21:11:14.225699	\N
32	\N	aksara kode teknologi	$argon2id$v=19$m=65536,t=3,p=4$Ve1ui5FTLcThQhs+CRmQqw$s5ss5jSnt2MuxbavJdrlvfwZsg/f1fWbp/9jYeeTUKg	2023-05-09 21:53:09.707408	\N
33	\N	test@mail.com	$argon2id$v=19$m=65536,t=3,p=4$WR6DeH5OKwsOXdu6x7yUOg$8RRRYK4Hc5NM4ihDFQn9D7waG/vxjHN5L/NdTO9Yalg	2023-05-09 22:18:57.81823	\N
34	\N		$argon2id$v=19$m=65536,t=3,p=4$X+Og9txEzBPLe+SUhFCC5g$PJnDbwooZl0NhxIKOV+lwHgRJcuyY74lnWvPhH9Gq+Q	2023-05-09 22:19:35.630869	\N
30	dewa	user1@mail.com	$argon2id$v=19$m=65536,t=3,p=4$dSAknLHVbwR+Hy63Vwffig$7p+3Lw739tZotYDm/BqBtMqWmt5oBlXVVkzaYT7Tsq4	2023-05-09 21:09:21.589912	\N
29	\N	user@mail.com	$argon2id$v=19$m=65536,t=3,p=4$dHwA1ZyyVrcnjZkvY94jeg$bsNIQhm873E6z0MUeAqh0eDZ/FGgQzxxVzrtoY2hxOU	2023-05-09 21:08:04.6739	\N
26	jibang	yogiganteng@mail.com	$argon2id$v=19$m=65536,t=3,p=4$VK29M+ErB2b8ns8Mpv4e6g$0f+9v4p9zLQT7tCFk24MT/U/Bt/9El1//wcADi2GaoA	2023-05-02 15:59:21.412555	\N
39	\N	only@mail.com	$argon2id$v=19$m=65536,t=3,p=4$w3wpiEoCj7uV1dAagx8jUw$kDd1t7u5uok09D4KBJqKyRuyvUvhsGqNmxMp8AdMVIg	2023-05-20 08:49:17.453443	\N
\.


--
-- TOC entry 3426 (class 0 OID 32784)
-- Dependencies: 216
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, "eventId", "userId", "createdAt", "updateAt") FROM stdin;
19	17	26	2023-05-13 12:58:17.985154	\N
20	18	26	2023-05-13 13:19:26.478745	\N
\.


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 15, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 235
-- Name: citites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citites_id_seq', 37, true);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 223
-- Name: eventCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."eventCategories_id_seq"', 15, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 31, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 241
-- Name: forgotRequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."forgotRequest_id_seq"', 15, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 225
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 17, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 231
-- Name: paymentMethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."paymentMethod_id_seq"', 14, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 217
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 39, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 227
-- Name: reservationSection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationSection_id_seq"', 9, true);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 229
-- Name: reservationStatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationStatus_id_seq"', 11, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 239
-- Name: reservationsTickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationsTickets_id_seq"', 20, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 233
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_id_seq', 33, true);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 237
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 40, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 215
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 20, true);


--
-- TOC entry 3258 (class 2606 OID 32817)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 32925)
-- Name: citites citites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citites
    ADD CONSTRAINT citites_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 32843)
-- Name: eventCategories eventCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."eventCategories"
    ADD CONSTRAINT "eventCategories_pkey" PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 32835)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 32963)
-- Name: forgotRequest forgotRequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."forgotRequest"
    ADD CONSTRAINT "forgotRequest_pkey" PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 32852)
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 32875)
-- Name: paymentMethod paymentMethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentMethod"
    ADD CONSTRAINT "paymentMethod_pkey" PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 32810)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 32861)
-- Name: reservationSection reservationSection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationSection"
    ADD CONSTRAINT "reservationSection_pkey" PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 32868)
-- Name: reservationStatus reservationStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationStatus"
    ADD CONSTRAINT "reservationStatus_pkey" PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 32954)
-- Name: reservationsTickets reservationsTickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationsTickets"
    ADD CONSTRAINT "reservationsTickets_pkey" PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 32882)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 32947)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3278 (class 2606 OID 32945)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 32789)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


-- Completed on 2023-05-21 15:15:11

--
-- PostgreSQL database dump complete
--

