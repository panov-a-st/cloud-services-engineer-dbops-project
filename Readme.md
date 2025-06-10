# Проектная работы дисциплины DBOps

## Выполните следующие шаги

### Шаг 1
Установите базу данных и подключитесь к ней, создайте пользователя нового пользователя на примере `user_store`, например следующим образом на стороне сервера:
Предполагается, что сама база уже установлена

```bash
sudo -i -u postgres
psql
```
Далее создайте пользователя и предоставьте ему права доступа
```sql
CREATE USER user_store WITH PASSWORD 'user_password';
CREATE DATABASE store OWNER user_store;
```

### Шаг 2

Добавьте в Action secrets следующие данные

```
DB_HOST=<host_ip>
DB_NAME=store
DB_PORT=5432
DB_USER=user_store
DB_PASSWORD=password_store
```

### Описание миграций
`V001__create_tables.sql` - повторяет структуру, которая есть у начальной DB
