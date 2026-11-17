CREATE TABLE sessions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    movie_id BIGINT NOT NULL,
    hall_id BIGINT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    format VARCHAR(10) NOT NULL
        CHECK (format IN ('2D', '3D')),
    base_price NUMERIC(10, 2) NOT NULL
        CHECK (base_price >= 0),
    status VARCHAR(20) NOT NULL DEFAULT 'active'
        CHECK (status IN ('active', 'cancelled')),
    CHECK (end_time > start_time)
);