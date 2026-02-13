-- 1. Общая выручка по всем заказам
---------------------------------------------------------

SELECT 
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status_id IN (
    SELECT id FROM order_status 
    WHERE status_name IN ('PAID', 'SHIPPED', 'DELIVERED')
);

---------------------------------------------------------
-- 2. Выручка по клиентам
---------------------------------------------------------

SELECT 
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customer c ON o.customer_id = c.id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name IN ('PAID', 'SHIPPED', 'DELIVERED')
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

---------------------------------------------------------
-- 3. Топ продаваемых товаров
---------------------------------------------------------

SELECT 
    p.name,
    SUM(oi.quantity) AS total_sold
FROM order_item oi
JOIN product p ON oi.product_id = p.id
JOIN orders o ON oi.order_id = o.id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY p.name
ORDER BY total_sold DESC;

---------------------------------------------------------
-- 4. Выручка по категориям товаров
---------------------------------------------------------

SELECT 
    c.name AS category,
    SUM(oi.quantity * oi.price) AS category_revenue
FROM order_item oi
JOIN product p ON oi.product_id = p.id
JOIN category c ON p.category_id = c.id
JOIN orders o ON oi.order_id = o.id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY c.name
ORDER BY category_revenue DESC;

---------------------------------------------------------
-- 5. Продажи по месяцам
---------------------------------------------------------

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS revenue
FROM orders o
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY month
ORDER BY month;

---------------------------------------------------------
-- 6. Средний чек заказа
---------------------------------------------------------
SELECT 
    AVG(total_amount) AS average_order_value
FROM orders o
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED';

---------------------------------------------------------
-- 7. Количество заказов по статусам
---------------------------------------------------------

SELECT 
    s.status_name,
    COUNT(o.id) AS orders_count
FROM orders o
JOIN order_status s ON o.status_id = s.id
GROUP BY s.status_name
ORDER BY orders_count DESC;

---------------------------------------------------------
-- 8. Топ клиентов по количеству заказов
---------------------------------------------------------

SELECT 
    c.first_name,
    c.last_name,
    COUNT(o.id) AS total_orders
FROM orders o
JOIN customer c ON o.customer_id = c.id
GROUP BY c.first_name, c.last_name
ORDER BY total_orders DESC;

---------------------------------------------------------
-- 9. Самые прибыльные товары
---------------------------------------------------------

SELECT 
    p.name,
    SUM(oi.quantity * oi.price) AS revenue
FROM order_item oi
JOIN product p ON oi.product_id = p.id
JOIN orders o ON oi.order_id = o.id
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY p.name
ORDER BY revenue DESC;

---------------------------------------------------------
-- 10. Динамика продаж по дням
---------------------------------------------------------

SELECT 
    DATE(order_date) AS day,
    SUM(total_amount) AS daily_revenue
FROM orders o
JOIN order_status s ON o.status_id = s.id
WHERE s.status_name <> 'CANCELLED'
GROUP BY day
ORDER BY day;

---------------------------------------------------------
-- Sales Revenue View (Общая аналитика заказов)
---------------------------------------------------------

SELECT * FROM sales_orders_view;

---------------------------------------------------------
-- KPI 1. Общая выручка за период
---------------------------------------------------------

SELECT get_revenue_between_dates('2025-01-01', '2025-12-31');

---------------------------------------------------------
-- KPI 2. Средний чек клиента
---------------------------------------------------------

SELECT get_average_order_value();

---------------------------------------------------------
-- KPI 3. Топ клиент по сумме покупок 
---------------------------------------------------------

SELECT * FROM get_top_customer();




