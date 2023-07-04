--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-26 01:16:17

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
-- TOC entry 219 (class 1259 OID 49323)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone,
    picture character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 49322)
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
-- TOC entry 3342 (class 0 OID 49323)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, "createdAt", "updatedAt", picture) FROM stdin;
19	Politic	2023-05-25 22:23:58.907909	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028279/teamcollab/team2/1685028273785.png
20	Health	2023-05-25 22:25:49.333019	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028346/teamcollab/team2/1685028343317.png
21	Economy	2023-05-25 22:27:53.317092	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028471/teamcollab/team2/1685028468061.png
22	Country	2023-05-25 22:28:39.117596	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028517/teamcollab/team2/1685028514333.png
23	Technology	2023-05-25 22:29:10.951099	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028549/teamcollab/team2/1685028545689.png
24	Holiday	2023-05-25 22:29:58.413	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028597/teamcollab/team2/1685028594019.png
25	Popular	2023-05-25 22:31:31.065831	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028689/teamcollab/team2/1685028685935.png
26	Trending	2023-05-25 22:32:20.467341	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028739/teamcollab/team2/1685028736511.png
27	Industry	2023-05-25 22:33:04.245727	\N	https://res.cloudinary.com/dxs0yxeyr/image/upload/v1685028782/teamcollab/team2/1685028779628.png
\.


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 27, true);


--
-- TOC entry 3198 (class 2606 OID 49328)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


-- Completed on 2023-05-26 01:16:18

--
-- PostgreSQL database dump complete
--

