# 📊 Customer RFM Segmentation Portfolio Project

This project focuses on segmenting customers using **RFM (Recency, Frequency, Monetary)** analysis to better understand purchasing behavior and support data-driven marketing strategies. It uses SQL for data processing and Power BI for visualization, based on the `SAMPLE_SALES_DATA.csv` dataset.

---

## 📁 Project Overview

The goal of this project is to:
- Perform **Exploratory Data Analysis (EDA)** to understand customer behavior
- Implement **RFM segmentation** using SQL
- Generate meaningful **customer segments** to support business decision-making
- Visualize insights through Power BI

The dataset consists of **2,824 records**, analyzed using **MySQL Workbench**.

---

## 🧰 Tools & Technologies

- **MySQL Workbench** – For SQL-based data processing and analysis
- **Excel to DB Import Tool** – To load CSV data into the MySQL database
- **SQL** – For data cleaning, EDA, and segmentation
- **Power BI** – For visualizations and dashboards

---

## 🗃️ Database Details

- **Database Name:** `rfm_sales`
- **Table Name:** `sales_sample_data`
- **Dataset File:** `SAMPLE_SALES_DATA.csv`

---

## 📂 File Structure

```
📁 Customer-RFM-Segmentation-Project
├── 📊 Dataset/
│   └── SAMPLE_SALES_DATA.csv
├── 🧼 Data Cleaning.sql
├── 📊 Exploratory Data Analysis (EDA). sql
├── 📈 RFM Segmentation.sql
├── 📄 README.md
├── 📁 Results & Findings/
│   ├── RFM_Table.csv
│   ├── Average Monetary Value.png
│   ├── RFM Customer Segmentation.png
│   └── EDA Summary.md
```

---

## 🚦 Project Workflow

### 1. 📥 Data Import
- The [SAMPLE_SALES_DATA](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/RFM%20Segmentation%20for%20Sales%20Data/SAMPLE_SALES_DATA.csv) file was imported into the `rfm_sales` database using the Excel to DB Import Tool.

### 2. 🧹 Data Cleaning
- Ensured correct date formats
- Removed duplicates and handled missing values
- Cleaned numeric fields for proper aggregation

### 3. 📊 Exploratory Data Analysis (EDA)
Key analyses included:
- Descriptive statistics of sales, quantity, and order frequency
- Trends over time
- Identifying top customers and products

**EDA Results** stored in: [EDA Summary.md](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/RFM%20Segmentation%20for%20Sales%20Data/Exploratory_Data_Analysis%20(EDA).sql)

### 4. 🧮 RFM Segmentation
The RFM logic was implemented using SQL views and subqueries:
- **Recency (R):** Days since last purchase
- **Frequency (F):** Number of orders per customer
- **Monetary (M):** Total sales per customer

Each RFM metric was scored from 1 to 5 using `NTILE(5)` window functions. Scores were concatenated and mapped to segments like:
- **Champions** (e.g., 555, 554, 545)
- **Loyal Customers**
- **Potential Loyalists**
- **Promising Customers**
- **Needs Attention**
- **About to Sleep**

The RFM segmentation was finalized in a SQL view [RFM.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/RFM%20Segmentation%20for%20Sales%20Data/RFM%20Segmentation%20in%20SQL.sql)

### 5. 📊 Visualization with Power BI
- [RFM segment performance](https://app.powerbi.com/view?r=eyJrIjoiZjJkN2RjNmMtZDQ2OC00OWE1LTlhMzMtMmViMzNlYTdhNWU0IiwidCI6IjQxYjQ2M2RkLTg1ZWItNGE1NS1iYTZmLTVhMWFjYWMyYjA5YyIsImMiOjEwfQ%3D%3D)
- Average monetary value per segment
- Segment distribution and KPIs

---

## 🔍 Results & Findings

### 📄 [EDA Summary](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/RFM%20Segmentation%20for%20Sales%20Data/EDA%20Summary%20Result.pdf)
- Customers from North America dominate the dataset
- High revenue contributions from a small percentage of customers (Pareto principle)
- Monthly sales show seasonal patterns

### 🧩 [RFM Segmentation Highlights](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/RFM%20Segmentation%20for%20Sales%20Data/RFM%20Segmentation%20Result%20summary.pdf)
- **Champions** contribute the most in terms of revenue and order volume
- **Promising Customers** have potential for loyalty programs
- **About to Sleep** and **Needs Attention** segments could be targeted for re-engagement

---

## 📌 Conclusion
This project demonstrates how SQL and Power BI can be used for customer segmentation via RFM analysis. By categorizing customers based on recency, frequency, and monetary value, businesses can:

- Personalize marketing strategies
- Improve customer retention
- Boost sales performance through targeted campaigns

---


