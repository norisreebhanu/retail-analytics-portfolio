
-- Retail Sales KPIs
-- Metrics: Revenue, Profit, Orders, Quantity
-- Dataset: Sample Superstore

-- Row count
SELECT COUNT(*) AS total_rows
FROM sample_superstore;

-- Core Retail KPIs
SELECT
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_units_sold,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM sample_superstore;


-- Revenue and Profit by Year
SELECT
    EXTRACT(YEAR FROM Order_Date) AS order_year,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit
FROM sample_superstore
GROUP BY order_year
ORDER BY order_year;

-- Top 10 Products (SKUs) by Revenue
SELECT
    Product_Name,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit
FROM sample_superstore
GROUP BY Product_Name
ORDER BY revenue DESC
LIMIT 10;


-- Bottom 10 Products by Profit
SELECT
    Product_Name,
    ROUND(SUM(Profit), 2) AS profit
FROM sample_superstore
GROUP BY Product_Name
ORDER BY profit ASC
LIMIT 10;


-- Category Performance
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit
FROM sample_superstore
GROUP BY Category
ORDER BY revenue DESC;


