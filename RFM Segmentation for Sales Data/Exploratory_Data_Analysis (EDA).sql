-- Use the correct database
USE rfm_sales;

-- 1. View sample records
SELECT * FROM sales_sample_data LIMIT 20;

-- 2. Check structure of the table
DESCRIBE sales_sample_data;

-- 3. Basic summary stats: Total orders, distinct customers, total revenue
SELECT 
    COUNT(DISTINCT ORDERNUMBER) AS TOTAL_ORDERS,
    COUNT(DISTINCT CUSTOMERNAME) AS TOTAL_CUSTOMERS,
    ROUND(SUM(SALES), 2) AS TOTAL_REVENUE
FROM sales_sample_data;

-- 4. Date range (Business start and end)
SELECT 
    MIN(STR_TO_DATE(ORDERDATE, '%d/%m/%y')) AS FIRST_ORDER_DATE,
    MAX(STR_TO_DATE(ORDERDATE, '%d/%m/%y')) AS LAST_ORDER_DATE
FROM sales_sample_data;

-- 5. Top 10 customers by total sales
SELECT 
    CUSTOMERNAME,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES
FROM sales_sample_data
GROUP BY CUSTOMERNAME
ORDER BY TOTAL_SALES DESC
LIMIT 10;

-- 6. Monthly sales trend
SELECT 
    DATE_FORMAT(STR_TO_DATE(ORDERDATE, '%d/%m/%y'), '%Y-%m') AS MONTH,
    ROUND(SUM(SALES), 2) AS MONTHLY_SALES
FROM sales_sample_data
GROUP BY MONTH
ORDER BY MONTH;

-- 7. Top-selling product categories
SELECT 
    PRODUCTLINE,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES
FROM sales_sample_data
GROUP BY PRODUCTLINE
ORDER BY TOTAL_SALES DESC;

-- 8. Quantity ordered distribution
SELECT 
    QUANTITYORDERED,
    COUNT(*) AS FREQUENCY
FROM sales_sample_data
GROUP BY QUANTITYORDERED
ORDER BY FREQUENCY DESC;

-- 9. Average sales by product category
SELECT 
    PRODUCTLINE,
    ROUND(AVG(SALES), 2) AS AVG_SALE_PER_ORDER
FROM sales_sample_data
GROUP BY PRODUCTLINE
ORDER BY AVG_SALE_PER_ORDER DESC;

-- 10. Revenue by country (if column exists)
-- If 'COUNTRY' column is available in your dataset
-- SELECT 
--     COUNTRY,
--     ROUND(SUM(SALES), 2) AS TOTAL_SALES
-- FROM sales_sample_data
-- GROUP BY COUNTRY
-- ORDER BY TOTAL_SALES DESC;

-- 11. Customer order frequency distribution
SELECT 
    CUSTOMERNAME,
    COUNT(DISTINCT ORDERNUMBER) AS TOTAL_ORDERS,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES
FROM sales_sample_data
GROUP BY CUSTOMERNAME
ORDER BY TOTAL_ORDERS DESC;

-- 12. Day of week sales distribution (optional)
SELECT 
    DAYNAME(STR_TO_DATE(ORDERDATE, '%d/%m/%y')) AS DAY_OF_WEEK,
    COUNT(*) AS TOTAL_ORDERS,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES
FROM sales_sample_data
GROUP BY DAY_OF_WEEK
ORDER BY FIELD(DAY_OF_WEEK, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
