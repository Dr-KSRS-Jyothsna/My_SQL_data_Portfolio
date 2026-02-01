/*
===========================================================
File Name   : ecommerce_sales.sql
Author      : Dr. K.S.R.S. Jyothsna
Description : End-to-end SQL case study for analyzing
              e-commerce sales performance.
Database    : MySQL
===========================================================
*/

USE student_db;

---------------------------------------------------
-- Step 1: Create tables
---------------------------------------------------

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

---------------------------------------------------
-- Step 2: Insert sample data
---------------------------------------------------

INSERT INTO customers VALUES
(1, 'Anita', 'Hyderabad'),
(2, 'Ravi', 'Bangalore'),
(3, 'Meena', 'Chennai');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Headphones', 'Accessories', 2000);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10'),
(1002, 2, '2024-01-15'),
(1003, 1, '2024-02-05');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3);

---------------------------------------------------
-- Step 3: Business Analytics Queries
---------------------------------------------------

-- 1. Total revenue
SELECT SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 2. Revenue by category
SELECT p.category, SUM(p.price * oi.quantity) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- 3. Top selling products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 4. Best customer by spending
SELECT c.customer_name, SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- 5. Monthly sales
SELECT MONTH(o.order_date) AS month, 
       SUM(p.price * oi.quantity) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY MONTH(o.order_date);
