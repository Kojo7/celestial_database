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
    name character varying(30),
    age integer NOT NULL,
    size numeric NOT NULL,
    has_black_hole boolean NOT NULL
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
    name character varying(30),
    radius numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    planet_id integer
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
    name character varying(30),
    diameter numeric NOT NULL,
    habitable boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_description (
    planet_description_id integer NOT NULL,
    description_text text NOT NULL,
    planet_id integer,
    name character varying(30)
);


ALTER TABLE public.planet_description OWNER TO freecodecamp;

--
-- Name: planet_description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_description_description_id_seq OWNER TO freecodecamp;

--
-- Name: planet_description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_description_description_id_seq OWNED BY public.planet_description.planet_description_id;


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
    name character varying(30),
    age integer NOT NULL,
    temperature integer NOT NULL,
    has_planets boolean,
    galaxy_id integer
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
-- Name: planet_description planet_description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description ALTER COLUMN planet_description_id SET DEFAULT nextval('public.planet_description_description_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Whirlpool', 15000, 80000, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 13000, 120000, true);
INSERT INTO public.galaxy VALUES (4, 'Somebrebo', 13000, 70000, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 800, 5000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 21000, 90000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.1, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.1, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, true, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2631.2, true, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 2574.7, true, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.1, true, 5);
INSERT INTO public.moon VALUES (10, 'Triton', 1353.4, true, 6);
INSERT INTO public.moon VALUES (11, 'Titania', 788.9, true, 7);
INSERT INTO public.moon VALUES (12, 'Rhea', 763.8, true, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 761.4, true, 8);
INSERT INTO public.moon VALUES (14, 'Charon', 606, false, 9);
INSERT INTO public.moon VALUES (15, 'Proteus', 210, false, 9);
INSERT INTO public.moon VALUES (16, 'Lapetus', 734.5, true, 10);
INSERT INTO public.moon VALUES (17, 'Hyperion', 135, true, 10);
INSERT INTO public.moon VALUES (18, 'Dione', 561.4, true, 10);
INSERT INTO public.moon VALUES (19, 'Ariel', 578.9, true, 11);
INSERT INTO public.moon VALUES (20, 'Miranda', 235.8, true, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 12742, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 6779, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 12104, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 139822, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 116464, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 49528, false, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 4897, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 50724, false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 23529, false, 2);
INSERT INTO public.planet VALUES (10, 'HD 1897 b', 80500, false, 3);
INSERT INTO public.planet VALUES (11, 'Gilese 581 c', 15000, true, 4);
INSERT INTO public.planet VALUES (12, 'Gliese 667 6c', 13000, true, 5);


--
-- Data for Name: planet_description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_description VALUES (1, 'Blue planet with diverse life forms', 1, 'Blue Marble');
INSERT INTO public.planet_description VALUES (2, 'Red rocky planet with thin atmosphere.', 2, 'The Red Planet');
INSERT INTO public.planet_description VALUES (3, 'Hot planet with thick toxic atmosphere.', 3, 'Morning Star');
INSERT INTO public.planet_description VALUES (4, 'Giant gas planet with colorful stripes.', 4, 'Jove');
INSERT INTO public.planet_description VALUES (5, 'Ringed gas planet with large icy moons.', 5, 'The Ringed Wonder');
INSERT INTO public.planet_description VALUES (6, 'Cold, blue planet with methane atmosphere.', 6, 'Neptune');
INSERT INTO public.planet_description VALUES (7, 'Small rocky planet closest to the Sun.', 7, 'Swift planet');
INSERT INTO public.planet_description VALUES (8, 'Cold ice giant tipped on its side.', 8, 'Sideways planet');
INSERT INTO public.planet_description VALUES (9, 'Earth-like exoplanet orbiting another star.', 9, 'kepler');
INSERT INTO public.planet_description VALUES (10, 'Blue gas giant with extreme winds.', 10, 'osiris');
INSERT INTO public.planet_description VALUES (11, 'Potentially habitable exoplanet.', 11, 'Zarmina');
INSERT INTO public.planet_description VALUES (12, 'Habitable zone exoplanet orbiting M-dwarf.', 12, 'Goldilocks');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5000000, 5778, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 240000, 9940, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 6000000, 5790, true, 2);
INSERT INTO public.star VALUES (4, 'Betelguese', 1000000, 3500, false, 2);
INSERT INTO public.star VALUES (5, 'Vega', 455000, 9602, true, 3);
INSERT INTO public.star VALUES (6, 'Canopus', 72000000, 7350, true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_description_description_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_description planet_description_description_text_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_description_text_key UNIQUE (description_text);


--
-- Name: planet_description planet_description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_pkey PRIMARY KEY (planet_description_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_description planet_description_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_description
    ADD CONSTRAINT planet_description_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

