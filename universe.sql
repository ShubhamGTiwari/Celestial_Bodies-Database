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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying NOT NULL,
    meaning character varying,
    brightest_star character varying NOT NULL,
    description character varying,
    stars_discovered integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    constellation character varying,
    origin_of_name character varying,
    is_visible_to_naked_eyes boolean,
    constellation_id integer NOT NULL
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
    name character varying NOT NULL,
    parent_planet character varying,
    roman_number text,
    mean_radius_km numeric(15,6),
    discovered_year integer,
    discovered_by character varying,
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
    name character varying NOT NULL,
    orbital_period_in_years numeric(15,9),
    rotational_period_in_days numeric(15,9),
    has_moon boolean,
    year_founded character varying,
    planet_type character varying,
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
    name character varying NOT NULL,
    constellation character varying,
    lumonisity numeric(10,4),
    approval_date date,
    description character varying,
    distance_light_years numeric(10,3),
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Andromeda (The chained maiden or princess)', 'Alpheratz', 'The Andromeda constellation is formed by 16 main stars that form its shape in the sky.', 177);
INSERT INTO public.constellation VALUES (2, 'Antlia', 'air pump', 'α Antliae', 'The Antlia constellation is formed by just 3 main stars that form its shape in the sky.', 54);
INSERT INTO public.constellation VALUES (3, 'Apus', 'Bird-of-paradise/Exotic Bird/Extraordinary Bird', 'α Apodis', 'The Apus constellation is formed by just 4 main stars that form its shape in the sky.', 47);
INSERT INTO public.constellation VALUES (4, 'Aquarius', 'water-bearer', 'Sadalsuud', 'The Aquarius constellation is formed by 10 main stars that form its shape in the sky.', 217);
INSERT INTO public.constellation VALUES (5, 'Aquila', 'eagle', 'Altair', 'The Aquila constellation is formed by 10 main stars that form its shape in the sky.', 154);
INSERT INTO public.constellation VALUES (6, 'Ara', 'altar', 'β Arae', 'The Ara constellation is formed by 8 main stars that form its shape in the sky.', 101);
INSERT INTO public.constellation VALUES (7, 'Aries', 'ram', 'Hamal', 'The Aries constellation is formed by 9 main stars that form its shape in the sky.', 121);
INSERT INTO public.constellation VALUES (8, 'Auriga', 'charioteer', 'Capella', 'The Auriga constellation is formed by 5 main stars that form its shape in the sky. The constellation of Auriga represents a charioteer.', 180);
INSERT INTO public.constellation VALUES (9, 'Bootes', 'herdsman', 'Arcturus', 'The Bootes constellation is formed by 7 main stars that form its shape in the sky.', 166);
INSERT INTO public.constellation VALUES (10, 'Caelum', 'chisel or engraving tool', 'α Caeli', 'The Caelum constellation is made of 4 main stars that form its shape in the sky.', 30);
INSERT INTO public.constellation VALUES (11, 'Camelopardalis', 'giraffe', 'β Camelopardalis', 'The Camelopardalis constellation is formed by 8 main stars that form its shape in the sky.', 167);
INSERT INTO public.constellation VALUES (12, 'Cancer', 'crab', 'Tarf', 'The Cancer constellation is formed by 5 main stars that form its shape in the sky.', 191);
INSERT INTO public.constellation VALUES (13, 'Canes Venatici', 'hunting dogs', 'Cor Caroli', 'The Canes Venatici constellation is formed by just 2 main stars that form its shape in the sky.', 86);
INSERT INTO public.constellation VALUES (14, 'Canis Major', 'greater dog', 'Sirius', 'The Canis Major constellation is formed by 8 main stars that form its shape in the sky.', 172);
INSERT INTO public.constellation VALUES (15, 'Canis Minor', 'lesser dog', 'Procyon', 'The Canis Minor constellation is formed by 2 main stars that form its shape in the sky.', 57);
INSERT INTO public.constellation VALUES (16, 'Capricornus', 'sea goat', 'Deneb Algedi', 'The Capricornus constellation is formed by 13 main stars that form its shape in the sky.', 106);
INSERT INTO public.constellation VALUES (17, 'Carina', 'keel', 'Canopus', 'The Carina constellation is formed by 9 main stars that form its shape in the sky.', 320);
INSERT INTO public.constellation VALUES (18, 'Cassiopeia', 'Cassiopeia (mythological character)', 'Schedar', 'The Cassiopeia constellation is formed by 5 main stars that form its shape in the sky.', 316);
INSERT INTO public.constellation VALUES (19, 'Centaurus', 'centaur', 'Rigil Kentaurus', 'The Centaurus constellation is formed by 11 main stars that form its shape in the sky.', 326);
INSERT INTO public.constellation VALUES (20, 'Cepheus', 'Cepheus(mythological character)', 'Alderamin', 'The Cepheus constellation is formed by 7 main stars that form its shape in the sky.', 228);
INSERT INTO public.constellation VALUES (21, 'Cetus', 'sea monster (later interpreted as a whale)', 'Diphda', 'The Cetus constellation is formed by 14 main stars that form its shape in the sky.', 232);
INSERT INTO public.constellation VALUES (22, 'Chamaeleon', 'chameleon', 'α Chamaeleontis', 'The Chamaeleon constellation is formed by just3 main stars that form its shape in the sky.', 47);
INSERT INTO public.constellation VALUES (23, 'Circinus', 'compasses', 'α Circini', 'The Circinus constellation is formed by 3 main stars that form its shape in the sky.', 57);
INSERT INTO public.constellation VALUES (24, 'Columba', 'dove', 'Phact', 'The Columba constellation is formed by 5 main stars that form its shape in the sky.', 77);
INSERT INTO public.constellation VALUES (25, 'Coma Berenices', 'Berenices hair', 'β Comae Berenices', 'The Coma Berenices  constellation is formed by 3 main stars that form its shape in the sky.', 107);
INSERT INTO public.constellation VALUES (26, 'Corona Australis', 'southern crown', 'Meridiana', 'The Corona Australis constellation is formed by 6 main stars that form its shape in the sky.', 59);
INSERT INTO public.constellation VALUES (27, 'Corona Borealis', 'northern crown', 'Alphecca', 'The Corona Borealis constellation is formed by 8 main stars that form its shape in the sky.', 55);
INSERT INTO public.constellation VALUES (28, 'Corvus', 'crow', 'Gienah', 'The Corvus constellation is formed by 4 main stars that form its shape in the sky.', 39);
INSERT INTO public.constellation VALUES (29, 'Crater', 'cup', 'δ Crateris', 'The Crater constellation is formed by 4 main stars that form its shape in the sky.', 52);
INSERT INTO public.constellation VALUES (30, 'Crux', 'southern cross', 'Acrux', 'The Crux constellation is formed by 4 main stars that form its shape in the sky.', 66);
INSERT INTO public.constellation VALUES (31, 'Cygnus', 'swan or Northern Cross', 'Deneb', 'The Cygnus constellation is formed by 9 main stars that form its shape in the sky.', 378);
INSERT INTO public.constellation VALUES (32, 'Delphinus', 'dolphin', 'Rotanev', 'The Delphinus constellation is formed by 5 main stars that form its shape in the sky.', 65);
INSERT INTO public.constellation VALUES (33, 'Dorado', 'dolphinfish', 'α Doradus', 'The Dorado constellation is formed by 3 main stars that form its shape in the sky.', 82);
INSERT INTO public.constellation VALUES (34, 'Draco', 'dragon', 'Eltanin', 'The Draco constellation is formed by 14 main stars that form its shape in the sky.', 249);
INSERT INTO public.constellation VALUES (35, 'Equuleus', 'pony', 'Kitalpha', 'The Equuleus constellation is formed by 3 main stars that form its shape in the sky.', 26);
INSERT INTO public.constellation VALUES (36, 'Eridanus', 'river Eridanus (mythology)', 'Achernar', 'The Eridanus constellation is formed by 24 main stars that form its shape in the sky.', 224);
INSERT INTO public.constellation VALUES (37, 'Fornax', 'chemical furnace', 'Dalim', 'The Fornax constellation is formed by 2 main stars that form its shape in the sky.', 79);
INSERT INTO public.constellation VALUES (38, 'Gemini', 'twins', 'Pollux', 'The Gemini constellation is formed by 8 main stars that form its shape in the sky.', 183);
INSERT INTO public.constellation VALUES (39, 'Grus', 'crane', 'Alnair', 'The Grus constellation is formed by 8 main stars that form its shape in the sky.', 73);
INSERT INTO public.constellation VALUES (40, 'Hercules', 'Hercules (mythological character)', 'Kornephoros', 'The Hercules constellation is formed by 14 main stars that form its shape in the sky.', 288);
INSERT INTO public.constellation VALUES (41, 'Horologium', 'pendulum clock', 'α Horologii', 'The Horologium constellation is formed by 6 main stars that form its shape in the sky.', 37);
INSERT INTO public.constellation VALUES (42, 'Hydra', 'Hydra (mythological creature)', 'Alphard', 'The Hydra constellation is formed by 17 main stars that form its shape in the sky.', 277);
INSERT INTO public.constellation VALUES (43, 'Hydrus', 'lesser water snake', 'β Hydri', 'The Hydrus constellation is formed by 3 main stars that form its shape in the sky.', 46);
INSERT INTO public.constellation VALUES (44, 'Indus', 'Indian(of unspecified type)', 'α Indi', 'The Indus constellation is formed by 3 main stars that form its shape in the sky.', 55);
INSERT INTO public.constellation VALUES (45, 'Lacerta', 'lizard', 'α Lacertae', 'The Lacertae constellation is formed by 5 main stars that form its shape in the sky.', 105);
INSERT INTO public.constellation VALUES (46, 'Leo', 'lion', 'Regulus', 'The Leo constellation is formed by 9 main stars that form its shape in the sky.', 160);
INSERT INTO public.constellation VALUES (47, 'Leo Minor', 'lesser lion', 'Praecipua', 'The Leo Minor constellation is formed by 3 main stars that form its shape in the sky.', 154);
INSERT INTO public.constellation VALUES (48, 'Lepus', 'hare', 'Arneb', 'The Lepus constellation is formed by 8 main stars that form its shape in the sky.', 91);
INSERT INTO public.constellation VALUES (49, 'Libra', 'balance', 'Zubeneschamali', 'The Libra constellation is formed by 4 main stars that form its shape in the sky.', 120);
INSERT INTO public.constellation VALUES (50, 'Lupus', 'wolf', 'α Lupi', 'The Lupus constellation is formed by 9 main stars that form its shape in the sky.', 148);
INSERT INTO public.constellation VALUES (51, 'Lynx', 'lynx', 'α Lyncis', 'The Lynx constellation is formed by 4 main stars that form its shape in the sky.', 135);
INSERT INTO public.constellation VALUES (52, 'Lyra', 'lyre / harp', 'Vega', 'The Lyra constellation is formed by 5 main stars that form its shape in the sky.', 169);
INSERT INTO public.constellation VALUES (53, 'Mensa', 'Table Mountain (South Africa)', 'α Mensae', 'The Mensa constellation is formed by 4 main stars that form its shape in the sky.', 40);
INSERT INTO public.constellation VALUES (54, 'Microscopium', 'microscope', 'γ Microscopii', 'The Microscopium constellation is formed by 5 main stars that form its shape in the sky.', 61);
INSERT INTO public.constellation VALUES (55, 'Monoceros', 'unicorn', 'β Monocerotis', 'The Monoceros constellation is formed by 4 main stars that form its shape in the sky.', 226);
INSERT INTO public.constellation VALUES (56, 'Musca', 'fly', 'α Muscae', 'The Musca constellation is formed by 6 main stars that form its shape in the sky.', 84);
INSERT INTO public.constellation VALUES (57, 'Norma', 'carpenters level', 'γ2 Normae', 'The Norma constellation is a small group formed by only 4 main stars that form its shape in the sky.', 69);
INSERT INTO public.constellation VALUES (58, 'Octans', 'octant (instrument)', 'ν Octantis', 'The Octans constellation is a small group formed by only 3 main stars that form its shape in the sky.', 77);
INSERT INTO public.constellation VALUES (59, 'Ophiuchus', 'serpent-bearer', 'Rasalhague', 'The Ophiucus constellation is a small group formed by 10 main stars that form its shape in the sky.', 203);
INSERT INTO public.constellation VALUES (60, 'Orion', 'Orion (mythological character)', 'Rigel', 'The Orion constellation is formed by 7 main stars that form its shape in the sky.', 305);
INSERT INTO public.constellation VALUES (61, 'Pavo', 'peacock', 'Peacock', 'The Pavo constellation is formed by 7 main stars.', 104);
INSERT INTO public.constellation VALUES (62, 'Pegasus', 'Pegasus (mythological winged horse)', 'Enif', 'The Pegasus constellation is formed by 9 or 17 main stars depending on the illustration you look at.', 201);
INSERT INTO public.constellation VALUES (63, 'Perseus', 'Perseus (mythological character)', 'Mirfak', 'The Perseus constellation is formed by 19 main stars.', 174);
INSERT INTO public.constellation VALUES (64, 'Phoenix', 'phoenix', 'Ankaa', 'The Phoenix constellation is a small group formed by only 4 main stars.', 95);
INSERT INTO public.constellation VALUES (65, 'Pictor', 'easel', 'α Pictoris', 'The Pictor constellation is a small group formed by only 3 main stars.', 62);
INSERT INTO public.constellation VALUES (66, 'Pisces', 'fishes', 'Alpherg', 'The Pisces constellation is formed by 18 main stars.', 177);
INSERT INTO public.constellation VALUES (67, 'Piscis Austrinus', 'southern fish', 'Fomalhaut', 'The Piscis Austrinus constellation is formed by 7 main stars.', 62);
INSERT INTO public.constellation VALUES (68, 'Puppis', 'poop deck', 'Naos', 'The Puppis constellation is formed by 9 main stars.', 259);
INSERT INTO public.constellation VALUES (69, 'Pyxis', 'mariners compass', 'α Pyxidis', 'The Pyxis constellation is a small group formed only by 3 main stars.', 54);
INSERT INTO public.constellation VALUES (70, 'Reticulum', 'eyepiece graticule', 'α Reticuli', 'The Reticulum constellation is a small group formed only by 4 main stars.', 36);
INSERT INTO public.constellation VALUES (71, 'Sagitta', 'arrow', 'γ Sagittae', 'The Sagitta constellation is a small group formed only by 4 main stars.', 49);
INSERT INTO public.constellation VALUES (72, 'Sagittarius', 'archer', 'Kaus Australis', 'The Sagittarius constellation is formed by 12 main stars.', 231);
INSERT INTO public.constellation VALUES (73, 'Scorpius', 'scorpion', 'Antares', 'The Scorpius constellation is formed by 18 main stars.', 276);
INSERT INTO public.constellation VALUES (74, 'Sculptor', 'sculptor', 'α Sculptoris', 'The Sculptor constellation is formed by 4 main stars.', 78);
INSERT INTO public.constellation VALUES (75, 'Scutum', 'shield (of Sobieski)', 'α Scuti', 'The Scutum constellation is a very small group formed only by 2 main stars.', 74);
INSERT INTO public.constellation VALUES (76, 'Serpens', 'snake', 'Unukalhai', 'The Serpens constellation is formed by 11 main stars.', 136);
INSERT INTO public.constellation VALUES (77, 'Sextans', 'sextant', 'α Sextantis', 'The Sextans constellation is formed only by 3 main stars.', 64);
INSERT INTO public.constellation VALUES (78, 'Taurus', 'bull', 'Aldebaran', 'The Taurus constellation is formed by 19 main stars.', 248);
INSERT INTO public.constellation VALUES (79, 'Telescopium', 'telescope', 'α Telescopii', 'The Telescopium constellation is a very small group formed just by 2 main stars.', 71);
INSERT INTO public.constellation VALUES (80, 'Triangulum', 'triangle', 'β Trianguli', 'The Triangulum constellation is a very small group formed only by 3 main stars.', 45);
INSERT INTO public.constellation VALUES (81, 'Triangulum Australe', 'southern triangle', 'Atria', 'The Triangulum Australe constellation is a very small group formed only by 3 main stars.', 47);
INSERT INTO public.constellation VALUES (82, 'Tucana', 'toucan', 'α Tucanae', 'The Tucana constellation is a very small group formed only by 3 main stars.', 74);
INSERT INTO public.constellation VALUES (83, 'Ursa Major', 'great bear', 'Alioth', 'The Ursa Major constellation is formed by 20 main stars.', 248);
INSERT INTO public.constellation VALUES (84, 'Ursa Minor', 'lesser bear', 'Polaris', 'The Ursa Minor constellation is formed by 7 main stars that make up the “little bear” shape in the sky.', 59);
INSERT INTO public.constellation VALUES (85, 'Vela', 'sails', 'γ2 Velorum', 'The Vela constellation is formed by 5 main stars.', 262);
INSERT INTO public.constellation VALUES (86, 'Virgo', 'virgin or maiden', 'Spica', 'The Virgo constellation is formed by 15 main stars.', 212);
INSERT INTO public.constellation VALUES (87, 'Volans', 'flying fish', 'β Volantis', 'The Volans constellation is formed by 6 main stars.', 47);
INSERT INTO public.constellation VALUES (88, 'Vulpecula', 'fox', 'Anser', 'The Vulpecula constellation is formed by 5 main stars.', 124);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 'Andromeda, which is shortened from Andromeda Galaxy, gets its name from the area of the sky in which it appears, the constellation of Andromeda.', true, 1);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Corvus', 'Appearance is similar to an insects antennae.', false, 28);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'Centaurus', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', false, 19);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Coma Berenices', 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus, giving rise to its nicknames of the Black Eye or Evil Eye galaxy.', false, 25);
INSERT INTO public.galaxy VALUES (5, 'Bodes Galaxy', 'Ursa Major', 'Named for Johann Elert Bode who discovered this galaxy in 1774.', true, 83);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'Virgo', 'Looks are similar to a butterfly.', false, 86);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel Galaxy', 'Sculptor', 'Its visual appearance is similar to that of a spoked cartwheel.', false, 74);
INSERT INTO public.galaxy VALUES (8, 'Cigar Galaxy', 'Ursa Major', 'Appears similar in shape to a cigar.', false, 83);
INSERT INTO public.galaxy VALUES (9, 'Circinus Galaxy', 'Circinus', 'Named after the constellation it is located in (Circinus).', false, 23);
INSERT INTO public.galaxy VALUES (10, 'Coma Pinwheel Galaxy', 'Coma Benerices', 'Named after its resemblance to the Pinwheel Galaxy and its location in the Coma Benerices constellation.', false, 25);
INSERT INTO public.galaxy VALUES (11, 'Comet Galaxy', 'Sculptor', 'This galaxy is named after its unusual appearance looking like a comet.', false, 74);
INSERT INTO public.galaxy VALUES (12, 'Condor Galaxy', 'Pavo', 'Named after a condor a type of vulture that is one of the largest flying birds.', false, 61);
INSERT INTO public.galaxy VALUES (13, 'Cosmos Redshift 7', 'Sextans', 'The name of this galaxy is based on a Redshift (z) measurement of nearly 7 (actually z = 6.604).', false, 77);
INSERT INTO public.galaxy VALUES (14, 'Eye of Sauron', 'Canes Venatici', 'Due to its resemblance to the Eye of Sauron from The Lord of the Rings.', false, 13);
INSERT INTO public.galaxy VALUES (15, 'Fireworks Galaxy', 'Cygnus and Cepheus', 'Due to its bright and spotty appearance', false, 20);
INSERT INTO public.galaxy VALUES (16, 'Hockey Stick Galaxies', 'Canes Venatici', 'Its elongated and curved appearance resembles a hockey stick.', false, 13);
INSERT INTO public.galaxy VALUES (17, 'Hoags Object', 'Serpens Caput', 'This is named after Art Hoag, who discovered this ring galaxy.', false, 76);
INSERT INTO public.galaxy VALUES (18, 'Large Magellanic Cloud', 'Dorado/Mensa', 'Named after Ferdinand Magellan', true, 53);
INSERT INTO public.galaxy VALUES (19, 'Lindsay-Shapley Ring', 'Volans', 'Named after its discoverer Eric Lindsay his professor Harlow Shapley and its nature as a ring galaxy.', false, 87);
INSERT INTO public.galaxy VALUES (20, 'Little Sombrero Galaxy', 'Pegasus', 'Named after its similarity to the Sombrero Galaxy.', false, 62);
INSERT INTO public.galaxy VALUES (21, 'Malin 1', 'Coma Berenices', 'Discovered and named by David Malin.', false, 25);
INSERT INTO public.galaxy VALUES (22, 'Medusa Merger', 'Ursa Major', 'Ejected dust from the merging galaxies is said to look like the snakes that the Gorgon Medusa from Greek mythology had on her head.', false, 83);
INSERT INTO public.galaxy VALUES (23, 'Sculptor Dwarf Galaxy', 'Sculptor', 'Similar to the Sculpture Galaxies', false, 74);
INSERT INTO public.galaxy VALUES (24, 'Mice Galaxies', 'Coma Berenices', 'Appearance is similar to a mouse.', false, 25);
INSERT INTO public.galaxy VALUES (25, 'Small Magellanic Cloud', 'Tucana', 'Named after Ferdinand Magellan', true, 82);
INSERT INTO public.galaxy VALUES (26, 'Mayalls Object', 'Ursa Major', 'This is named after Nicholas Mayall of the Lick Observatory, who discovered it.', false, 83);
INSERT INTO public.galaxy VALUES (27, 'Milky Way', 'Sagittarius (centre)', 'The appearance from Earth of the galaxy—a band of light', true, 72);
INSERT INTO public.galaxy VALUES (28, 'Needle Galaxy', 'Coma Berenices', 'Named due to its slender appearance.', false, 25);
INSERT INTO public.galaxy VALUES (29, 'Wolf-Lundmark-Melotte', 'Cetus', 'Named for the three astromers instrumental in its discovery and identification.', false, 21);
INSERT INTO public.galaxy VALUES (30, 'Peekaboo Galaxy', 'Hydra', 'Galaxy (aka HIPASS J1131-31) was hidden behind a relatively fast-moving foreground star (TYC 7215-199-1) and became observable when the star moved aside.', false, 42);
INSERT INTO public.galaxy VALUES (31, 'Pinwheel Galaxy', 'Ursa Major', 'Similar in appearance to a pinwheel (toy).', false, 83);
INSERT INTO public.galaxy VALUES (32, 'Sculptor Galaxy', 'Sculptor', 'Named after its location in the Sculptor Constellation. Also called the Silver Dollar or Silver Coin Galaxy because of its light and circular appearance.', true, 74);
INSERT INTO public.galaxy VALUES (33, 'Sombrero Galaxy', 'Virgo', 'Similar in appearance to a sombrero.', false, 86);
INSERT INTO public.galaxy VALUES (34, 'Southern Pinwheel Galaxy', 'Hydra', 'Named after its resemblance to the Pinwheel Galaxy and its location in the southern celestial hemisphere.', false, 42);
INSERT INTO public.galaxy VALUES (35, 'Sunflower Galaxy', 'Canes Venatici', 'Similar in appearance to a sunflower.', false, 13);
INSERT INTO public.galaxy VALUES (36, 'Tadpole Galaxy', 'Draco', 'The name comes from the resemblance of the galaxy to a tadpole.', false, 34);
INSERT INTO public.galaxy VALUES (37, 'Triangulum Galaxy', 'Triangulum', 'Named after its location within the Triangulum constellation.', true, 80);
INSERT INTO public.galaxy VALUES (38, 'Whirlpool Galaxy', 'Canes Venatici', 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits.', false, 13);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 'I', 1738.000000, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 'I', 11.267000, 1877, 'Hall', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 'II', 6.380000, 1877, 'Hall', 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 'I', 1821.100000, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 'II', 1560.300000, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 'III', 2633.800000, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 'IV', 2408.800000, 1610, 'Galileo', 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter', 'V', 81.500000, 1892, 'Barnard', 5);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Saturn', 'I', 197.800000, 1789, 'Herschel', 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Saturn', 'II', 251.900000, 1789, 'Herschel', 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Saturn', 'III', 532.400000, 1684, 'Cassini', 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Saturn', 'IV', 561.000000, 1684, 'Cassini', 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Saturn', 'V', 762.800000, 1672, 'Cassini', 6);
INSERT INTO public.moon VALUES (14, 'Titan', 'Saturn', 'VI', 2574.640000, 1655, 'Huygens', 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Saturn', 'VII', 135.000000, 1848, 'W.Bond & G. Bond & Lassell', 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 'Saturn', 'VIII', 734.100000, 1671, 'Cassini', 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Uranus', 'I', 578.300000, 1851, 'Lassell', 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Uranus', 'II', 581.900000, 1851, 'Lassell', 7);
INSERT INTO public.moon VALUES (19, 'Titania', 'Uranus', 'III', 787.100000, 1787, 'Herschel', 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 'Uranus', 'IV', 758.800000, 1787, 'Herschel', 7);
INSERT INTO public.moon VALUES (21, 'Miranda', 'Uranus', 'V', 235.100000, 1948, 'Kuiper', 7);
INSERT INTO public.moon VALUES (22, 'Triton', 'Neptune', 'I', 1352.500000, 1846, 'Lassell', 8);
INSERT INTO public.moon VALUES (23, 'Nereid', 'Neptune', 'II', 145.000000, 1949, 'Kuiper', 8);
INSERT INTO public.moon VALUES (24, 'Naiad', 'Neptune', 'III', 30.000000, 1989, 'Terrile(Voyager 2)', 8);
INSERT INTO public.moon VALUES (25, 'Thalassa', 'Neptune', 'IV', 38.000000, 1989, 'Terrile(Voyager 2)', 8);
INSERT INTO public.moon VALUES (26, 'Despina', 'Neptune', 'V', 73.300000, 1989, 'Synnott(Voyager 2)', 8);
INSERT INTO public.moon VALUES (27, 'Galatea', 'Neptune', 'VI', 84.000000, 1989, 'Synnott(Voyager 2)', 8);
INSERT INTO public.moon VALUES (28, 'Larissa', 'Neptune', 'VII', 94.000000, 1981, 'Reitsema & Hubbard & Lebofsky & Tholen(Voyager 2)', 8);
INSERT INTO public.moon VALUES (29, 'Proteus', 'Neptune', 'VIII', 203.000000, 1989, 'Synnott(Voyager 2)', 8);
INSERT INTO public.moon VALUES (30, 'Vanth', 'Orcus', 'I', 216.000000, 2005, 'Brown & Suer', 14);
INSERT INTO public.moon VALUES (31, 'Charon', 'Pluto', 'I', 605.500000, 1978, 'Christy', 10);
INSERT INTO public.moon VALUES (32, 'Nix', 'Pluto', 'II', 22.500000, 2005, 'Weaver & Stern & Buie & et al.', 10);
INSERT INTO public.moon VALUES (33, 'Hydra', 'Pluto', 'III', 27.500000, 2005, 'Weaver & Stern & Buie & et al.', 10);
INSERT INTO public.moon VALUES (34, 'Kerberos', 'Pluto', 'IV', 7.000000, 2011, 'Showalter(Hubble)', 10);
INSERT INTO public.moon VALUES (35, 'Styx', 'Pluto', 'V', 5.500000, 2012, 'Showalter(Hubble)', 10);
INSERT INTO public.moon VALUES (36, 'Actaea', 'Salacia', 'I', 137.000000, 2006, 'Noll et al.', 15);
INSERT INTO public.moon VALUES (37, 'Hi?iaka', 'Haumea', 'I', 160.000000, 2005, 'Brown et al.', 11);
INSERT INTO public.moon VALUES (38, 'Namaka', 'Haumea', 'II', 85.000000, 2005, 'Brown et al.', 11);
INSERT INTO public.moon VALUES (39, 'Weywot', 'Quaoar', 'I', 37.000000, 2007, 'Brown', 16);
INSERT INTO public.moon VALUES (40, 'S2015 (136472) 1', 'Makemake', NULL, 87.500000, 2016, 'Parker et al.', 12);
INSERT INTO public.moon VALUES (41, 'Ilmarë', 'Varda', 'I', 145.000000, 2009, 'Noll et al.', 13);
INSERT INTO public.moon VALUES (42, 'Xiangliu', 'Gonggong', 'I', 100.000000, 2010, 'Marton & Kiss & Müller', 17);
INSERT INTO public.moon VALUES (43, 'Dysnomia', 'Eris', 'I', 290.000000, 2005, 'Brown & Rabinowitz & Trujillo et al.', 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.240846700, 58.646225000, false, 'Prehistoric', 'Terrestrial Planet', 9);
INSERT INTO public.planet VALUES (2, 'Venus', 0.615197260, 243.018700000, false, 'Prehistoric', 'Terrestrial Planet', 14);
INSERT INTO public.planet VALUES (3, 'Earth', 1.000017400, 0.997269680, true, 'Prehistoric', 'Terrestrial Planet', 15);
INSERT INTO public.planet VALUES (4, 'Mars', 1.880847600, 1.025956750, true, 'Prehistoric', 'Terrestrial Planet', 12);
INSERT INTO public.planet VALUES (5, 'JUpiter', 11.862615000, 0.413540000, true, 'Prehistoric', 'Gas Giant Planet', 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 29.447498000, 0.444010000, true, 'Prehistoric', 'Gas Giant Planet', 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 84.016846000, 0.718330000, true, '1781', 'Ice Giant Planet', 13);
INSERT INTO public.planet VALUES (8, 'Neptune', 164.791320000, 0.671250000, true, '1846', 'Ice Giant Planet', 12);
INSERT INTO public.planet VALUES (9, 'Ceres', 4.599000000, 0.378100000, false, '1801', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (10, 'Pluto', 247.900000000, 6.387200000, true, '1930', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (11, 'Haumea', 283.800000000, 0.163100000, true, '2004', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (12, 'Makemake', 306.200000000, 0.951100000, true, '2005', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (13, 'Eris', 559.000000000, 15.785900000, true, '2005', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (14, 'Orcus', 247.490000000, NULL, true, '2004', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (15, 'Salacia', 273.980000000, NULL, true, '2004', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (16, 'Quaoar', 287.970000000, 0.736700000, true, '2002', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (17, 'Gonggong', 552.520000000, 0.933300000, true, '2007', 'Dwarf Planet', 15);
INSERT INTO public.planet VALUES (18, 'Sedna', 12059.000000000, 0.428000000, false, '2003', 'Dwarf Planet', 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Rigel', 'Orion', 120000.0000, '2016-06-30', 'Rigel also called Beta Orionis one of the brightest stars in the sky intrinsically as well as in appearance. A blue-white supergiant in the constellation Orion.', 863.000, 27);
INSERT INTO public.star VALUES (2, 'Procyon', 'Canis Minor', 7.7000, '2016-06-30', 'Procyon lies 11.4 light-years from Earth and is a visual binary a bright yellow-white subgiant with a faint white dwarf companion of about the 10th magnitude.', 11.460, 27);
INSERT INTO public.star VALUES (3, 'Achernar', 'Eridanus', 3000.0000, '2016-06-30', 'It is a binary star with a B-type star Achernar A as its primary and a much fainter A-type star Achernar B orbiting the primary at a distance of 6.7 astronomical units.', 139.000, 27);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Orion', 60000.0000, '2016-06-30', 'Betelgeuse is one of the most luminous stars in the night sky. It is a variable star and usually has an apparent magnitude of about 0.6.', 548.000, 27);
INSERT INTO public.star VALUES (5, 'Hadar', 'Centaurus', 42000.0000, '2016-08-21', 'Beta Centauri also called Hadar or Agena second brightest star (after Alpha Centauri) in the southern constellation Centaurus and the 10th brightest star in the sky.', 390.000, 27);
INSERT INTO public.star VALUES (6, 'Capella', 'Auriga', 150.0000, '2016-06-30', 'Capella(Latin: “She-Goat”) also called Alpha Aurigae sixth brightest star in the night sky and the brightest in the constellation Auriga with an apparent visual magnitude of 0.08.', 42.919, 27);
INSERT INTO public.star VALUES (7, 'Altair', 'Aquila', 10.5000, '2016-06-30', 'Altair  forms the prominent asterism of the Summer Triangle.', 16.730, 27);
INSERT INTO public.star VALUES (8, 'Aldebaran', 'Taurus', 520.0000, '2016-06-30', 'Aldebaran is one of the 15 brightest stars with an apparent visual magnitude of 0.85.', 65.300, 27);
INSERT INTO public.star VALUES (9, 'Spica', 'Virgo', 20512.0000, '2016-06-30', 'Spica brightest star in the zodiacal constellation Virgo and one of the 15 brightest in the entire sky.', 250.000, 27);
INSERT INTO public.star VALUES (10, 'Antares', 'Scorpius', 75000.0000, '2016-06-30', 'Antares the brightest star in the zodiacal constellation Scorpius and one of the largest known stars.', 550.000, 27);
INSERT INTO public.star VALUES (11, 'Pollux', 'Gemini', 43.0000, '2015-12-15', 'Pollux brightest star in the zodiacal constellation Gemini. A reddish giant star it has an apparent visual magnitude of 1.15. The stars Castor and Pollux are named for the mythological twins.', 33.780, 27);
INSERT INTO public.star VALUES (12, 'Fomalhaut', 'Piscis Austrinus', 16.6000, '2015-12-15', 'Fomalhaut is the 18th star (excluding the Sun) in order of apparent brightness. It is used in navigation because of its conspicuous place in a sky region otherwise lacking in bright stars.', 25.130, 27);
INSERT INTO public.star VALUES (13, 'Deneb', 'Cygnus', 200000.0000, '2016-06-30', 'Deneb one of the brightest stars with an apparent magnitude of 1.25. This star at about 1,500 light-years distance is the most remote (and brightest intrinsically) of the 20 apparently brightest stars.', 2615.000, 27);
INSERT INTO public.star VALUES (14, 'Mimosa', 'Crux', 34000.0000, '2016-07-20', 'Beta Crucis also called Mimosa or Becrux second brightest star (after Alpha Crucis) in the southern constellation Crux (the Southern Cross) and the 20th brightest star in the sky.', 280.000, 27);
INSERT INTO public.star VALUES (15, 'Sun', NULL, 3.7500, NULL, 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma heated to incandescence by nuclear fusion reactions in its core. The Sun radiates this energy mainly as light ultraviolet and infrared radiation and is the most important source of energy for life on Earth.', 148.890, 27);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 88, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 38, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 43, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: constellation constellation_brightest_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_brightest_star_key UNIQUE (brightest_star);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- PostgreSQL database dump complete
--

