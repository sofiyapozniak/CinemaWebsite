--Связывает фильмы и жанры. Если фильм или жанр удаляется, соответствующая запись в промежуточной таблице тоже удаляется.
ALTER TABLE movie_genres
ADD CONSTRAINT fk_movie_genres_movies
FOREIGN KEY (movie_id)
REFERENCES movies(id)
ON DELETE CASCADE;

ALTER TABLE movie_genres
ADD CONSTRAINT fk_movie_genres_genres
FOREIGN KEY (genre_id)
REFERENCES genres(id)
ON DELETE CASCADE;ы