CREATE TABLE transactions (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT NOT NULL,
    booking_id BIGINT,
    type VARCHAR(20) NOT NULL
        CHECK (type IN ('top_up', 'purchase', 'refund')),
    amount NUMERIC(12, 2) NOT NULL
        CHECK (amount > 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);