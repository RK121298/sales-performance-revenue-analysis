
-- =========================================================
-- Sales Performance & Revenue Optimization Analysis
-- Target: MySQL Workbench
-- =========================================================

CREATE DATABASE IF NOT EXISTS sales_analysis;
USE sales_analysis;

-- ================================
-- 1. Staging Table 
-- ================================

DROP TABLE IF EXISTS sales_raw;

CREATE TABLE sales_raw (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(50),
    ship_date VARCHAR(50),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,2)
);

-- ================================
-- 2. Analytical Table
-- ================================

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    order_id        VARCHAR(50),
    order_date      VARCHAR(50),
    ship_date       VARCHAR(50),
    customer_name   VARCHAR(100),
    segment         VARCHAR(50),
    region          VARCHAR(50),
    product_name    VARCHAR(150),
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    quantity        INT,
    revenue         DECIMAL(12,2),
    discount        DECIMAL(5,2),
    profit          DECIMAL(12,2)
);

-- ================================
-- 3. Transform & Load (ETL Step)
-- ================================

TRUNCATE TABLE sales;

INSERT INTO sales (
    order_id,
    order_date,
    ship_date,
    customer_name,
    segment,
    region,
    product_name,
    category,
    sub_category,
    quantity,
    revenue,
    discount,
    profit
)
SELECT
    order_id,
    order_date,
    ship_date,
    customer_name,
    segment,
    region,
    product_name,
    category,
    sub_category,
    quantity,
    sales,
    discount,
    profit
FROM sales_raw;

-- ================================
-- 4. Core KPIs
-- ================================

SELECT 
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM sales;

-- ================================
-- 5. Monthly Revenue Trend
-- ================================

SELECT 
    LEFT(order_date, 7) AS year_month,
    SUM(revenue) AS monthly_revenue
FROM sales
GROUP BY LEFT(order_date, 7)
ORDER BY LEFT(order_date, 7);

-- ================================
-- 6. Product Performance
-- ================================

SELECT 
    product_name,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- ================================
-- 7. Regional Performance
-- ================================

SELECT 
    region,
    SUM(revenue) AS total_revenue,
    SUM(profit)  AS total_profit
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- ================================
-- 8. Segment Performance
-- ================================

SELECT 
    segment,
    SUM(revenue) AS total_revenue,
    SUM(profit)  AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY segment
ORDER BY total_revenue DESC;

-- ================================
-- 9. Discount Impact
-- ================================

SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.10 THEN 'Low Discount'
        WHEN discount > 0.10 AND discount <= 0.30 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_bucket,
    COUNT(*) AS orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM sales
GROUP BY discount_bucket
ORDER BY discount_bucket;

-- ================================
-- 10. Revenue Concentration
-- ================================

SELECT 
    customer_name,
    SUM(revenue) AS total_revenue
FROM sales
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

WITH top_customers AS (
    SELECT 
        customer_name,
        SUM(revenue) AS total_revenue
    FROM sales
    GROUP BY customer_name
    ORDER BY total_revenue DESC
    LIMIT 10
)
SELECT 
    ROUND(SUM(total_revenue) / (SELECT SUM(revenue) FROM sales) * 100, 2) 
        AS top10_revenue_share_pct
FROM top_customers;

-- =========================================================
-- End of Script
-- =========================================================
