-- =====================
-- SUPPLIERS
-- =====================

INSERT INTO supplier (name, email, phone) VALUES
('Tech Supplies Ltd', 'contact@techsupplies.com', '+441234567890'),
('Global Electronics', 'sales@globalelectronics.com', '+491112223344'),
('Office Trade Group', 'info@officetrade.com', '+33199887766'),
('Warehouse Import', 'support@warehouseimport.com', '+39022334455'),
('Smart Components', 'orders@smartcomponents.com', '+42055667788');



-- =====================
-- CATEGORIES
-- =====================

INSERT INTO category (name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Office Equipment', 'Office devices and workplace tools'),
('Computer Hardware', 'Internal and external computer components'),
('Networking', 'Networking equipment and accessories'),
('Storage Devices', 'Data storage devices');



-- =====================
-- PRODUCTS
-- =====================

INSERT INTO product (name, description, category_id, unit_price) VALUES
('Wireless Mouse', 'Ergonomic wireless mouse', 1, 25.99),
('Mechanical Keyboard', 'RGB mechanical keyboard', 1, 79.50),
('Laser Printer', 'High-speed office printer', 2, 220.00),
('Office Chair', 'Adjustable ergonomic chair', 2, 180.00),
('SSD 1TB', 'Solid state drive 1TB', 5, 110.00),
('External HDD 2TB', 'Portable external hard drive', 5, 95.00),
('Router AC1200', 'Dual band Wi-Fi router', 4, 65.00),
('Network Switch 8 Port', 'Gigabit Ethernet switch', 4, 55.00),
('RAM 16GB DDR4', 'High performance memory module', 3, 70.00),
('Graphics Card RTX 3060', 'Gaming graphics card', 3, 420.00);



-- =====================
-- STOCK MOVEMENTS (INCOMING GOODS)
-- =====================

INSERT INTO stock_movement 
(product_id, supplier_id, movement_type, quantity, movement_date) VALUES
(1, 1, 'IN', 150, NOW() - INTERVAL '20 days'),
(2, 1, 'IN', 100, NOW() - INTERVAL '18 days'),
(3, 3, 'IN', 50, NOW() - INTERVAL '15 days'),
(4, 3, 'IN', 40, NOW() - INTERVAL '14 days'),
(5, 2, 'IN', 120, NOW() - INTERVAL '12 days'),
(6, 2, 'IN', 90, NOW() - INTERVAL '10 days'),
(7, 4, 'IN', 70, NOW() - INTERVAL '8 days'),
(8, 4, 'IN', 80, NOW() - INTERVAL '7 days'),
(9, 5, 'IN', 110, NOW() - INTERVAL '6 days'),
(10, 5, 'IN', 60, NOW() - INTERVAL '5 days');



-- =====================
-- STOCK MOVEMENTS (OUTGOING GOODS / SALES)
-- =====================

INSERT INTO stock_movement 
(product_id, supplier_id, movement_type, quantity, movement_date) VALUES
(1, 1, 'OUT', 30, NOW() - INTERVAL '4 days'),
(2, 1, 'OUT', 20, NOW() - INTERVAL '3 days'),
(3, 3, 'OUT', 10, NOW() - INTERVAL '3 days'),
(5, 2, 'OUT', 25, NOW() - INTERVAL '2 days'),
(6, 2, 'OUT', 15, NOW() - INTERVAL '2 days'),
(7, 4, 'OUT', 12, NOW() - INTERVAL '2 days'),
(8, 4, 'OUT', 18, NOW() - INTERVAL '1 day'),
(9, 5, 'OUT', 40, NOW() - INTERVAL '1 day'),
(10, 5, 'OUT', 8, NOW() - INTERVAL '1 day');



-- =====================
-- EXTRA RANDOM MOVEMENTS
-- =====================

INSERT INTO stock_movement 
(product_id, supplier_id, movement_type, quantity, movement_date) VALUES
(1, 1, 'IN', 50, NOW() - INTERVAL '1 day'),
(5, 2, 'IN', 60, NOW() - INTERVAL '12 hours'),
(9, 5, 'OUT', 15, NOW() - INTERVAL '6 hours'),
(7, 4, 'OUT', 5, NOW() - INTERVAL '3 hours');
