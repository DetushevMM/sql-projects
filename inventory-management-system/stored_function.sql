CREATE OR REPLACE FUNCTION get_product_stock(product_name TEXT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE stock INT;
BEGIN
    SELECT SUM(
        CASE 
            WHEN movement_type = 'IN' THEN quantity
            ELSE -quantity
        END
    )
    INTO stock
    FROM stock_movement sm
    JOIN product p ON sm.product_id = p.id
    WHERE p.name = product_name;

    RETURN stock;
END;
$$;
