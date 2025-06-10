# Проектная работы дисциплины DBOps

## Представленные миграции и их краткое описание
`migrations/V001__create_tables.sql` - повторяет структуру, которая есть у начальной DB

`migrations/V002__change_schema.sql` - изменение структуры базы данных, удаление неиспользуемых таблиц

`migrations/V003__insert_data.sql` - добавляет данные

`migrations/V004__create_index.sql` - создает индексы

## Выполните следующие шаги для того, чтобы получить рабочую базу данных и выполнить тесты

### Шаг 1
Установите базу данных и подключитесь к ней. Далее создайте нового пользователя, например, следующим образом на стороне сервера:

```bash
sudo -i -u postgres
psql
```

Пример команды создания пользователя и предоставления ему прав доступа
```sql
CREATE USER user_store WITH PASSWORD 'user_password';
CREATE DATABASE store OWNER user_store;
```

### Шаг 2

Добавьте в Github Action secrets следующие данные

```
DB_HOST=<host_ip>
DB_NAME=store
DB_PORT=5432
DB_USER=user_store
DB_PASSWORD=password_store
```

### Шаг 3
Готово! Убедитесь, что тесты пройдены успешно.

## Получение количества сосисок, проданных за каждый день предыдущей недели
### Для получения данных выполните следующий запрос
```sql
SELECT o.date_created, SUM(op.quantity) 
FROM orders AS o JOIN order_product AS op ON o.id = op.order_id
WHERE o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 day'
GROUP BY o.date_created;
```

## Полезные команды

### Подключение к DB:
```bash
psql -h <host_ip> -p <port> -U user_store -d store
```

### Спасибо за внимание!