CREATE TABLE seat_types (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    price_coefficient NUMERIC(5, 2) NOT NULL
        CHECK (price_coefficient > 0)
);