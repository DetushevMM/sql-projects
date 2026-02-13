-- 1. Текущие остатки товаров на складе
----------------------------------------------------------------

SELECT 
    p.id,
    p.name,
    SUM(
        CASE 
            WHEN sm.movement_type = 'IN' THEN sm.quantity
            WHEN sm.movement_type = 'OUT' THEN -sm.quantity
        END
    ) AS current_stock
FROM product p
LEFT JOIN stock_movement sm 
    ON p.id = sm.product_id
GROUP BY p.id, p.name
ORDER BY p.name;

----------------------------------------------------------------
-- 2. Общий остаток + стоимость товаров на складе
----------------------------------------------------------------

SELECT 
    p.name,
    p.unit_price,
    SUM(
        CASE 
            WHEN sm.movement_type = 'IN' THEN sm.quantity
            ELSE -sm.quantity
        END
    ) AS stock_quantity,
    SUM(
        CASE 
            WHEN sm.movement_type = 'IN' THEN sm.quantity
            ELSE -sm.quantity
        END
    ) * p.unit_price AS stock_value
FROM product p
JOIN stock_movement sm ON p.id = sm.product_id
GROUP BY p.name, p.unit_price
ORDER BY stock_value DESC;

----------------------------------------------------------------
-- 3. Самые продаваемые товары
----------------------------------------------------------------

SELECT 
    p.name,
    SUM(sm.quantity) AS total_sold
FROM stock_movement sm
JOIN product p ON sm.product_id = p.id
WHERE sm.movement_type = 'OUT'
GROUP BY p.name
ORDER BY total_sold DESC;

----------------------------------------------------------------
-- 4. Отчёт по поставщикам (поставлено товаров)
----------------------------------------------------------------

SELECT 
    s.name AS supplier,
    SUM(sm.quantity) AS total_supplied
FROM stock_movement sm
JOIN supplier s ON sm.supplier_id = s.id
WHERE sm.movement_type = 'IN'
GROUP BY s.name
ORDER BY total_supplied DESC;

----------------------------------------------------------------
-- 5. Движение товаров по датам
---------------------------------------------------------------- 

SELECT 
    DATE(sm.movement_date) AS movement_day,
    sm.movement_type,
    SUM(sm.quantity) AS total_quantity
FROM stock_movement sm
GROUP BY movement_day, sm.movement_type
ORDER BY movement_day;


----------------------------------------------------------------
-- 6. Товары с низким остатком (менее 20 шт.)
----------------------------------------------------------------

SELECT *
FROM (
    SELECT 
        p.name,
        SUM(
            CASE 
                WHEN sm.movement_type = 'IN' THEN sm.quantity
                ELSE -sm.quantity
            END
        ) AS stock_quantity
    FROM product p
    JOIN stock_movement sm ON p.id = sm.product_id
    GROUP BY p.name
) AS stock_data
WHERE stock_quantity < 20
ORDER BY stock_quantity;


----------------------------------------------------------------
-- 7. История движения конкретного товара
----------------------------------------------------------------

SELECT 
    p.name,
    s.name AS supplier,
    sm.movement_type,
    sm.quantity,
    sm.movement_date
FROM stock_movement sm
JOIN product p ON sm.product_id = p.id
JOIN supplier s ON sm.supplier_id = s.id
WHERE p.name = 'Wireless Mouse'
ORDER BY sm.movement_date;

----------------------------------------------------------------
-- 8. Остатки товаров по категориям
----------------------------------------------------------------

SELECT 
    c.name AS category,
    SUM(
        CASE 
            WHEN sm.movement_type = 'IN' THEN sm.quantity
            ELSE -sm.quantity
        END
    ) AS total_stock
FROM product p
JOIN category c ON p.category_id = c.id
JOIN stock_movement sm ON p.id = sm.product_id
GROUP BY c.name
ORDER BY total_stock DESC;

----------------------------------------------------------------
-- SQL VIEW:
----------------------------------------------------------------

SELECT * FROM current_stock_view;


----------------------------------------------------------------
-- Stored Functions
----------------------------------------------------------------

SELECT get_product_stock('Wireless Mouse');

----------------------------------------------------------------
-- Stored Procedures
----------------------------------------------------------------

CALL add_stock(1, 2, 50);
