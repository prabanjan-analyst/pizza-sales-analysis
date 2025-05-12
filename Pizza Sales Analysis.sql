SELECT * FROM pizza_sales;

-- KPI's 
-- 1. Total Revenue
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

-- 2. Average Order value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS avg_order_value FROM pizza_sales;

-- 3. Total Pizza Sold
SELECT SUM(quantity) AS total_pizza_sold FROM pizza_sales;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales;

-- 5. Average Pizza per Order
-- It returns a round number
SELECT SUM(quantity) / COUNT(DISTINCT order_id) FROM pizza_sales;

-- We need the exact value to change the datatype
SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS avg_pizza_per_order
FROM pizza_sales;


-- Problem Statement
-- 1. Daily Order count
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales GROUP BY DATENAME(DW, order_date);

-- 2. Monthly order count
SELECT DATENAME(MONTH, order_date) AS order_month, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales GROUP BY DATENAME(MONTH, order_date) ORDER BY total_orders DESC;

-- 3. Percentage of sales by Category
SELECT pizza_category, SUM(total_price) *100 / (SELECT SUM(total_price) FROM pizza_sales) AS percent_of_total_sales
FROM pizza_sales GROUP BY pizza_category ORDER BY percent_of_total_sales DESC;

-- 4. Percentage of sales by Size
SELECT pizza_size, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS percent_of_total_sales
FROM pizza_sales GROUP BY pizza_size ORDER BY percent_of_total_sales DESC;

-- 5. Top & Worst 5 Best selling Pizza
-- Top 5
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales
GROUP BY pizza_name ORDER BY total_revenue DESC;

-- Worst 5
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue FROM pizza_sales
GROUP BY pizza_name ORDER BY total_revenue;

-- 6. Top & Worst 5 Best selling Pizza by Quantity
-- Top 5
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_quantity FROM pizza_sales
GROUP BY pizza_name ORDER BY total_quantity DESC;

-- Worst 5
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS total_quantity FROM pizza_sales
GROUP BY pizza_name ORDER BY total_quantity;