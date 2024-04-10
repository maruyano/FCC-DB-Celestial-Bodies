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
-- Name: anomaly; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.anomaly (
    anomaly_id integer NOT NULL,
    name character varying(31) NOT NULL,
    tier character varying(1)
);


ALTER TABLE public.anomaly OWNER TO freecodecamp;

--
-- Name: anomalies_anomaly_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.anomalies_anomaly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anomalies_anomaly_id_seq OWNER TO freecodecamp;

--
-- Name: anomalies_anomaly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.anomalies_anomaly_id_seq OWNED BY public.anomaly.anomaly_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32) NOT NULL,
    galaxy_type character varying(32),
    diameter_in_parsecs integer,
    description text
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
    name character varying(31) NOT NULL,
    mean_surface_temp_in_k integer,
    is_made_of_green_cheese boolean,
    density_in_g_per_cm3 numeric(5,4),
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
    name character varying(31) NOT NULL,
    density_in_g_per_cm3 numeric(3,2),
    num_moons integer,
    rings_bool boolean,
    star_id integer
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
    name character varying(31) NOT NULL,
    star_type character varying(31),
    age_in_millions_of_years integer,
    description text,
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
-- Name: anomaly anomaly_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly ALTER COLUMN anomaly_id SET DEFAULT nextval('public.anomalies_anomaly_id_seq'::regclass);


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
-- Data for Name: anomaly; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.anomaly VALUES (1, 'Pluto', 'D');
INSERT INTO public.anomaly VALUES (2, 'Goofy', 'S');
INSERT INTO public.anomaly VALUES (3, 'Marvin', 'C');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'spiral', 46650, 'The enemy. Too large, stole our cool shape, will eat our house someday.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'spiral', 26800, 'Our casa. Where da milk be.');
INSERT INTO public.galaxy VALUES (3, 'Big Honkin', 'elliptical', 99999, 'Unreasonably large, and honkin overmuch.');
INSERT INTO public.galaxy VALUES (4, 'Tiny Lil', 'irregular', 1, 'Cute lil galaxy where things are small and non-depressing.');
INSERT INTO public.galaxy VALUES (5, 'Sad Pointless', 'lenticular', 12345, 'A depressing, depressed galaxy that could use a friend.');
INSERT INTO public.galaxy VALUES (6, 'Unremarkable', 'spiral', 22222, 'Do NOT look at this galaxy. Perfectly normal, with certainly no attractive alien singles.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 220, true, 3.3464, 3);
INSERT INTO public.moon VALUES (2, 'Io', 130, false, 3.5280, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 102, false, 3.0100, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 110, false, 1.9360, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 134, false, 1.8300, 5);
INSERT INTO public.moon VALUES (6, 'Mimas', 64, false, 1.1500, 5);
INSERT INTO public.moon VALUES (7, 'Enceladus', 75, false, 1.6100, 5);
INSERT INTO public.moon VALUES (8, 'Tethys', 64, false, 0.9800, 5);
INSERT INTO public.moon VALUES (9, 'Dione', 87, false, 1.4800, 5);
INSERT INTO public.moon VALUES (10, 'Rhea', 76, false, 1.2300, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 94, false, 1.8800, 5);
INSERT INTO public.moon VALUES (12, 'Iapetus', 130, false, 1.0800, 7);
INSERT INTO public.moon VALUES (13, 'Miranda', 59, false, 1.2000, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 58, false, 1.6700, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 61, false, 1.4000, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 60, false, 1.7200, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 61, false, 1.6300, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 38, false, 2.0610, 7);
INSERT INTO public.moon VALUES (19, 'Warren', 310, false, 9.9990, 12);
INSERT INTO public.moon VALUES (20, 'River', 420, true, 4.2069, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5.43, 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 5.24, 9, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 5.52, 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3.94, 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1.33, 95, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0.70, 146, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1.30, 28, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 1.76, 16, true, 1);
INSERT INTO public.planet VALUES (9, 'Air 2 Thicc', 9.99, 0, true, 4);
INSERT INTO public.planet VALUES (10, 'All Moonz', 0.03, 999, false, 5);
INSERT INTO public.planet VALUES (11, 'Bill Russell', 9.99, 0, true, 6);
INSERT INTO public.planet VALUES (12, 'Planet Funk', 4.92, 12, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'yellow dwarf', 4600, 'Big bright thing. Gets in eyes. Only works sometimes.', 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'red dwarf', 4850, 'Why is this centaur so close? Tumblr boutta go wild for this.', 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'white dwarf', 242, 'A humorless dog star. Still a good boy.', 2);
INSERT INTO public.star VALUES (4, 'Too Hot', 'red supergiant', 5000, 'Will burn your face. 0 out of 10 would not eat.', 1);
INSERT INTO public.star VALUES (5, 'Too Cold', 'black dwarf', 389, 'Will freeze your tongue off. 2 out of 10, only eat if u freaky like dat.', 3);
INSERT INTO public.star VALUES (6, 'Just Right', 'yellow dwarf', 1000, 'This star is at perfect eating temperature. 10 out of 10.', 5);


--
-- Name: anomalies_anomaly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.anomalies_anomaly_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: anomaly anomalies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomalies_name_key UNIQUE (name);


--
-- Name: anomaly anomalies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomalies_pkey PRIMARY KEY (anomaly_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

