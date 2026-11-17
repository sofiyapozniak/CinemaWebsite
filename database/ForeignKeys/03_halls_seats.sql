--Связывает кинотеатры, залы, места и типы мест.
ALTER TABLE halls
ADD CONSTRAINT fk_halls_cinemas
FOREIGN KEY (cinema_id)
REFERENCES cinemas(id)
ON DELETE RESTRICT;

ALTER TABLE seats
ADD CONSTRAINT fk_seats_halls
FOREIGN KEY (hall_id)
REFERENCES halls(id)
ON DELETE RESTRICT;

ALTER TABLE seats
ADD CONSTRAINT fk_seats_seat_types
FOREIGN KEY (seat_type_id)
REFERENCES seat_types(id)
ON DELETE RESTRICT;