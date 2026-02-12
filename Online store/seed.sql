-- ------------------------
-- order_status
-- ------------------------
INSERT INTO order_status (id, status_name, description) VALUES
(1, 'NEW', 'Новый заказ'),
(2, 'PAID', 'Оплаченный заказ'),
(3, 'SHIPPED', 'Отправлен'),
(4, 'DELIVERED', 'Доставлен');

-- ------------------------
-- customer
-- ------------------------
INSERT INTO customer (first_name, last_name, email, phone, registration_date) VALUES
('Ivan', 'Ivanov', 'ivan@example.com', '+79260000001', '2026-01-10'),
('Maria', 'Petrova', 'maria@example.com', '+79260000002', '2026-01-11'),
('Alex', 'Sidorov', 'alex@example.com', '+79260000003', '2026-01-12'),
('Elena', 'Smirnova', 'elena@example.com', '+79260000004', '2026-01-13'),
('Dmitry', 'Kuznetsov', 'dmitry@example.com', '+79260000005', '2026-01-14');

-- ------------------------
-- category
-- ------------------------
INSERT INTO category (name, description) VALUES
('Electronics', 'Электроника'),
('Books', 'Книги'),
('Clothing', 'Одежда'),
('Toys', 'Игрушки');

-- ------------------------
-- product
-- ------------------------
INSERT INTO product (name, description, category_id, price) VALUES
('Laptop', 'Ноутбук HP', 1, 75000),
('Smartphone', 'Смартфон Samsung', 1, 45000),
('Headphones', 'Беспроводные наушники', 1, 5000),
('Novel', 'Роман "Война и мир"', 2, 1200),
('Notebook', 'Блокнот А5', 2, 250),
('T-shirt', 'Футболка хлопковая', 3, 800),
('Jeans', 'Джинсы мужские', 3, 2500),
('Doll', 'Кукла Барби', 4, 1500),
('Puzzle', 'Пазл 1000 элементов', 4, 1200);

-- ------------------------
-- orders
-- ------------------------
INSERT INTO orders (customer_id, status_id, order_date, total_amount) VALUES
(1, 1, '2026-02-10 10:00', 80500),
(2, 2, '2026-02-11 12:30', 1450),
(3, 1, '2026-02-12 15:20', 2500),
(4, 3, '2026-02-12 18:00', 5000),
(5, 4, '2026-02-13 09:45', 75000);

-- ------------------------
-- order_item
-- ------------------------
INSERT INTO order_item (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 75000),
(1, 6, 1, 800),
(1, 5, 1, 700), 
(2, 5, 1, 250),
(2, 4, 1, 1200),
(3, 7, 1, 2500),
(4, 3, 1, 5000),
(5, 1, 1, 75000);
