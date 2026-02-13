CREATE OR REPLACE PROCEDURE add_stock(
    p_product_id INT,
    p_supplier_id INT,
    p_quantity INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO stock_movement
    (product_id, supplier_id, movement_type, quantity)
    VALUES
    (p_product_id, p_supplier_id, 'IN', p_quantity);
END;
$$;
