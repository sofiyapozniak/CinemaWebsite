
-- Начальные данные для справочников CinemaWebsite

-- Роли пользователей
INSERT INTO public.roles (name)
VALUES
    ('user'),
    ('admin');

-- Типы мест и коэффициенты стоимости
INSERT INTO public.seat_types (name, price_coefficient)
VALUES
    ('Стандарт', 1.00),
    ('Комфорт', 1.20),
    ('VIP', 1.50);

-- Жанры фильмов
INSERT INTO public.genres (name)
VALUES
    ('Комедия'),
    ('Драма'),
    ('Ужасы'),
    ('Фантастика'),
    ('Боевик'),
    ('Мультфильм'),
    ('Триллер'),
    ('Мелодрама');
