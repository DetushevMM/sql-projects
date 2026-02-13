-- KPI 1. Общая выручка за период
-------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_revenue_between_dates(
    start_date DATE,
    end_date DATE
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE total NUMERIC;
BEGIN
    SELECT SUM(total_amount)
    INTO total
    FROM orders o
    JOIN order_status s ON o.status_id = s.id
    WHERE s.status_name <> 'CANCELLED'
      AND o.order_date BETWEEN start_date AND end_date;

    RETURN COALESCE(total, 0);
END;
$$;


-------------------------------------------------------------
-- KPI 2. Средний чек клиента
-------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_average_order_value()
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE avg_value NUMERIC;
BEGIN
    SELECT AVG(total_amount)
    INTO avg_value
    FROM orders o
    JOIN order_status s ON o.status_id = s.id
    WHERE s.status_name <> 'CANCELLED';

    RETURN COALESCE(avg_value, 0);
END;
$$;


-------------------------------------------------------------
-- KPI 3. Топ клиент по сумме покупок
-------------------------------------------------------------

CREATE OR REPLACE FUNCTION get_top_customer()
RETURNS TABLE (
    customer_name TEXT,
    total_spent NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        CONCAT(c.first_name, ' ', c.last_name),
        SUM(o.total_amount)
    FROM customer c
    JOIN orders o ON c.id = o.customer_id
    JOIN order_status s ON o.status_id = s.id
    WHERE s.status_name <> 'CANCELLED'
    GROUP BY c.first_name, c.last_name
    ORDER BY total_spent DESC
    LIMIT 1;
END;
$$;