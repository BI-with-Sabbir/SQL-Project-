-- Customer Lifetime Value (CLV) Analysis
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
        MIN(Formatted_Date) OVER (PARTITION BY CustomerID) AS First_Transaction_Date,
        Sale_Value
    FROM CTE1
),
CTE3 AS (
    SELECT 
        CustomerID,
        First_Transaction_Date,
        Purchase_Date,
        Sale_Value,
        CONCAT('Month_', ROUND(DATEDIFF('day', First_Transaction_Date, Purchase_Date)/30, 0)) AS Cohort_Month,
        TO_CHAR(Purchase_Date, 'YYYY-MM') AS Purchase_Month,
        TO_CHAR(First_Transaction_Date, 'YYYY-MM') AS First_Transaction_Month
    FROM CTE2
)
SELECT
    First_Transaction_Month AS Cohort,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_0' THEN Sale_Value END), 0) AS Month_0,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_1' THEN Sale_Value END), 0) AS Month_1,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_2' THEN Sale_Value END), 0) AS Month_2,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_3' THEN Sale_Value END), 0) AS Month_3,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_4' THEN Sale_Value END), 0) AS Month_4,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_5' THEN Sale_Value END), 0) AS Month_5,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_6' THEN Sale_Value END), 0) AS Month_6,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_7' THEN Sale_Value END), 0) AS Month_7,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_8' THEN Sale_Value END), 0) AS Month_8,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_9' THEN Sale_Value END), 0) AS Month_9,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_10' THEN Sale_Value END), 0) AS Month_10,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_11' THEN Sale_Value END), 0) AS Month_11,
    ROUND(SUM(CASE WHEN Cohort_Month = 'Month_12' THEN Sale_Value END), 0) AS Month_12
FROM CTE3
GROUP BY First_Transaction_Month
ORDER BY First_Transaction_Month;
