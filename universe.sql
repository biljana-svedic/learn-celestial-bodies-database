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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    age_in_millions_of_years numeric(6,2) NOT NULL,
    galaxy_types character varying(30),
    description text,
    is_spherical boolean,
    diameter_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer NOT NULL,
    moon_types character varying(30),
    distance_from_planet_in_millions_of_km numeric(4,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    star_id integer NOT NULL,
    planet_types character varying(30) DEFAULT 'rocky or gas giant'::character varying,
    has_life boolean,
    number_of_moons integer DEFAULT 0
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    name character varying(40) NOT NULL,
    year_spotted integer DEFAULT 0,
    star_id integer,
    solar_system_id integer NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    galaxy_id integer NOT NULL,
    description text,
    star_types character varying(30),
    star_system_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 100.00, 'barred spyral', '', false, 220000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 200.00, 'spyral', '', false, 105700);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 300.00, 'spyral', '', false, 37000);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 300.00, 'lenticular', '', false, 130000);
INSERT INTO public.galaxy VALUES (5, 'Centaurus', 400.00, 'eliptical', '', false, 60000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 500.00, 'lenticular', '', false, 50000);
INSERT INTO public.galaxy VALUES (7, 'Pegasus', 900.00, 'spiral', '', false, 13000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Zoozve', 2, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Moon', 3, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Deimos', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Io', 5, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Titan', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Dione', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Hyperion', 6, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Prometheus', 6, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Triton', 9, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Protheus', 9, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Despina', 9, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Thalassa', 9, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Larissa', 9, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Triton', 9, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'Protheus', 9, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Despina', 9, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Thalassa', 9, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Larissa', 9, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3, 'rocky', false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 3, 'rocky', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3, 'rocky', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3, 'rocky', false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, 'gas giant', false, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 3, 'gas giant', false, 146);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 'ice giant', false, 28);
INSERT INTO public.planet VALUES (8, 'Pluto', 3, 'dwarf planet', false, 0);
INSERT INTO public.planet VALUES (9, 'Neptun', 3, 'ice giant', false, 16);
INSERT INTO public.planet VALUES (10, 'Ceres', 3, 'dwarf planet', false, 0);
INSERT INTO public.planet VALUES (11, 'Haumea', 3, 'dwarf planet', false, 0);
INSERT INTO public.planet VALUES (12, 'Makemake', 3, 'dwarf planet', false, 0);
INSERT INTO public.planet VALUES (13, 'Eris', 3, 'dwarf planet', false, 0);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES ('Andromeda', 0, 1, 1);
INSERT INTO public.solar_system VALUES ('Our small constelation', 0, 2, 2);
INSERT INTO public.solar_system VALUES ('Canis Major', 0, 3, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Pi Andromedae', 1, '', 'giant star', 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 1, '', 'giant star', 1);
INSERT INTO public.star VALUES (3, 'Sun', 2, '', 'dwarf star', 2);
INSERT INTO public.star VALUES (4, 'Sirius', 2, '', 'giant star', 3);
INSERT INTO public.star VALUES (6, 'Antares', 2, '', 'giant star', 4);
INSERT INTO public.star VALUES (7, 'Epsilon Pegasi', 7, '', 'giant star', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: solar_system space_objects_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT space_objects_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_systems_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_systems_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

