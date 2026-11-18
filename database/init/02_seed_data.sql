-- Начальные данные для базы данных CinemaWebsite

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

-- Начальный кинотеатр
INSERT INTO public.cinemas (name, address, phone, email, working_hours)
VALUES (
    'Cinema',
    'Адрес кинотеатра',
    NULL,
    NULL,
    '10:00-23:00'
);

-- Первый зал для кинотеатра
INSERT INTO public.halls (cinema_id, name)
VALUES (
    (SELECT id FROM public.cinemas WHERE name = 'Cinema'),
    'Зал 1'
);
