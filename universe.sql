--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    shape character varying(20),
    arms integer DEFAULT 0 NOT NULL,
    mly_from_earth numeric(7,3)
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
    name character varying(30) NOT NULL,
    radius_in_km integer,
    is_frozen boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    radius_in_km integer,
    is_solid boolean,
    description text,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    ly_from_earth numeric(7,3),
    star_class_id integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_class (
    star_class_id integer NOT NULL,
    name character varying(20) NOT NULL,
    code character varying(2) NOT NULL,
    light_temperature integer
);


ALTER TABLE public.star_class OWNER TO freecodecamp;

--
-- Name: star_class_star_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_class_star_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_class_star_class_id_seq OWNER TO freecodecamp;

--
-- Name: star_class_star_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_class_star_class_id_seq OWNED BY public.star_class.star_class_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_class star_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class ALTER COLUMN star_class_id SET DEFAULT nextval('public.star_class_star_class_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 6, 0.000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 4, 2.500);
INSERT INTO public.galaxy VALUES (3, 'Large Magellan Cloud', 'nebula', 0, 0.163);
INSERT INTO public.galaxy VALUES (4, 'Small Magellan Cloud', 'nebula', 0, 0.197);
INSERT INTO public.galaxy VALUES (5, 'Sagittarius Dwarf', 'elliptical', 0, 0.081);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'spiral', 8, 2.900);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (14, 'Moon', 1737, false, 3);
INSERT INTO public.moon VALUES (15, 'Deimos', 15, false, 4);
INSERT INTO public.moon VALUES (16, 'Phobos', 27, false, 4);
INSERT INTO public.moon VALUES (17, 'Io', 1821, false, 5);
INSERT INTO public.moon VALUES (18, 'Europa', 1561, true, 5);
INSERT INTO public.moon VALUES (19, 'Ganymede', 2631, true, 5);
INSERT INTO public.moon VALUES (20, 'Callisto', 2410, false, 5);
INSERT INTO public.moon VALUES (21, 'Enceladus', 252, true, 6);
INSERT INTO public.moon VALUES (22, 'Titan', 2575, true, 6);
INSERT INTO public.moon VALUES (23, 'Ariel', 579, false, 7);
INSERT INTO public.moon VALUES (24, 'Rosalind', 36, true, 7);
INSERT INTO public.moon VALUES (25, 'Oberon', 761, false, 7);
INSERT INTO public.moon VALUES (26, 'Tethys', 533, false, 6);
INSERT INTO public.moon VALUES (27, 'Dione', 562, true, 6);
INSERT INTO public.moon VALUES (28, 'Iapetus', 735, true, 6);
INSERT INTO public.moon VALUES (29, 'Mimas', 198, true, 6);
INSERT INTO public.moon VALUES (30, 'Triton', 1353, true, 9);
INSERT INTO public.moon VALUES (31, 'Umbriel', 585, true, 7);
INSERT INTO public.moon VALUES (32, 'Titania', 789, true, 7);
INSERT INTO public.moon VALUES (33, 'Charon', 603, true, 9);
INSERT INTO public.moon VALUES (34, 'Rhea', 764, true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, true, 'Small, ery, very hot planet!!!', 7);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, true, 'Dense, toxic athmosphere make the planet inhabitable', 7);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, true, 'HOME!!!!', 7);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, true, 'Next human exploration target', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, false, 'The largest planet of the solar system', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, false, 'A giant planet surronded by beatiful rings', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, false, 'a frozen giant planet with a small rocky core', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 26622, false, 'just a little smaller than Uranus', 7);
INSERT INTO public.planet VALUES (9, 'Pluto', 1151, false, 'Once considered the 9th planet of solar system, it was downgraded to "dwarf" planet by the astronomical society', 7);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 6500, true, 'The nearest SuperEarth planet, at ONLY 4 ly :)', 3);
INSERT INTO public.planet VALUES (11, 'Ceres', 476, true, 'Ceres is the largest object in the asteroid belt between Mars and Jupiter, and it is the only dwarf planet located in the inner solar system', 7);
INSERT INTO public.planet VALUES (12, 'Haumea', 620, true, 'a dwarf planet located in the Kuiper Belt', 7);
INSERT INTO public.planet VALUES (13, 'Fake01', 42035, false, 'Anatares *FAKE* exoplanet', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 4.634, 4, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 4.624, 5, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4.500, 6, 1);
INSERT INTO public.star VALUES (4, 'Antares', 600.000, 6, 1);
INSERT INTO public.star VALUES (5, 'Achernar', 144.000, 2, 4);
INSERT INTO public.star VALUES (6, 'Sirio', 8.600, 1, 1);
INSERT INTO public.star VALUES (7, 'Sun', 0.000, 4, 1);


--
-- Data for Name: star_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_class VALUES (1, 'Blue', 'A', 7500);
INSERT INTO public.star_class VALUES (2, 'White', 'B', 10000);
INSERT INTO public.star_class VALUES (3, 'yellow white', 'F', 6000);
INSERT INTO public.star_class VALUES (4, 'yellow', 'G', 5200);
INSERT INTO public.star_class VALUES (5, 'light orange', 'K', 3700);
INSERT INTO public.star_class VALUES (6, 'orange red', 'M', 2400);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 34, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_class_star_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_class_star_class_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star_class star_class_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class
    ADD CONSTRAINT star_class_code_key UNIQUE (code);


--
-- Name: star_class star_class_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class
    ADD CONSTRAINT star_class_pkey PRIMARY KEY (star_class_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_class_id_fkey FOREIGN KEY (star_class_id) REFERENCES public.star_class(star_class_id);


--
-- PostgreSQL database dump complete
--
