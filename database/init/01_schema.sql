--
-- PostgreSQL database dump
--

-- Dumped from database version 17.12 (Debian 17.12-1.pgdg13+1)
-- Dumped by pg_dump version 17.0

-- Started on 2026-11-17 23:56:58

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16576)
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 16521)
-- Name: bookings; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    session_id bigint NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying NOT NULL,
    expires_at timestamp without time zone,
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'cancelled'::character varying, 'expired'::character varying])::text[])))
);
ALTER TABLE ONLY public.bookings ALTER COLUMN id SET (pg_attver=27748528);
ALTER TABLE ONLY public.bookings ALTER COLUMN user_id SET (pg_attver=27748528);
ALTER TABLE ONLY public.bookings ALTER COLUMN session_id SET (pg_attver=27748528);
ALTER TABLE ONLY public.bookings ALTER COLUMN created_at SET (pg_attver=27748528);
ALTER TABLE ONLY public.bookings ALTER COLUMN status SET (pg_attver=27748528);
ALTER TABLE ONLY public.bookings ALTER COLUMN expires_at SET (pg_attver=30299216);


ALTER TABLE public.bookings OWNER TO cinema_user;

--
-- TOC entry 237 (class 1259 OID 16520)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.bookings ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16448)
-- Name: cinemas; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.cinemas (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(255) NOT NULL,
    phone character varying(20),
    email character varying(150),
    working_hours character varying(100)
);
ALTER TABLE ONLY public.cinemas ALTER COLUMN id SET (pg_attver=27345936);
ALTER TABLE ONLY public.cinemas ALTER COLUMN name SET (pg_attver=27345936);
ALTER TABLE ONLY public.cinemas ALTER COLUMN address SET (pg_attver=27345936);
ALTER TABLE ONLY public.cinemas ALTER COLUMN phone SET (pg_attver=27345936);
ALTER TABLE ONLY public.cinemas ALTER COLUMN email SET (pg_attver=30203184);
ALTER TABLE ONLY public.cinemas ALTER COLUMN working_hours SET (pg_attver=30203624);


ALTER TABLE public.cinemas OWNER TO cinema_user;

--
-- TOC entry 227 (class 1259 OID 16447)
-- Name: cinemas_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.cinemas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cinemas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16425)
-- Name: genres; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);
ALTER TABLE ONLY public.genres ALTER COLUMN id SET (pg_attver=27174008);
ALTER TABLE ONLY public.genres ALTER COLUMN name SET (pg_attver=27174008);


ALTER TABLE public.genres OWNER TO cinema_user;

--
-- TOC entry 224 (class 1259 OID 16424)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.genres ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16456)
-- Name: halls; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.halls (
    id bigint NOT NULL,
    cinema_id bigint NOT NULL,
    name character varying(100) NOT NULL
);
ALTER TABLE ONLY public.halls ALTER COLUMN id SET (pg_attver=27370096);
ALTER TABLE ONLY public.halls ALTER COLUMN cinema_id SET (pg_attver=27370096);
ALTER TABLE ONLY public.halls ALTER COLUMN name SET (pg_attver=27370096);


ALTER TABLE public.halls OWNER TO cinema_user;

--
-- TOC entry 229 (class 1259 OID 16455)
-- Name: halls_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.halls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.halls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16432)
-- Name: movie_genres; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.movie_genres (
    movie_id bigint NOT NULL,
    genre_id bigint NOT NULL
);
ALTER TABLE ONLY public.movie_genres ALTER COLUMN movie_id SET (pg_attver=27256528);
ALTER TABLE ONLY public.movie_genres ALTER COLUMN genre_id SET (pg_attver=27256528);


ALTER TABLE public.movie_genres OWNER TO cinema_user;

--
-- TOC entry 223 (class 1259 OID 16416)
-- Name: movies; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.movies (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    duration_min integer NOT NULL,
    age_rating character varying(10) NOT NULL,
    release_year integer,
    poster_url character varying(500),
    original_title character varying(255),
    country character varying(100),
    director character varying(150),
    actors text,
    trailer_url character varying(500),
    rental_start date,
    rental_end date
);
ALTER TABLE ONLY public.movies ALTER COLUMN id SET (pg_attver=27146840);
ALTER TABLE ONLY public.movies ALTER COLUMN title SET (pg_attver=27146840);
ALTER TABLE ONLY public.movies ALTER COLUMN description SET (pg_attver=27146840);
ALTER TABLE ONLY public.movies ALTER COLUMN duration_min SET (pg_attver=27146840);
ALTER TABLE ONLY public.movies ALTER COLUMN age_rating SET (pg_attver=27146840);
ALTER TABLE ONLY public.movies ALTER COLUMN release_year SET (pg_attver=29864824);
ALTER TABLE ONLY public.movies ALTER COLUMN poster_url SET (pg_attver=29864824);
ALTER TABLE ONLY public.movies ALTER COLUMN original_title SET (pg_attver=30045080);
ALTER TABLE ONLY public.movies ALTER COLUMN country SET (pg_attver=30045928);
ALTER TABLE ONLY public.movies ALTER COLUMN director SET (pg_attver=30046368);
ALTER TABLE ONLY public.movies ALTER COLUMN actors SET (pg_attver=30046808);
ALTER TABLE ONLY public.movies ALTER COLUMN trailer_url SET (pg_attver=30047248);
ALTER TABLE ONLY public.movies ALTER COLUMN rental_start SET (pg_attver=30047688);
ALTER TABLE ONLY public.movies ALTER COLUMN rental_end SET (pg_attver=30050952);


ALTER TABLE public.movies OWNER TO cinema_user;

--
-- TOC entry 222 (class 1259 OID 16415)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.movies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16391)
-- Name: roles; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);
ALTER TABLE ONLY public.roles ALTER COLUMN id SET (pg_attver=26875072);
ALTER TABLE ONLY public.roles ALTER COLUMN name SET (pg_attver=26875072);


ALTER TABLE public.roles OWNER TO cinema_user;

--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16467)
-- Name: seat_types; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.seat_types (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    price_coefficient numeric(4,2) NOT NULL
);
ALTER TABLE ONLY public.seat_types ALTER COLUMN id SET (pg_attver=27393568);
ALTER TABLE ONLY public.seat_types ALTER COLUMN name SET (pg_attver=27393568);
ALTER TABLE ONLY public.seat_types ALTER COLUMN price_coefficient SET (pg_attver=27425568);


ALTER TABLE public.seat_types OWNER TO cinema_user;

--
-- TOC entry 231 (class 1259 OID 16466)
-- Name: seat_types_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.seat_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.seat_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16483)
-- Name: seats; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.seats (
    id bigint NOT NULL,
    hall_id bigint NOT NULL,
    seat_type_id bigint NOT NULL,
    row_number integer NOT NULL,
    seat_number integer NOT NULL,
    pos_x integer,
    pos_y integer
);
ALTER TABLE ONLY public.seats ALTER COLUMN id SET (pg_attver=27533696);
ALTER TABLE ONLY public.seats ALTER COLUMN hall_id SET (pg_attver=27533696);
ALTER TABLE ONLY public.seats ALTER COLUMN seat_type_id SET (pg_attver=27533696);
ALTER TABLE ONLY public.seats ALTER COLUMN row_number SET (pg_attver=27533696);
ALTER TABLE ONLY public.seats ALTER COLUMN seat_number SET (pg_attver=27533696);
ALTER TABLE ONLY public.seats ALTER COLUMN pos_x SET (pg_attver=30247408);
ALTER TABLE ONLY public.seats ALTER COLUMN pos_y SET (pg_attver=30255280);


ALTER TABLE public.seats OWNER TO cinema_user;

--
-- TOC entry 233 (class 1259 OID 16482)
-- Name: seats_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.seats ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.seats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16501)
-- Name: sessions; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    movie_id bigint NOT NULL,
    hall_id bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    base_price numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    CONSTRAINT sessions_base_price_check CHECK ((base_price >= (0)::numeric)),
    CONSTRAINT sessions_check CHECK ((end_time > start_time)),
    CONSTRAINT sessions_status_check CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'cancelled'::character varying])::text[])))
);
ALTER TABLE ONLY public.sessions ALTER COLUMN id SET (pg_attver=27614624);
ALTER TABLE ONLY public.sessions ALTER COLUMN movie_id SET (pg_attver=27614624);
ALTER TABLE ONLY public.sessions ALTER COLUMN hall_id SET (pg_attver=27614624);
ALTER TABLE ONLY public.sessions ALTER COLUMN start_time SET (pg_attver=27614624);
ALTER TABLE ONLY public.sessions ALTER COLUMN end_time SET (pg_attver=27614624);
ALTER TABLE ONLY public.sessions ALTER COLUMN base_price SET (pg_attver=27614624);
ALTER TABLE ONLY public.sessions ALTER COLUMN status SET (pg_attver=27614624);


ALTER TABLE public.sessions OWNER TO cinema_user;

--
-- TOC entry 235 (class 1259 OID 16500)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.sessions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 16541)
-- Name: tickets; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    seat_id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT tickets_price_check CHECK ((price >= (0)::numeric))
);
ALTER TABLE ONLY public.tickets ALTER COLUMN id SET (pg_attver=27947968);
ALTER TABLE ONLY public.tickets ALTER COLUMN booking_id SET (pg_attver=27947968);
ALTER TABLE ONLY public.tickets ALTER COLUMN seat_id SET (pg_attver=27947968);
ALTER TABLE ONLY public.tickets ALTER COLUMN price SET (pg_attver=27947968);


ALTER TABLE public.tickets OWNER TO cinema_user;

--
-- TOC entry 239 (class 1259 OID 16540)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.tickets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 16558)
-- Name: transactions; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    booking_id bigint,
    type character varying(20) NOT NULL,
    amount numeric(12,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT transactions_amount_check CHECK ((amount > (0)::numeric)),
    CONSTRAINT transactions_type_check CHECK (((type)::text = ANY ((ARRAY['top_up'::character varying, 'purchase'::character varying, 'refund'::character varying])::text[])))
);
ALTER TABLE ONLY public.transactions ALTER COLUMN id SET (pg_attver=28039568);
ALTER TABLE ONLY public.transactions ALTER COLUMN user_id SET (pg_attver=28039568);
ALTER TABLE ONLY public.transactions ALTER COLUMN booking_id SET (pg_attver=28039568);
ALTER TABLE ONLY public.transactions ALTER COLUMN type SET (pg_attver=28039568);
ALTER TABLE ONLY public.transactions ALTER COLUMN amount SET (pg_attver=28039568);
ALTER TABLE ONLY public.transactions ALTER COLUMN created_at SET (pg_attver=28039568);


ALTER TABLE public.transactions OWNER TO cinema_user;

--
-- TOC entry 241 (class 1259 OID 16557)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
--

ALTER TABLE public.transactions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16400)
-- Name: users; Type: TABLE; Schema: public; Owner: cinema_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(30),
    balance numeric(12,2) DEFAULT 0 NOT NULL,
    CONSTRAINT users_balance_check CHECK ((balance >= (0)::numeric))
);
ALTER TABLE ONLY public.users ALTER COLUMN id SET (pg_attver=27030712);
ALTER TABLE ONLY public.users ALTER COLUMN role_id SET (pg_attver=27030712);
ALTER TABLE ONLY public.users ALTER COLUMN first_name SET (pg_attver=27030712);
ALTER TABLE ONLY public.users ALTER COLUMN email SET (pg_attver=27030712);
ALTER TABLE ONLY public.users ALTER COLUMN password_hash SET (pg_attver=27030712);
ALTER TABLE ONLY public.users ALTER COLUMN created_at SET (pg_attver=27030712);
ALTER TABLE ONLY public.users ALTER COLUMN last_name SET (pg_attver=29641688);
ALTER TABLE ONLY public.users ALTER COLUMN phone SET (pg_attver=29697040);
ALTER TABLE ONLY public.users ALTER COLUMN balance SET (pg_attver=29721712);


ALTER TABLE public.users OWNER TO cinema_user;

--
-- TOC entry 220 (class 1259 OID 16399)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: cinema_user
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
-- TOC entry 3645 (class 2606 OID 16529)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 3629 (class 2606 OID 16454)
-- Name: cinemas cinemas_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT cinemas_pkey PRIMARY KEY (id);


--
-- TOC entry 3623 (class 2606 OID 16431)
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- TOC entry 3625 (class 2606 OID 16429)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3631 (class 2606 OID 16460)
-- Name: halls halls_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.halls
    ADD CONSTRAINT halls_pkey PRIMARY KEY (id);


--
-- TOC entry 3627 (class 2606 OID 16436)
-- Name: movie_genres movie_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_pkey PRIMARY KEY (movie_id, genre_id);


--
-- TOC entry 3621 (class 2606 OID 16423)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 3613 (class 2606 OID 16397)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 3615 (class 2606 OID 16395)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3633 (class 2606 OID 16474)
-- Name: seat_types seat_types_name_key; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.seat_types
    ADD CONSTRAINT seat_types_name_key UNIQUE (name);


--
-- TOC entry 3635 (class 2606 OID 16472)
-- Name: seat_types seat_types_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.seat_types
    ADD CONSTRAINT seat_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 16489)
-- Name: seats seats_hall_id_row_number_seat_number_key; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_hall_id_row_number_seat_number_key UNIQUE (hall_id, row_number, seat_number);


--
-- TOC entry 3639 (class 2606 OID 16487)
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (id);


--
-- TOC entry 3641 (class 2606 OID 17227)
-- Name: sessions sessions_no_time_overlap; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_no_time_overlap EXCLUDE USING gist (hall_id WITH =, tsrange(start_time, end_time, '[)'::text) WITH &&) WHERE (((status)::text = 'active'::text));


--
-- TOC entry 3643 (class 2606 OID 16509)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3647 (class 2606 OID 16546)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 3649 (class 2606 OID 16565)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3617 (class 2606 OID 16409)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3619 (class 2606 OID 16407)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3658 (class 2606 OID 16535)
-- Name: bookings bookings_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id);


--
-- TOC entry 3659 (class 2606 OID 16530)
-- Name: bookings bookings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3653 (class 2606 OID 16461)
-- Name: halls halls_cinema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.halls
    ADD CONSTRAINT halls_cinema_id_fkey FOREIGN KEY (cinema_id) REFERENCES public.cinemas(id);


--
-- TOC entry 3651 (class 2606 OID 16442)
-- Name: movie_genres movie_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON DELETE CASCADE;


--
-- TOC entry 3652 (class 2606 OID 16437)
-- Name: movie_genres movie_genres_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;


--
-- TOC entry 3654 (class 2606 OID 16490)
-- Name: seats seats_hall_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_hall_id_fkey FOREIGN KEY (hall_id) REFERENCES public.halls(id);


--
-- TOC entry 3655 (class 2606 OID 16495)
-- Name: seats seats_seat_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_seat_type_id_fkey FOREIGN KEY (seat_type_id) REFERENCES public.seat_types(id);


--
-- TOC entry 3656 (class 2606 OID 16515)
-- Name: sessions sessions_hall_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_hall_id_fkey FOREIGN KEY (hall_id) REFERENCES public.halls(id) ON DELETE RESTRICT;


--
-- TOC entry 3657 (class 2606 OID 16510)
-- Name: sessions sessions_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE RESTRICT;


--
-- TOC entry 3660 (class 2606 OID 16547)
-- Name: tickets tickets_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE RESTRICT;


--
-- TOC entry 3661 (class 2606 OID 16552)
-- Name: tickets tickets_seat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_seat_id_fkey FOREIGN KEY (seat_id) REFERENCES public.seats(id) ON DELETE RESTRICT;


--
-- TOC entry 3662 (class 2606 OID 16571)
-- Name: transactions transactions_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE RESTRICT;


--
-- TOC entry 3663 (class 2606 OID 16566)
-- Name: transactions transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- TOC entry 3650 (class 2606 OID 16410)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cinema_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2026-11-17 23:56:59

--
-- PostgreSQL database dump complete
--

