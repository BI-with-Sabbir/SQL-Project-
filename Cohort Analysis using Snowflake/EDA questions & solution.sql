-- EDA Questions and Queries
-- --------------------------

-- 1. How many total records are in the dataset?
SELECT COUNT(*) AS Total_Records FROM cohort_analysis.RETAIL;

-- 2. How many unique customers are there?
SELECT COUNT(DISTINCT CustomerID) AS Unique_Customers FROM cohort_analysis.RETAIL WHERE CustomerID IS NOT NULL;

-- 3. How many distinct countries are in the data?
SELECT DISTINCT Country FROM cohort_analysis.RETAIL;

-- 4. What is the range of dates in the data?
SELECT 
    MIN(TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI')) AS Start_Date,
    MAX(TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI')) AS End_Date
FROM cohort_analysis.RETAIL;

-- 5. Are there any negative or zero quantity values?
SELECT COUNT(*) AS Suspicious_Quantity FROM cohort_analysis.RETAIL WHERE Quantity <= 0;

-- 6. Are there any negative or zero unit prices?
SELECT COUNT(*) AS Suspicious_UnitPrice FROM cohort_analysis.RETAIL WHERE UnitPrice <= 0;

-- 7. How many canceled invoices (start with 'C')?
SELECT COUNT(*) AS Canceled_Orders FROM cohort_analysis.RETAIL WHERE InvoiceNo LIKE 'C%';

-- 8. How many missing or empty Customer IDs?
SELECT COUNT(*) AS Empty_CustomerID FROM cohort_analysis.RETAIL WHERE TRIM(CAST(CustomerID AS STRING)) = '' OR CustomerID IS NULL;

-- 9. What are the top-selling products?
SELECT Description, SUM(Quantity) AS Total_Quantity
FROM cohort_analysis.RETAIL
WHERE Quantity > 0
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 10. Which countries generate the most revenue?
SELECT Country, ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue
FROM cohort_analysis.RETAIL
GROUP BY Country
ORDER BY Revenue DESC;

-- 11. Revenue trend over time
SELECT 
    TO_DATE(TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI')) AS Sale_Date,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Daily_Revenue
FROM cohort_analysis.RETAIL
GROUP BY Sale_Date
ORDER BY Sale_Date;

-- 12. Average basket size per order
SELECT 
    InvoiceNo,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Order_Value,
    COUNT(DISTINCT StockCode) AS Product_Count
FROM cohort_analysis.RETAIL
GROUP BY InvoiceNo;
