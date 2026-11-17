--Связывает сеансы с фильмами и залами.
ALTER TABLE sessions
ADD CONSTRAINT fk_sessions_movies
FOREIGN KEY (movie_id)
REFERENCES movies(id)
ON DELETE RESTRICT;

ALTER TABLE sessions
ADD CONSTRAINT fk_sessions_halls
FOREIGN KEY (hall_id)
REFERENCES halls(id)
ON DELETE RESTRICT;