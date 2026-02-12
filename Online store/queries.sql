-- 1. Список всех заказов с клиентами и статусом
------------------------------------------------
-- Что показывает:
-- * Полное имя клиента
-- * Статус заказа
-- * Дату и сумму
-- * Использует JOIN 3 таблиц
-----------------------------------------------

SELECT
    o.id AS order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    os.status_name AS order_status,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customer c ON o.customer_id = c.id
JOIN order_status os ON o.status_id = os.id
ORDER BY o.order_date;

------------------------------------------------
-- 2. Подробности заказов с товарами
------------------------------------------------
-- Что показывает:
-- * Каждую позицию заказа
-- * Количество и цену
-- * Суммарную стоимость по позиции
-- * JOIN 4 таблиц, практическая аналитика
------------------------------------------------

SELECT
    o.id AS order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    p.name AS product_name,
    oi.quantity,
    oi.price,
    (oi.quantity * oi.price) AS total_item_price
FROM order_item oi
JOIN orders o ON oi.order_id = o.id
JOIN customer c ON o.customer_id = c.id
JOIN product p ON oi.product_id = p.id
ORDER BY o.id, oi.id;

-------------------------------------------------
-- 3. Суммарные продажи по каждому клиенту
-------------------------------------------------
-- Что показывает:
-- * Количество заказов клиента
-- * Общую потраченную сумму
-- * Использует GROUP BY и агрегаты
------------------------------------------------

SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customer c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY total_spent DESC;

-------------------------------------------------
-- 4. Суммарные продажи по категориям товаров
-------------------------------------------------
-- Что показывает:
-- * Какие категории приносят больше всего дохода
-- * Использует JOIN, GROUP BY и SUM
-------------------------------------------------

SELECT
    cat.name AS category_name,
    COUNT(oi.id) AS total_items_sold,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM category cat
JOIN product p ON cat.id = p.category_id
JOIN order_item oi ON p.id = oi.product_id
GROUP BY cat.id
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 5. Топ 3 самых дорогих товаров в заказах
--------------------------------------------------
-- Что показывает:
-- * Топ-продукты по доходу
-- * Использует агрегаты и сортировку с LIMIT
--------------------------------------------------

SELECT
    p.name AS product_name,
    SUM(oi.quantity * oi.price) AS revenue
FROM product p
JOIN order_item oi ON p.id = oi.product_id
GROUP BY p.id
ORDER BY revenue DESC
LIMIT 3;

-------------------------------------------------
-- 6. Заказы, которые ещё не доставлены
-------------------------------------------------
-- Что показывает:
-- * Фильтрация по статусу
-- * Практика WHERE и JOIN
-------------------------------------------------

SELECT
    o.id AS order_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    os.status_name AS order_status,
    o.total_amount
FROM orders o
JOIN customer c ON o.customer_id = c.id
JOIN order_status os ON o.status_id = os.id
WHERE os.status_name <> 'DELIVERED'
ORDER BY o.order_date;
