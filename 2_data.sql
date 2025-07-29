Insert into categories(category_name) 
values ('Electronics'), ('books'), ('home & kitchen');
Insert into categories(category_name, parent_category_id)
values ('smartphone', 1),
('laptop',1),
('Fiction',2),
('Non-Fiction',2);
INSERT INTO customers (first_name, last_name, email, registration_date) VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', '2024-11-10 08:30:00'),
('Priya', 'Patel', 'priya.p@example.com', '2025-01-22 14:15:00'),
('Rohan', 'Singh', 'rohan.singh@example.com', '2025-04-05 18:00:00'),
('Sneha', 'Gupta', 'sneha.g@example.com', '2025-06-15 11:45:00'),
('Vikram', 'Kumar', 'vikram.k@example.com', '2025-07-01 09:00:00');
-- Category IDs are assumed: 1-Electronics, 2-Books, 3-Home & Kitchen, 4-Smartphones, 5-Laptops, 6-Fiction, 7-Non-Fiction
INSERT INTO products (product_name, category_id, price, stock_quantity) VALUES
('Galaxy Nova 12', 4, 75000.00, 50),          -- Smartphone
('QuantumBook Pro', 5, 125000.00, 30),         -- Laptop
('The Silent Echo', 6, 850.00, 100),           -- Fiction Book
('Cosmic Origins', 7, 1200.00, 80),          -- Non-Fiction Book
('Smart Coffee Maker', 3, 4500.00, 60),      -- Home & Kitchen
('Air Purifier X', 3, 8000.00, 40),          -- Home & Kitchen
('Shadows of Yesterday', 6, 950.00, 120),    -- Fiction Book
('PixelSnap Camera', 1, 45000.00, 25);         -- Electronics (Main Category)
-- Order 1: Aarav buys a smartphone (May 2025)
INSERT INTO orders (customer_id, order_date, status) VALUES (1, '2025-05-15 10:00:00', 'Completed');
-- The corresponding order_item
INSERT INTO order_items (order_id, product_id, quantity, price_per_item) VALUES (1, 1, 1, 75000.00);

-- Order 2: Priya buys two books (June 2025)
INSERT INTO orders (customer_id, order_date, status) VALUES (2, '2025-06-02 11:30:00', 'Completed');
-- The corresponding order_items
INSERT INTO order_items (order_id, product_id, quantity, price_per_item) VALUES
(2, 3, 1, 850.00),
(2, 4, 1, 1200.00);

-- Order 3: Rohan buys a laptop (June 2025)
INSERT INTO orders (customer_id, order_date, status) VALUES (3, '2025-06-20 15:00:00', 'Shipped');
-- The corresponding order_item
INSERT INTO order_items (order_id, product_id, quantity, price_per_item) VALUES (3, 2, 1, 125000.00);

-- Order 4: Sneha buys home goods (July 2025)
INSERT INTO orders (customer_id, order_date, status) VALUES (4, '2025-07-10 09:45:00', 'Completed');
-- The corresponding order_items
INSERT INTO order_items (order_id, product_id, quantity, price_per_item) VALUES
(4, 5, 1, 4500.00),
(4, 6, 1, 8000.00);

-- Order 5: Aarav's second order, a book (July 2025)
INSERT INTO orders (customer_id, order_date, status) VALUES (1, '2025-07-18 18:20:00', 'Completed');
-- The corresponding order_item
INSERT INTO order_items (order_id, product_id, quantity, price_per_item) VALUES (5, 7, 1, 950.00);

-- Order 6: A cancelled order
INSERT INTO orders (customer_id, order_date, status) VALUES (2, '2025-07-21 12:00:00', 'Cancelled');
-- The corresponding order_item
INSERT INTO order_items (order_id, product_id, quantity, price_per_item) VALUES (6, 8, 1, 45000.00);
