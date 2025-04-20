# 📊 Customer Cohort & CLV Analysis Portfolio Project

This project focuses on analyzing customer behavior using **Cohort Analysis** and calculating **Customer Lifetime Value (CLV)** to drive strategic decision-making. It uses SQL in Snowflake for data processing and Excel.csv for Output data visualizations.

---

## 📁 Project Overview

The goal of this project is to:
- Perform **Exploratory Data Analysis (EDA)** to understand customer purchase trends
- Apply **Cohort Analysis** to study customer retention patterns
- Calculate **Customer Lifetime Value (CLV)** for various cohorts
- Visualize findings to support marketing and retention strategies

The dataset used in this project is based on the **Online Retail** transactions.

---

## 🧰 Tools & Technologies

- **Snowflake SQL** – For data warehousing, cleaning, and cohort/CLV calculations
- **Excel** – For dataset import and preprocessing (if required)

---

## 🗃️ Database Details

- **Database Name:** `Sales`
- **Schema Name:** `cohort_analysis`
- **Table Name:** `RETAIL`
- **Dataset:** Online Retail Transactional Data

---

## 📂 File Structure

```
📁 Customer-Cohort-CLV-Analysis-Project
├── 📊 Dataset/
│   └── OnlineRetail.xlsx
├── 🧼 Data Cleaning.sql
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

### 1. 🧼 Data Cleaning
- Parsed date from string using `TO_TIMESTAMP`
- Filtered cancelled orders, nulls, and non-positive values
- Created a clean table for further analysis

**SQL Script:** [Data Cleaning.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Data%20cleaning.sql)

### 2. 📊 Exploratory Data Analysis (EDA)
Key questions answered:
- What is the distribution of sales by country?
- Which products have the highest sales volume?
- What are the monthly and daily sales trends?

**EDA SQL:** [Exploratory Data Analysis.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/EDA%20questions%20%26%20solution.sql)

**EDA Summary:** [EDA Summary.md](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Summary%20of%20EDA%20Questions%20and%20Queries.pdf)

### 3. 👥 Cohort Analysis
Cohorts were created based on each customer's first transaction month. Retention was tracked across subsequent months using:
- Time between purchase and first purchase
- Grouping into cohort months

**SQL Script:** [Customer Retention.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Retention%20Cohort%20Analysis.sql)

**Output Sample:** [Retention Output](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Retention%20Output.csv)

### 4. 💸 Customer Lifetime Value (CLV)
CLV was calculated based on:
- Monthly revenue per customer
- Aggregated across cohorts over time

**SQL Script:** [Customer Lifetime Value.sql](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Lifetime%20Value.sql)

**Output Sample:** [CLV Output](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Lifetime%20Value%20Output.csv)

---

## 📊 EXCEL Dashboard
Key visuals included:
- Customer retention heatmap by cohort
- CLV trends over months
- Top customer segments and revenue breakdown

🔗 [EXCEL Dashboard](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/Cohort%20Analysis%20using%20Snowflake/Customer%20Cohort%20Analysis%20in%20Excel%20with%20SQL%20Output.xlsx)

---

## 🔍 Results & Findings

### 🔁 Retention Analysis
- High drop-off after the first month across all cohorts
- Few cohorts retained customers beyond 3–4 months

### 💰 Customer Lifetime Value
- Early cohorts (e.g., 2010-12) show higher CLV
- Strong correlation between retention and revenue longevity

---

## 📌 Conclusion

This project highlights how **Cohort Analysis** and **Customer Lifetime Value** calculation can uncover key trends in customer retention and revenue generation. Business decisions supported by these insights include:
- Designing retention campaigns for low-engagement segments
- Predicting future revenue potential from newly acquired customers
- Evaluating marketing effectiveness by cohort

---


