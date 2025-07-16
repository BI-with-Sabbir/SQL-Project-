# 🐍 Python to BigQuery ETL Pipeline Project
<img width="1094" height="537" alt="image" src="https://github.com/user-attachments/assets/b72445a2-e5c4-46ee-b6bf-66f5bd51f258" />


## 📑 Table of Contents

* [Project Overview](#-project-overview)
* [Technologies Used](#-technologies-used)
* [ETL Steps](#-etl-steps)

  * [1. Import Libraries](#-1-import-libraries)
  * [2. Extract Data from Google Sheets](#-2-extract-data-from-google-sheets)
  * [3. Exploratory Data Analysis (EDA)](#-3-exploratory-data-analysis-eda)
  * [4. Data Cleaning](#4-data-cleaning)
  * [5. Data Merging (Denormalization)](#-5-data-merging-denormalization)
  * [6. Load into BigQuery](#-6-load-into-bigquery)
  * [7. Stored Procedure for Business Rule](#-7-stored-procedure-for-business-rule)
* [Retrieve Data from BigQuery](#-retrieve-data-from-bigquery)
* [Key Learnings](#-key-learnings)
* [Final Output](#-final-output)
* [Conclusion](#-conclusion)

---

## 📅 Project Overview

This project demonstrates a complete **ETL (Extract, Transform, Load)** pipeline using **Python**, **Google Sheets**, and **Google BigQuery**. It includes data extraction from Google Sheets, data cleaning and transformation using Pandas, loading the final consolidated data into BigQuery, and applying a **stored procedure** to remove rows with negative profits.

---

## 💻 Technologies Used

* **Python**: `pandas`, `numpy`, `matplotlib`, `seaborn`
* **Google Colab / Jupyter Notebook**
* **Google Sheets** (data source)
* **Google BigQuery** (data warehouse)
* **Google Cloud SDK** (authentication)

---

## 🔁 ETL Steps

### 1. Import Libraries

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from google.cloud import bigquery
from google.colab import auth
```

### 2. Extract Data from Google Sheets

Data fetched using `.read_csv()` with Google Sheets export link.

```python
orders_url = "https://docs.google.com/spreadsheets/d/.../export?format=csv&gid=1531479241"
df_orders = pd.read_csv(orders_url, index_col='Row ID')
df_customers = pd.read_csv("...gid=2099175586")
df_returns = pd.read_csv("...gid=1158708900")
df_users = pd.read_csv("...gid=531959115")
```

### 3. Exploratory Data Analysis (EDA)

* `.head()`, `.info()`, `.describe()` for structure and statistics
* Checked data types and missing values

### 4. Data Cleaning

```python
df_orders['Order Date'] = pd.to_datetime(df_orders['Order Date'])
df_orders['Ship Date'] = pd.to_datetime(df_orders['Ship Date'])
df_orders['Postal Code'] = df_orders['Postal Code'].astype(str)
```

### 5. Data Merging (Denormalization)

```python
df_consolidated = df_orders.copy()
df_consolidated = pd.merge(df_consolidated, df_customers, on='Customer ID', how='left')
df_consolidated = pd.merge(df_consolidated, df_users, on='Region', how='left')
df_consolidated = pd.merge(df_consolidated, df_returns, on='Order ID', how='left')
```

### 6. Load into BigQuery

```python
from pandas_gbq import to_gbq

project_id = 'tutorial-data-441413'
df_consolidated.to_gbq(
    destination_table='ecommerce_data.superstore_sales_denormalized_table',
    project_id=project_id,
    if_exists='replace'
)
```

### 7. Stored Procedure for Business Rule

```sql
CREATE OR REPLACE PROCEDURE `tutorial-data-441413.ecommerce_data.remove_negative_profits`(
    IN table_name STRING
)
BEGIN
  DELETE FROM `tutorial-data-441413.ecommerce_data.superstore_sales_denormalized_table`
  WHERE Profit < 0;
END;
```

**Call from Python:**

```python
client.query("CALL `tutorial-data-441413.ecommerce_data.remove_negative_profits`('superstore_sales_denormalized_table')")
```

---

## 🔄 Retrieve Data from BigQuery

```python
client = bigquery.Client(project='tutorial-data-441413')
query = """
    SELECT * FROM `tutorial-data-441413.ecommerce_data.superstore_sales_denormalized_table`
    LIMIT 100
"""
df = client.query(query).to_dataframe()
```

---

## 📌 Key Learnings

* Efficient data extraction from Google Sheets to Python
* Data cleaning and merging using Pandas
* Google BigQuery loading and querying
* Stored procedure for enforcing business logic in SQL

---

## 🏁 Final Output

* **Denormalized sales data stored in BigQuery**
* **Negative profit rows removed by stored procedure**
* Dataset ready for dashboarding in **Power BI**, **Looker Studio**, etc.

---

## ✅ Conclusion

This project showcases a real-world **ETL pipeline** using **Python and BigQuery**, focusing on cloud-based integration, automated data cleaning, and business logic enforcement. It's ideal for portfolio demonstration in **data engineering, analytics, or BI roles**.

---
