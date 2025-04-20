
-- Create Database and Schema
CREATE DATABASE IF NOT EXISTS Sales;
USE DATABASE Sales;

CREATE SCHEMA IF NOT EXISTS cohort_analysis;
USE SCHEMA cohort_analysis;

-- Create Retail Table
CREATE OR REPLACE TABLE RETAIL (
    InvoiceNo VARCHAR(10),
    StockCode VARCHAR(20),
    Description VARCHAR(100),
    Quantity NUMBER(8,2),
    InvoiceDate VARCHAR(25),
    UnitPrice NUMBER(8,2),
    CustomerID NUMBER(10),
    Country VARCHAR(25)
);

-- Sample Query to View Timestamp Conversion
SELECT
    InvoiceDate,
    TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI') AS Parsed_DateTime,
    TO_DATE(TO_TIMESTAMP(InvoiceDate, 'MM/DD/YYYY HH24:MI')) AS Parsed_Date
FROM cohort_analysis.RETAIL
LIMIT 10;
