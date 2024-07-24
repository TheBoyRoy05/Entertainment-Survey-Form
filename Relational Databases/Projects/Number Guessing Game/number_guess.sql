--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE games;
--
-- Name: games; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE games WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE games OWNER TO freecodecamp;

\connect games

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(22) NOT NULL,
    num_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'Issac', 10);
INSERT INTO public.games VALUES (2, 'Issac', 7);
INSERT INTO public.games VALUES (3, 'Issac', 9);
INSERT INTO public.games VALUES (4, 'theboyroy', 7);
INSERT INTO public.games VALUES (5, 'user_1721850671135', 876);
INSERT INTO public.games VALUES (6, 'user_1721850671135', 170);
INSERT INTO public.games VALUES (7, 'user_1721850671134', 975);
INSERT INTO public.games VALUES (8, 'user_1721850671134', 300);
INSERT INTO public.games VALUES (9, 'user_1721850671135', 110);
INSERT INTO public.games VALUES (10, 'user_1721850671135', 37);
INSERT INTO public.games VALUES (11, 'user_1721850671135', 588);
INSERT INTO public.games VALUES (12, 'user_1721850696766', 875);
INSERT INTO public.games VALUES (13, 'user_1721850696766', 315);
INSERT INTO public.games VALUES (14, 'user_1721850696765', 740);
INSERT INTO public.games VALUES (15, 'user_1721850696765', 62);
INSERT INTO public.games VALUES (16, 'user_1721850696766', 672);
INSERT INTO public.games VALUES (17, 'user_1721850696766', 329);
INSERT INTO public.games VALUES (18, 'user_1721850696766', 273);
INSERT INTO public.games VALUES (19, 'user_1721850719168', 699);
INSERT INTO public.games VALUES (20, 'user_1721850719168', 769);
INSERT INTO public.games VALUES (21, 'user_1721850719167', 601);
INSERT INTO public.games VALUES (22, 'user_1721850719167', 730);
INSERT INTO public.games VALUES (23, 'user_1721850719168', 349);
INSERT INTO public.games VALUES (24, 'user_1721850719168', 652);
INSERT INTO public.games VALUES (25, 'user_1721850719168', 153);
INSERT INTO public.games VALUES (26, 'user_1721850799157', 329);
INSERT INTO public.games VALUES (27, 'user_1721850799157', 320);
INSERT INTO public.games VALUES (28, 'user_1721850799156', 247);
INSERT INTO public.games VALUES (29, 'user_1721850799156', 332);
INSERT INTO public.games VALUES (30, 'user_1721850799157', 791);
INSERT INTO public.games VALUES (31, 'user_1721850799157', 521);
INSERT INTO public.games VALUES (32, 'user_1721850799157', 552);
INSERT INTO public.games VALUES (33, 'Issac', 9);
INSERT INTO public.games VALUES (34, 'user_1721850921114', 448);
INSERT INTO public.games VALUES (35, 'user_1721850921114', 831);
INSERT INTO public.games VALUES (36, 'user_1721850921113', 313);
INSERT INTO public.games VALUES (37, 'user_1721850921113', 655);
INSERT INTO public.games VALUES (38, 'user_1721850921114', 43);
INSERT INTO public.games VALUES (39, 'user_1721850921114', 356);
INSERT INTO public.games VALUES (40, 'user_1721850921114', 642);
INSERT INTO public.games VALUES (41, 'user_1721850934812', 509);
INSERT INTO public.games VALUES (42, 'user_1721850934812', 87);
INSERT INTO public.games VALUES (43, 'user_1721850934811', 871);
INSERT INTO public.games VALUES (44, 'user_1721850934811', 38);
INSERT INTO public.games VALUES (45, 'user_1721850934812', 808);
INSERT INTO public.games VALUES (46, 'user_1721850934812', 888);
INSERT INTO public.games VALUES (47, 'user_1721850934812', 938);
INSERT INTO public.games VALUES (48, 'qwerty', 10);
INSERT INTO public.games VALUES (49, 'qwerty', 9);
INSERT INTO public.games VALUES (50, 'user_1721851263601', 969);
INSERT INTO public.games VALUES (51, 'user_1721851263601', 728);
INSERT INTO public.games VALUES (52, 'user_1721851263600', 68);
INSERT INTO public.games VALUES (53, 'user_1721851263600', 65);
INSERT INTO public.games VALUES (54, 'user_1721851263601', 835);
INSERT INTO public.games VALUES (55, 'user_1721851263601', 370);
INSERT INTO public.games VALUES (56, 'user_1721851263601', 916);
INSERT INTO public.games VALUES (57, 'user_1721851278408', 360);
INSERT INTO public.games VALUES (58, 'user_1721851278408', 25);
INSERT INTO public.games VALUES (59, 'user_1721851278407', 485);
INSERT INTO public.games VALUES (60, 'user_1721851278407', 377);
INSERT INTO public.games VALUES (61, 'user_1721851278408', 527);
INSERT INTO public.games VALUES (62, 'user_1721851278408', 386);
INSERT INTO public.games VALUES (63, 'user_1721851278408', 493);
INSERT INTO public.games VALUES (64, 'user_1721851625558', 150);
INSERT INTO public.games VALUES (65, 'user_1721851625558', 673);
INSERT INTO public.games VALUES (66, 'user_1721851625557', 532);
INSERT INTO public.games VALUES (67, 'user_1721851625557', 314);
INSERT INTO public.games VALUES (68, 'user_1721851625558', 22);
INSERT INTO public.games VALUES (69, 'user_1721851625558', 105);
INSERT INTO public.games VALUES (70, 'user_1721851625558', 896);
INSERT INTO public.games VALUES (71, 'user_1721851753886', 729);
INSERT INTO public.games VALUES (72, 'user_1721851753886', 833);
INSERT INTO public.games VALUES (73, 'user_1721851753885', 852);
INSERT INTO public.games VALUES (74, 'user_1721851753885', 227);
INSERT INTO public.games VALUES (75, 'user_1721851753886', 970);
INSERT INTO public.games VALUES (76, 'user_1721851753886', 79);
INSERT INTO public.games VALUES (77, 'user_1721851753886', 38);
INSERT INTO public.games VALUES (78, 'user_1721851787780', 130);
INSERT INTO public.games VALUES (79, 'user_1721851787780', 899);
INSERT INTO public.games VALUES (80, 'user_1721851787779', 679);
INSERT INTO public.games VALUES (81, 'user_1721851787779', 910);
INSERT INTO public.games VALUES (82, 'user_1721851787780', 940);
INSERT INTO public.games VALUES (83, 'user_1721851787780', 391);
INSERT INTO public.games VALUES (84, 'user_1721851787780', 51);
INSERT INTO public.games VALUES (85, 'user_1721852044561', 32);
INSERT INTO public.games VALUES (86, 'user_1721852044561', 435);
INSERT INTO public.games VALUES (87, 'user_1721852044560', 365);
INSERT INTO public.games VALUES (88, 'user_1721852044560', 36);
INSERT INTO public.games VALUES (89, 'user_1721852044561', 125);
INSERT INTO public.games VALUES (90, 'user_1721852044561', 986);
INSERT INTO public.games VALUES (91, 'user_1721852044561', 452);
INSERT INTO public.games VALUES (92, 'user_1721852185233', 856);
INSERT INTO public.games VALUES (93, 'user_1721852185233', 299);
INSERT INTO public.games VALUES (94, 'user_1721852185232', 421);
INSERT INTO public.games VALUES (95, 'user_1721852185232', 235);
INSERT INTO public.games VALUES (96, 'user_1721852185233', 108);
INSERT INTO public.games VALUES (97, 'user_1721852185233', 553);
INSERT INTO public.games VALUES (98, 'user_1721852185233', 892);
INSERT INTO public.games VALUES (99, 'user_1721852340030', 910);
INSERT INTO public.games VALUES (100, 'user_1721852340030', 800);
INSERT INTO public.games VALUES (101, 'user_1721852340029', 461);
INSERT INTO public.games VALUES (102, 'user_1721852340029', 98);
INSERT INTO public.games VALUES (103, 'user_1721852340030', 43);
INSERT INTO public.games VALUES (104, 'user_1721852340030', 443);
INSERT INTO public.games VALUES (105, 'user_1721852340030', 466);
INSERT INTO public.games VALUES (106, 'user_1721852397997', 129);
INSERT INTO public.games VALUES (107, 'user_1721852397997', 823);
INSERT INTO public.games VALUES (108, 'user_1721852397996', 385);
INSERT INTO public.games VALUES (109, 'user_1721852397996', 255);
INSERT INTO public.games VALUES (110, 'user_1721852397997', 383);
INSERT INTO public.games VALUES (111, 'user_1721852397997', 428);
INSERT INTO public.games VALUES (112, 'user_1721852397997', 486);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 112, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

