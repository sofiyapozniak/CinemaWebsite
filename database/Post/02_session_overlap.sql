-- Добавление ограничения, запрещающего пересечение
-- активных сеансов в одном и том же зале.
ALTER TABLE sessions
ADD CONSTRAINT no_overlapping_sessions
EXCLUDE USING GIST (
    hall_id WITH =,
    tsrange(start_time, end_time, '[)') WITH &&
)
WHERE (status = 'active');