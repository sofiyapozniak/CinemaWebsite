# Веб-сайт кинотеатра

Учебный проект для практики в колледже. Сайт кинотеатра с афишей, расписанием сеансов и покупкой билетов с выбором мест.

База данных: PostgreSQL, 13 таблиц.

Описание функций и схема базы данных: [functions-and-db.pdf](./functions-and-db.pdf)

## Запуск базы данных

База поднимается в Docker через `docker compose`:

```bash
docker compose up -d
```

Параметры подключения:

- хост: `localhost`
- порт: `5432`
- база данных: `cinema`
- пользователь: `cinema_user`
- пароль: `cinema_pass`

Скрипты из `database/init/` (схема и начальные данные) выполняются автоматически
при первом запуске, пока папка `database/data/` пуста.

Остановка:

```bash
docker compose down
```

Пересоздание базы с нуля (удаляет все данные):

```bash
docker compose down
rm -rf database/data
docker compose up -d
```

Данные базы хранятся в `database/data/` и в git не попадают (см. `.gitignore`).
