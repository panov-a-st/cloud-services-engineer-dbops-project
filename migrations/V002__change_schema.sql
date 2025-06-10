-- Добавим первичные ключи
ALTER TABLE product ADD PRIMARY KEY (id);
ALTER TABLE orders ADD PRIMARY KEY (id);

-- Добавим столбец price в таблицу product
ALTER TABLE product ADD price DOUBLE PRECISION;

-- Добавление добавим date_created в orders
ALTER TABLE orders ADD date_created date;

-- Добавим связи в таблицу order_product
ALTER TABLE order_product ADD CONSTRAINT order_product_order_id_orders_id FOREIGN KEY (order_id) REFERENCES orders (id);
ALTER TABLE order_product ADD CONSTRAINT order_product_product_id_product_id FOREIGN KEY (product_id) REFERENCES product (id);

-- Удаление таблиц product_info, orders_date
DROP TABLE product_info, orders_date;
