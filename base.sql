--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-07-05 09:25:36

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
-- TOC entry 3469 (class 0 OID 0)
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
-- TOC entry 244 (class 1259 OID 49419)
-- Name: deviceToken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."deviceToken" (
    id integer NOT NULL,
    token character varying(255),
    "userId" integer,
    "eventCreationNotif" boolean DEFAULT true,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updateAt" timestamp without time zone
);


ALTER TABLE public."deviceToken" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 49418)
-- Name: deviceToken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."deviceToken" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."deviceToken_id_seq"
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
-- TOC entry 3439 (class 0 OID 32812)
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
-- TOC entry 3455 (class 0 OID 32918)
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
-- TOC entry 3463 (class 0 OID 49419)
-- Dependencies: 244
-- Data for Name: deviceToken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."deviceToken" (id, token, "userId", "eventCreationNotif", "createdAt", "updateAt") FROM stdin;
1	cr1Nndx0T32ugOtgFvZZJ5:APA91bFz7qC4IAACPm_h9vmPwkTVhrtTc0UmL1-nIErRBkTnOwcjd6joHn4XFZLdkdq6DrEuVKweH5ni5BCPnUtxMuKuLrpVFXzyTiqvXpch2o35b53LIKRhhoyoIejIJP9V4SbhXJAB	42	t	2023-07-04 19:58:50.89991	\N
2	cr1Nndx0T32ugOtgFvZZJ5:APA91bFz7qC4IAACPm_h9vmPwkTVhrtTc0UmL1-nIErRBkTnOwcjd6joHn4XFZLdkdq6DrEuVKweH5ni5BCPnUtxMuKuLrpVFXzyTiqvXpch2o35b53LIKRhhoyoIejIJP9V4SbhXJAB	42	t	2023-07-04 20:00:53.455939	\N
3	cr1Nndx0T32ugOtgFvZZJ5:APA91bFz7qC4IAACPm_h9vmPwkTVhrtTc0UmL1-nIErRBkTnOwcjd6joHn4XFZLdkdq6DrEuVKweH5ni5BCPnUtxMuKuLrpVFXzyTiqvXpch2o35b53LIKRhhoyoIejIJP9V4SbhXJAB	42	t	2023-07-04 20:01:19.150346	\N
4	cr1Nndx0T32ugOtgFvZZJ5:APA91bFz7qC4IAACPm_h9vmPwkTVhrtTc0UmL1-nIErRBkTnOwcjd6joHn4XFZLdkdq6DrEuVKweH5ni5BCPnUtxMuKuLrpVFXzyTiqvXpch2o35b53LIKRhhoyoIejIJP9V4SbhXJAB	42	t	2023-07-04 20:01:24.844076	\N
5	cr1Nndx0T32ugOtgFvZZJ5:APA91bFz7qC4IAACPm_h9vmPwkTVhrtTc0UmL1-nIErRBkTnOwcjd6joHn4XFZLdkdq6DrEuVKweH5ni5BCPnUtxMuKuLrpVFXzyTiqvXpch2o35b53LIKRhhoyoIejIJP9V4SbhXJAB	42	t	2023-07-04 20:04:19.975892	\N
\.


--
-- TOC entry 3443 (class 0 OID 32838)
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
-- TOC entry 3441 (class 0 OID 32828)
-- Dependencies: 222
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, picture, title, date, "cityId", descriptions, "createdAt", "updateAt", "categoriesId", "createdBy") FROM stdin;
16	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1684246098/YogiPrayoga/1684246093449.png	Weeding Jhone & niana	2023-01-03	34	Wedding Invitation	2023-05-06 10:28:08.756135	\N	11	26
33	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1688347888/YogiPrayoga/1688347885925.png	Wedding	2024-05-01	35	wedding invitation	2023-07-03 08:31:30.599515	\N	11	42
34	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1688347971/YogiPrayoga/1688347969954.png	Festival LIght	2024-05-01	33	wedding invitation	2023-07-03 08:32:53.538311	\N	14	42
35	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1688348050/YogiPrayoga/1688348047559.png	New Year fashion	2024-07-05	36	wedding invitation	2023-07-03 08:34:14.902579	\N	15	42
\.


--
-- TOC entry 3461 (class 0 OID 32956)
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
16	yogiganteng@mail.com	769380	2023-06-30 10:12:14.000599	\N
17		685090	2023-06-30 15:35:01.00007	\N
18		632440	2023-06-30 15:35:02.348781	\N
19		498700	2023-06-30 15:35:03.12605	\N
20		507700	2023-06-30 15:35:23.365801	\N
21		747420	2023-06-30 15:35:24.259098	\N
22		828400	2023-06-30 15:35:25.002902	\N
23		778030	2023-06-30 15:35:25.304172	\N
24		876500	2023-06-30 15:35:25.659463	\N
25		298000	2023-06-30 15:35:26.109404	\N
26		199900	2023-06-30 15:35:44.256717	\N
27		829380	2023-06-30 15:35:45.309472	\N
28	mas@mail.com	746650	2023-06-30 15:38:16.586287	\N
29		399470	2023-06-30 15:41:07.983736	\N
30		624770	2023-06-30 15:41:23.620707	\N
31		612640	2023-06-30 15:41:27.097029	\N
32		964430	2023-06-30 15:41:30.965089	\N
33	mas@mail.com	313280	2023-06-30 15:47:50.336209	\N
34	sibal@mail.com	475700	2023-06-30 21:40:13.529589	\N
35	mas@mail.com	609590	2023-07-01 08:23:10.656471	\N
36	aaa@mail.com	336410	2023-07-03 10:35:56.497843	\N
37	aaa@mail.com	439970	2023-07-03 10:38:05.505431	\N
38	aaa@mail.com	979560	2023-07-03 10:38:54.888347	\N
39	aaa@mail.com	958000	2023-07-03 10:46:41.107579	\N
40	akunbaru@mail.com	936670	2023-07-03 11:18:41.924755	\N
\.


--
-- TOC entry 3445 (class 0 OID 32845)
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
-- TOC entry 3451 (class 0 OID 32870)
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
-- TOC entry 3437 (class 0 OID 32803)
-- Dependencies: 218
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, picture, "fullName", "phoneNumber", gender, profession, nationality, "birthDate", "createdAt", "updateAt", "userId") FROM stdin;
41	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1688348379/YogiPrayoga/1688348376862.png	Super Admin	081111111111	f	Developers	\N	\N	2023-06-30 09:46:16.46774	\N	42
49	\N	yogi prayoga	\N	\N	\N	\N	\N	2023-07-03 09:01:07.216959	\N	59
50	\N	yogi lagi	\N	\N	\N	\N	\N	2023-07-03 09:15:46.589045	\N	60
51	\N	aaa	\N	\N	\N	\N	\N	2023-07-03 09:18:51.761974	\N	61
52	\N	akun baru lagi	08123738224	f	\N	\N	\N	2023-07-03 11:16:48.143313	\N	62
\.


--
-- TOC entry 3447 (class 0 OID 32854)
-- Dependencies: 228
-- Data for Name: reservationSection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationSection" (id, name, price, "createdAt", "updateAt") FROM stdin;
7	REG, ROW 1	50000	2023-05-20 13:39:48.667816	\N
8	VIP, ROW 2	70000	2023-05-20 13:39:48.667816	\N
9	VVIP, ROW 3	100000	2023-05-20 13:39:48.667816	\N
\.


--
-- TOC entry 3449 (class 0 OID 32863)
-- Dependencies: 230
-- Data for Name: reservationStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."reservationStatus" (id, name, "createdAt", "updateAt") FROM stdin;
9	UNPAID	2023-05-02 00:30:03.663141	\N
10	PAID	2023-05-02 11:17:47.39942	\N
11	EXPIERD	2023-05-02 11:18:02.729048	\N
\.


--
-- TOC entry 3453 (class 0 OID 32877)
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
27	18	29	1	\N	2023-05-21 14:12:54.733807	\N
28	18	29	1	\N	2023-05-21 14:13:11.31668	\N
29	18	29	1	\N	2023-05-21 14:39:09.217078	\N
30	18	29	1	\N	2023-05-21 14:39:18.171817	\N
31	18	29	1	\N	2023-05-21 14:44:20.147517	\N
32	18	29	1	\N	2023-05-21 14:44:37.228118	\N
33	18	29	1	\N	2023-05-21 14:53:16.660701	\N
34	16	26	1	\N	2023-05-21 15:36:37.763417	\N
24	16	26	2	11	2023-05-20 15:06:57.300007	\N
36	16	26	1	\N	2023-05-21 15:44:52.670276	\N
35	16	26	2	11	2023-05-21 15:39:48.914641	\N
\.


--
-- TOC entry 3459 (class 0 OID 32949)
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
21	34	7	2	2023-05-21 15:36:37.774024	\N
22	35	7	5	2023-05-21 15:39:48.926515	\N
23	36	7	5	2023-05-21 15:44:52.681713	\N
\.


--
-- TOC entry 3457 (class 0 OID 32938)
-- Dependencies: 238
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, "userName", email, password, "createdAt", "updateAt") FROM stdin;
42	Super Admin	superadmin@mail.com	$argon2id$v=19$m=65536,t=3,p=4$4rnn0Q05CnyJXlC0QO2TNQ$eZHcB6wFXYwCUm/H6rwfy/rLmnWJV8tp/8P+tDymKJo	2023-06-30 09:46:16.451521	\N
59	\N	yogiprayoga@mail.com	$argon2id$v=19$m=65536,t=3,p=4$3/wsdoaEr2IGQQxwQ8pBGA$R+vN7P5hbip2aqpl6zZLOJgfE1btBxMzCxOxZB2tx2g	2023-07-03 09:01:07.21201	\N
61	\N	aaa@mail.com	$argon2id$v=19$m=65536,t=3,p=4$GtUynJgT4QG8qw/RcillsA$tfVAfsASc0JUlQOYfLm4mvaXhi/UxSNV7VQ791g4ta8	2023-07-03 09:18:51.747948	\N
62	akun baru	akunbaru@mail.com	$argon2id$v=19$m=65536,t=3,p=4$yb7xWze2qRrJQjDD82As7Q$ni/Bcff6VS0lwoWyR3GNHSoL1RVmemjfZP0s8T2aerY	2023-07-03 11:16:48.130962	\N
\.


--
-- TOC entry 3435 (class 0 OID 32784)
-- Dependencies: 216
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, "eventId", "userId", "createdAt", "updateAt") FROM stdin;
19	17	26	2023-05-13 12:58:17.985154	\N
20	18	26	2023-05-13 13:19:26.478745	\N
\.


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 15, true);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 235
-- Name: citites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citites_id_seq', 37, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 243
-- Name: deviceToken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."deviceToken_id_seq"', 5, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 223
-- Name: eventCategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."eventCategories_id_seq"', 15, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 221
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 35, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 241
-- Name: forgotRequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."forgotRequest_id_seq"', 40, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 225
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 17, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 231
-- Name: paymentMethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."paymentMethod_id_seq"', 14, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 217
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 52, true);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 227
-- Name: reservationSection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationSection_id_seq"', 9, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 229
-- Name: reservationStatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationStatus_id_seq"', 11, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 239
-- Name: reservationsTickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."reservationsTickets_id_seq"', 23, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 233
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservations_id_seq', 36, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 237
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 62, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 215
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 20, true);


--
-- TOC entry 3265 (class 2606 OID 32817)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 32925)
-- Name: citites citites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citites
    ADD CONSTRAINT citites_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 49425)
-- Name: deviceToken deviceToken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."deviceToken"
    ADD CONSTRAINT "deviceToken_pkey" PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 32843)
-- Name: eventCategories eventCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."eventCategories"
    ADD CONSTRAINT "eventCategories_pkey" PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 32835)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 32963)
-- Name: forgotRequest forgotRequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."forgotRequest"
    ADD CONSTRAINT "forgotRequest_pkey" PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 32852)
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 32875)
-- Name: paymentMethod paymentMethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."paymentMethod"
    ADD CONSTRAINT "paymentMethod_pkey" PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 32810)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 32861)
-- Name: reservationSection reservationSection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationSection"
    ADD CONSTRAINT "reservationSection_pkey" PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 32868)
-- Name: reservationStatus reservationStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationStatus"
    ADD CONSTRAINT "reservationStatus_pkey" PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 32954)
-- Name: reservationsTickets reservationsTickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."reservationsTickets"
    ADD CONSTRAINT "reservationsTickets_pkey" PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 32882)
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 32947)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3285 (class 2606 OID 32945)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 32789)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


-- Completed on 2023-07-05 09:25:36

--
-- PostgreSQL database dump complete
--

