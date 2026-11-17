--Связывает бронирования с пользователями и сеансами, а билеты — с бронированиями и местами.
ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_users
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE RESTRICT;

ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_sessions
FOREIGN KEY (session_id)
REFERENCES sessions(id)
ON DELETE RESTRICT;

ALTER TABLE tickets
ADD CONSTRAINT fk_tickets_bookings
FOREIGN KEY (booking_id)
REFERENCES bookings(id)
ON DELETE RESTRICT;

ALTER TABLE tickets
ADD CONSTRAINT fk_tickets_seats
FOREIGN KEY (seat_id)
REFERENCES seats(id)
ON DELETE RESTRICT;