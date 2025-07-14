# 📊 Customer RFM Segmentation Portfolio Project

This project focuses on analyzing customer behavior using **Cohort Analysis** and calculating **Customer Lifetime Value (CLV)** to drive strategic decision-making. It uses SQL in Snowflake for data processing and Excel.csv for Output data visualizations.

---

## 📂 Table of Contents

* [📁 Project Overview](#-project-overview)
* [🪰 Tools & Technologies](#-tools--technologies)
* [📃 Database Details](#-database-details)
* [📂 File Structure](#-file-structure)
* [🚦 Project Workflow](#-project-workflow)

  * [🪜 Data Cleaning](#-data-cleaning)
  * [📊 Exploratory Data Analysis](#-exploratory-data-analysis)
  * [👥 Cohort Analysis](#-cohort-analysis)
  * [💸 Customer Lifetime Value](#-customer-lifetime-value)
* [📈 EXCEL Dashboard](#-excel-dashboard)
* [🔍 Results & Findings](#-results--findings)
* [📀 Conclusion](#-conclusion)

---

## 📁 Project Overview

The goal of this project is to:

* Perform **Exploratory Data Analysis (EDA)** to understand customer purchase trends
* Apply **Cohort Analysis** to study customer retention patterns
* Calculate **Customer Lifetime Value (CLV)** for various cohorts
* Visualize findings to support marketing and retention strategies

The dataset used in this project is based on the **Online Retail** transactions.

---

## 🪰 Tools & Technologies

* **Snowflake SQL** – For data warehousing, cleaning, and cohort/CLV calculations
* **Excel** – For dataset import and visualization

---

## 📃 Database Details

* **Database Name:** `Sales`
* **Schema Name:** `cohort_analysis`
* **Table Name:** `RETAIL`
* **Dataset:** Online Retail Transactional Data

---

## 📂 File Structure

```
📁 Customer-Cohort-CLV-Analysis-Project
├── 📊 Dataset/
│   └── OnlineRetail.xlsx
├── 🪜 Data Cleaning.sql
├── 📊 Exploratory Data Analysis (EDA).sql
│   └── EDA Summary.md
├── 📈 Cohort Analysis.sql
│   └── Retention Output.csv
├── 💸 Customer Lifetime Value.sql
│   └── CLV Output.csv
├── 📄 README.md
├── 📁 Results & Findings/
│   ├── Retention_Heatmap.png
│   ├── CLV_Trend_Chart.png
│   ├── Monthly_Cohort_Table.csv
│   └── Summary_Report.md
```

---

## 🚦 Project Workflow

### 🪜 Data Cleaning

* Parsed date from string using `TO_TIMESTAMP`
* Filtered cancelled orders, nulls, and non-positive values
* Created a clean table for further analysis

**SQL Script:** [Data Cleaning.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Data%20cleaning.sql)

### 📊 Exploratory Data Analysis

* Distribution of sales by country
* Highest selling products
* Monthly and daily sales trends

**SQL Script:** [EDA.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/EDA%20questions%20%26%20solution.sql)

### 👥 Cohort Analysis

* Tracked customer retention based on first purchase month
* Grouped data into cohort periods for comparison

**SQL Script:** [Cohort Analysis.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Retention%20Cohort%20Analysis.sql)

**Output:** [Retention Output](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Retention%20Output.csv)

### 💸 Customer Lifetime Value

* Monthly revenue per customer
* Aggregated revenue over cohort lifespan

**SQL Script:** [CLV.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Lifetime%20Value.sql)

**Output:** [CLV Output](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Lifetime%20Value%20Output.csv)

---

## 📊 EXCEL Dashboard

**Visualized Insights:**

* Retention heatmap by cohort
* CLV growth across months
* Monthly cohort sales comparison

[Excel Dashboard](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Cohort%20Analysis%20in%20Excel%20with%20SQL%20Output.xlsx)

---

## 🔍 Results & Findings

### 🔁 Retention Analysis

* High drop-off after first month
* Few cohorts retained beyond 4 months

### 💰 CLV Analysis

* Early cohorts show higher LTV
* Strong retention drives long-term revenue

---

## 📀 Conclusion

This project demonstrates how **Cohort Analysis** and **CLV** calculation help businesses:

* Understand customer engagement patterns
* Predict future revenue
* Improve retention and acquisition strategies
