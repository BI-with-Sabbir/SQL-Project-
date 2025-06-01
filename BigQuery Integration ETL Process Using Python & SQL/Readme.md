# Python to BigQuery ETL Pipeline Project

## 📅 Project Overview
This project demonstrates a complete **ETL (Extract, Transform, Load)** pipeline using Python, Google Sheets, and Google BigQuery. It includes data extraction from Google Sheets, data cleaning and transformation in Python, and loading the consolidated data into BigQuery for further analysis. A stored procedure is also created in BigQuery to remove records with negative profit.

---

## 💰 Data Sources
All data is retrieved directly from a shared **Google Spreadsheet**, which includes multiple sheets:

| Sheet Name | Description | CSV Link |
|------------|-------------|----------|
| Orders     | Contains sales transaction records | [Orders CSV](https://docs.google.com/spreadsheets/d/1M0u00wa4A6CqTA8xImd90nDtF86OwhR2ESgQjUItfaY/export?format=csv&gid=1531479241) |
| Customers  | Maps Customer IDs to Names | [Customers CSV](https://docs.google.com/spreadsheets/d/1M0u00wa4A6CqTA8xImd90nDtF86OwhR2ESgQjUItfaY/export?format=csv&gid=2099175586) |
| Returns    | Indicates which orders were returned | [Returns CSV](https://docs.google.com/spreadsheets/d/1M0u00wa4A6CqTA8xImd90nDtF86OwhR2ESgQjUItfaY/export?format=csv&gid=1158708900) |
| Users      | Associates regions with sales managers | [Users CSV](https://docs.google.com/spreadsheets/d/1M0u00wa4A6CqTA8xImd90nDtF86OwhR2ESgQjUItfaY/export?format=csv&gid=531959115) |

---

## 🌐 Tech Stack
- **Python**: `pandas`, `numpy`, `matplotlib`, `seaborn`
- **Google BigQuery**: for storing and querying consolidated data
- **Google Sheets**: for initial data source

---

## 📊 ETL Steps [Click Here To See Python Notebook](https://github.com/BI-with-Sabbir/SQL-Project-/blob/main/BigQuery%20Integration%20ETL%20Process%20Using%20Python%20%26%20SQL/Colab_(Python)_to_BigQuery_Integration_for_Data_Scientists.ipynb)

### ✂️ Extract
- Data is fetched directly using `pandas.read_csv()` with a converted CSV export link from Google Sheets.

### ⚖️ Transform
- Data type conversions (e.g., dates, postal codes)
- Cleaning missing or incorrect values
- Joining multiple sheets:
  - Orders ➔ Customers
  - Orders ➔ Users
  - Orders ➔ Returns
- Statistical summaries using `.describe()` and `.info()`

### ↓ Load
- The cleaned and consolidated data is pushed into **Google BigQuery** using `to_gbq()`.

```python
from pandas_gbq import to_gbq

df_consolidated.to_gbq(
    destination_table='ecommerce_data.superstore_sales_denormalized_table',
    project_id='tutorial-data-441413',
    if_exists='replace'
)
```

---

## 📊 BigQuery Stored Procedure
A stored procedure was created to **remove rows where profit is negative**.

### Stored Procedure:
```sql
CREATE OR REPLACE PROCEDURE `tutorial-data-441413.ecommerce_data.remove_negative_profits`(
    IN table_name STRING
)
BEGIN
  DELETE FROM `tutorial-data-441413.ecommerce_data.superstore_sales_denormalized_table`
  WHERE Profit < 0;
END;
```

### Call Procedure from Python:
```python
client.query("CALL `tutorial-data-441413.ecommerce_data.remove_negative_profits`('superstore_sales_denormalized_table')")
```

---

## 🔄 Retrieve Data from BigQuery
To read data back into Python:
```python
from google.cloud import bigquery

client = bigquery.Client(project='tutorial-data-441413')
query = """
    SELECT * FROM `tutorial-data-441413.ecommerce_data.superstore_sales_denormalized_table`
    LIMIT 100
"""

df = client.query(query).to_dataframe()
```

---

## 📑 Key Learnings
- Seamless integration between Google Sheets and Python
- Data transformation & type casting with Pandas
- Working with Google BigQuery in Python
- Creating and executing stored procedures from Python

---

## 🏆 Final Output
- Cleaned and merged dataset stored in BigQuery.
- Ready for advanced analytics and dashboarding in tools like **Looker Studio**, **Power BI**, etc.

---

# Python to BigQuery ETL Process

This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline using Python, Google Sheets, and Google BigQuery. It includes data extraction from Google Sheets, basic data exploration and cleaning, data merging/denormalization, and finally storing the clean consolidated data into BigQuery.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Steps Involved](#steps-involved)
  - [1. Import Libraries](#1-import-libraries)
  - [2. Extract Data from Google Sheets](#2-extract-data-from-google-sheets)
  - [3. Exploratory Data Analysis (EDA)](#3-exploratory-data-analysis-eda)
  - [4. Data Cleaning](#4-data-cleaning)
  - [5. Data Merging (Denormalization)](#5-data-merging-denormalization)
  - [6. Load into BigQuery](#6-load-into-bigquery)
  - [7. Stored Procedure for Business Rule](#7-stored-procedure-for-business-rule)
- [Conclusion](#conclusion)

---

## Project Overview
This ETL pipeline consolidates multiple Google Sheets containing order, customer, return, and regional data of a fictional e-commerce business. After cleaning and merging the datasets, it saves the final denormalized table in BigQuery. A stored procedure is created to remove negative profit records as part of a business rule enforcement.

---

## Technologies Used
- Python (pandas, numpy, matplotlib, seaborn)
- Google Colab / Jupyter
- Google Sheets (as data source)
- Google BigQuery (for data warehouse)
- Google Cloud SDK (for authentication)

---

## Steps Involved

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
Used the CSV export feature of Google Sheets:
```python
orders = "https://docs.google.com/spreadsheets/d/<<sheet_id>>/export?format=csv&gid=1531479241"
df_orders = pd.read_csv(orders, index_col='Row ID')
df_customers = pd.read_csv("...gid=2099175586")
df_returns = pd.read_csv("...gid=1158708900")
df_users = pd.read_csv("...gid=531959115")
```

### 3. Exploratory Data Analysis (EDA)
- Displayed `.head()` and `.info()` for structure understanding
- `.describe()` for basic statistics
- Verified data types

### 4. Data Cleaning
- Converted `Order Date` and `Ship Date` to datetime
- Treated `Postal Code` as string
- Removed unneeded columns for descriptive statistics

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
project_id = 'tutorial-data-441413'
df_consolidated.to_gbq('ecommerce_data.superstore_sales_denormalized_table', project_id, if_exists='replace')
```

### 7. Stored Procedure for Business Rule
To remove records with negative profit:
```sql
CREATE OR REPLACE PROCEDURE `tutorial-data-441413.ecommerce_data.remove_negative_profits`(
    IN table_name STRING
)
BEGIN
  DELETE FROM `tutorial-data-441413.ecommerce_data.superstore_sales_denormalized_table`
  WHERE Profit < 0;
END;
```
Call via Python:
```python
client.query("CALL `tutorial-data-441413.ecommerce_data.remove_negative_profits`('superstore_sales_denormalized_table')")
```

---

## Conclusion
This project showcases a real-world ETL process integrating Google Sheets with BigQuery using Python. It highlights not just data transformation but also data governance using SQL procedures in BigQuery.

> ✅ Great for portfolios involving cloud-based ETL, data wrangling, and SQL automation.




