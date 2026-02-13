-- 1. Sales Revenue View (Общая аналитика заказов)
-- Показывает все заказы вместе с клиентами и статусами.
---------------------------------------------------------

CREATE OR REPLACE VIEW sales_orders_view AS
SELECT
    o.id AS order_id,
    c.first_name,
    c.last_name,
    s.status_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customer c ON o.customer_id = c.id
JOIN order_status s ON o.status_id = s.id;

---------------------------------------------------------
-- 2. Product Sales Summary View
-- Продажи товаров.
---------------------------------------------------------

CREATE OR REPLACE VIEW product_sales_view AS
SELECT
    p.id,
    p.name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_item oi
JOIN product p ON oi.product_id = p.id
JOIN orders o ON oi.order_id = o.id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY p.id, p.name;

---------------------------------------------------------
-- 3. Category Revenue View
-- Выручка по категориям.
---------------------------------------------------------

CREATE OR REPLACE VIEW category_revenue_view AS
SELECT
    c.name AS category_name,
    SUM(oi.quantity * oi.price) AS revenue
FROM order_item oi
JOIN product p ON oi.product_id = p.id
JOIN category c ON p.category_id = c.id
JOIN orders o ON oi.order_id = o.id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY c.name;

---------------------------------------------------------
-- 4. Customer Lifetime Value View
-- Показывает сколько каждый клиент потратил.
---------------------------------------------------------

CREATE OR REPLACE VIEW customer_ltv_view AS
SELECT
    c.id,
    c.first_name,
    c.last_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amount) AS lifetime_value
FROM customer c
JOIN orders o ON c.id = o.customer_id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY c.id, c.first_name, c.last_name;

---------------------------------------------------------
-- 5. Monthly Revenue View
-- Аналитика продаж по месяцам.
---------------------------------------------------------

CREATE OR REPLACE VIEW monthly_revenue_view AS
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(o.total_amount) AS revenue,
    COUNT(o.id) AS orders_count
FROM orders o
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY month
ORDER BY month;