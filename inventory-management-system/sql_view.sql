CREATE VIEW current_stock_view AS
SELECT 
    p.id,
    p.name,
    SUM(
        CASE 
            WHEN sm.movement_type = 'IN' THEN sm.quantity
            ELSE -sm.quantity
        END
    ) AS stock_quantity
FROM product p
JOIN stock_movement sm ON p.id = sm.product_id
GROUP BY p.id, p.name;
