-- Добавление стандартных ролей пользователей:

INSERT INTO roles (name)
VALUES
    ('user'),
    ('admin');

-- Добавление типов мест и коэффициентов стоимости:
-- ordinary — обычное место;
-- sofa — диван;
-- vip — VIP-место.

INSERT INTO seat_types (name, price_coefficient)
VALUES
    ('ordinary', 1.00),
    ('sofa', 1.50),
    ('vip', 2.00);

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