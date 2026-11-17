CREATE TABLE seats (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    hall_id BIGINT NOT NULL,
    seat_type_id BIGINT NOT NULL,
    row_number INTEGER NOT NULL CHECK (row_number > 0),
    seat_number INTEGER NOT NULL CHECK (seat_number > 0),
    pos_x NUMERIC(8, 2),
    pos_y NUMERIC(8, 2),
    UNIQUE (hall_id, row_number, seat_number)
);