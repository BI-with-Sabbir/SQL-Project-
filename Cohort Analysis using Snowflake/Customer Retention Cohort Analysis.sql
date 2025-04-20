-- Customer Retention Cohort Analysis
WITH CTE1 AS (
    SELECT
        CustomerID,
        TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI') AS Formatted_Date,
        ROUND(Quantity * UnitPrice, 2) AS Sale_Value
    FROM cohort_analysis.RETAIL
    WHERE 
        CustomerID IS NOT NULL
        AND TRIM(CustomerID) != ''
        AND InvoiceNo NOT LIKE 'C%'
        AND Quantity > 0
        AND UnitPrice > 0
),
CTE2 AS (
    SELECT
        CustomerID,
        Formatted_Date AS Purchase_Date,
        MIN(Formatted_Date) OVER (PARTITION BY CustomerID) AS First_Transaction_Date
    FROM CTE1
),
CTE3 AS (
    SELECT 
        CustomerID,
        First_Transaction_Date,
        Purchase_Date,
        CONCAT('Month_', ROUND(DATEDIFF('day', First_Transaction_Date, Purchase_Date)/30, 0)) AS Cohort_Month,
        TO_CHAR(Purchase_Date, 'YYYY-MM') AS Purchase_Month,
        TO_CHAR(First_Transaction_Date, 'YYYY-MM') AS First_Transaction_Month
    FROM CTE2
)
SELECT
    First_Transaction_Month AS Cohort,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_0' THEN CustomerID END) AS Month_0,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_1' THEN CustomerID END) AS Month_1,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_2' THEN CustomerID END) AS Month_2,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_3' THEN CustomerID END) AS Month_3,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_4' THEN CustomerID END) AS Month_4,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_5' THEN CustomerID END) AS Month_5,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_6' THEN CustomerID END) AS Month_6,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_7' THEN CustomerID END) AS Month_7,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_8' THEN CustomerID END) AS Month_8,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_9' THEN CustomerID END) AS Month_9,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_10' THEN CustomerID END) AS Month_10,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_11' THEN CustomerID END) AS Month_11,
    COUNT(DISTINCT CASE WHEN Cohort_Month = 'Month_12' THEN CustomerID END) AS Month_12
FROM CTE3
GROUP BY First_Transaction_Month
ORDER BY First_Transaction_Month;
