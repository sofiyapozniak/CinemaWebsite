
-- Создание начального кинотеатра.

INSERT INTO cinemas (name, address, phone, email, working_hours)
VALUES (
    'Cinema',
    'Адрес кинотеатра',
    NULL,
    NULL,
    '10:00-23:00'
);

-- Создание первого зала для кинотеатра.

INSERT INTO halls (cinema_id, name)
VALUES (
    (SELECT id FROM cinemas WHERE name = 'Cinema'),
    'Зал 1'
);
