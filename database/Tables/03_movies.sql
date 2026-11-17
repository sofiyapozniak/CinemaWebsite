CREATE TABLE movies (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    original_title VARCHAR(255),
    description TEXT,
    duration_min INTEGER NOT NULL CHECK (duration_min > 0),
    release_year INTEGER,
    country VARCHAR(100),
    director VARCHAR(255),
    age_rating VARCHAR(10),
    actors TEXT,
    poster_url TEXT,
    trailer_url TEXT,
    rental_start DATE,
    rental_end DATE
);