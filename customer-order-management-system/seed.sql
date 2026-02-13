-- =====================
-- ORDER STATUSES
-- =====================

INSERT INTO order_status (status_name, description) VALUES
('NEW', 'Order created'),
('PAID', 'Order paid'),
('SHIPPED', 'Order shipped'),
('DELIVERED', 'Order delivered'),
('CANCELLED', 'Order cancelled');



-- =====================
-- CUSTOMERS
-- =====================

INSERT INTO customer (first_name, last_name, email, phone) VALUES
('John', 'Smith', 'john.smith@email.com', '+12025550101'),
('Anna', 'Johnson', 'anna.j@email.com', '+12025550102'),
('Michael', 'Brown', 'm.brown@email.com', '+12025550103'),
('Emily', 'Davis', 'emily.d@email.com', '+12025550104'),
('Daniel', 'Wilson', 'daniel.w@email.com', '+12025550105'),
('Olivia', 'Taylor', 'olivia.t@email.com', '+12025550106'),
('James', 'Anderson', 'j.anderson@email.com', '+12025550107'),
('Sophia', 'Thomas', 'sophia.t@email.com', '+12025550108'),
('William', 'Moore', 'william.m@email.com', '+12025550109'),
('Isabella', 'Martin', 'isabella.m@email.com', '+12025550110');



-- =====================
-- CATEGORIES
-- =====================

INSERT INTO category (name, description) VALUES
('Electronics', 'Electronic devices'),
('Accessories', 'Computer accessories'),
('Office Equipment', 'Office devices'),
('Storage', 'Storage devices');



-- =====================
-- PRODUCTS
-- =====================

INSERT INTO product (name, description, category_id, unit_price) VALUES
('Laptop', '15 inch business laptop', 1, 950.00),
('Tablet', '10 inch tablet device', 1, 450.00),
('Wireless Mouse', 'Bluetooth mouse', 2, 30.00),
('Mechanical Keyboard', 'RGB keyboard', 2, 90.00),
('Monitor 24"', 'Full HD monitor', 1, 210.00),
('Office Printer', 'Laser printer', 3, 300.00),
('USB Flash 64GB', 'USB storage device', 4, 18.00),
('External SSD 1TB', 'Portable SSD', 4, 140.00),
('Webcam HD', 'Video conferencing webcam', 2, 65.00),
('Desk Lamp', 'LED desk lamp', 3, 40.00);



-- =====================
-- ORDERS
-- =====================

INSERT INTO orders (customer_id, status_id, order_date, total_amount) VALUES
(1, 4, NOW() - INTERVAL '30 days', 1040.00),
(2, 4, NOW() - INTERVAL '28 days', 480.00),
(3, 3, NOW() - INTERVAL '25 days', 210.00),
(4, 4, NOW() - INTERVAL '20 days', 980.00),
(5, 2, NOW() - INTERVAL '18 days', 300.00),
(6, 4, NOW() - INTERVAL '15 days', 160.00),
(7, 3, NOW() - INTERVAL '12 days', 450.00),
(8, 4, NOW() - INTERVAL '10 days', 600.00),
(9, 1, NOW() - INTERVAL '7 days', 90.00),
(10, 5, NOW() - INTERVAL '5 days', 65.00),
(2, 4, NOW() - INTERVAL '3 days', 1200.00),
(4, 2, NOW() - INTERVAL '2 days', 240.00),
(6, 3, NOW() - INTERVAL '1 day', 320.00),
(1, 1, NOW(), 450.00);



-- =====================
-- ORDER ITEMS
-- =====================

INSERT INTO order_item (order_id, product_id, quantity, price) VALUES

-- Order 1
(1, 1, 1, 950.00),
(1, 3, 3, 30.00),

-- Order 2
(2, 2, 1, 450.00),
(2, 7, 2, 18.00),

-- Order 3
(3, 5, 1, 210.00),

-- Order 4
(4, 1, 1, 950.00),
(4, 9, 1, 65.00),

-- Order 5
(5, 6, 1, 300.00),

-- Order 6
(6, 8, 1, 140.00),
(6, 7, 1, 18.00),

-- Order 7
(7, 2, 1, 450.00),

-- Order 8
(8, 5, 2, 210.00),
(8, 3, 2, 30.00),

-- Order 9
(9, 4, 1, 90.00),

-- Order 10
(10, 9, 1, 65.00),

-- Order 11
(11, 1, 1, 950.00),
(11, 4, 2, 90.00),
(11, 7, 2, 18.00),

-- Order 12
(12, 5, 1, 210.00),
(12, 10, 1, 40.00),

-- Order 13
(13, 6, 1, 300.00),
(13, 3, 1, 30.00),

-- Order 14
(14, 2, 1, 450.00);
