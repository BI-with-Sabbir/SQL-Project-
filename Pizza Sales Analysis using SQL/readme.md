# 🍕 Pizza Sales Analysis using SQL

## 📌 Project Overview
This project focuses on analyzing pizza sales data using SQL. By querying a relational database, we aim to uncover insights into total sales, revenue generation, order trends, and pizza popularity.

## 🏛 Database Schema
The database consists of the following tables:

### 1️⃣ `pizzas` Table
| Column         | Description                 |
|---------------|-----------------------------|
| `pizza_id`    | Unique identifier for pizzas |
| `pizza_type_id` | Type of pizza               |
| `size`        | Pizza size (Small, Medium, Large) |
| `price`       | Price of the pizza          |

### 2️⃣ `pizza_types` Table
| Column        | Description                  |
|--------------|------------------------------|
| `pizza_type_id` | Unique ID for each pizza type |
| `name`       | Name of the pizza             |
| `category`   | Category of the pizza (Veg, Non-Veg) |
| `ingredients` | List of ingredients used     |

### 3️⃣ `order_details` Table
| Column          | Description                |
|----------------|----------------------------|
| `order_details_id` | Unique ID for order details |
| `order_id`     | Order identifier           |
| `pizza_id`     | Pizza ordered               |
| `quantity`     | Quantity ordered            |

### 4️⃣ `orders` Table
| Column    | Description             |
|----------|-------------------------|
| `order_id` | Unique identifier for orders |
| `date`    | Date of order placement |
| `time`    | Time of order placement |

## 🎯 SQL Queries & Insights

### 🔹 Basic Analysis

#### 1️⃣ Retrieve the total number of orders placed
![image](https://github.com/user-attachments/assets/5f556181-00dc-4033-a8e3-13697f8bcac4)

#### 2️⃣ Calculate the total revenue generated from pizza sales
![image](https://github.com/user-attachments/assets/0d9edefe-3b11-4c5c-ade0-2424c81939aa)


#### 3️⃣ Identify the highest-priced pizza
![image](https://github.com/user-attachments/assets/62b59ba5-f796-4598-8ba2-f2f0d5b0241d)


#### 4️⃣ Identify the most common pizza size ordered
![image](https://github.com/user-attachments/assets/8a13b8c1-c753-41f8-9222-b3a1711ba4db)


#### 5️⃣ List the top 5 most ordered pizza types along with their quantities
![image](https://github.com/user-attachments/assets/5ef6fc1c-921d-4069-ba46-3baa02cf74ea)


---
### 🔹 Intermediate Analysis

#### 6️⃣ Total quantity of each pizza category ordered
![image](https://github.com/user-attachments/assets/01430606-868d-4a1f-ba11-6b7089f9a1bb)


#### 7️⃣ Distribution of orders by hour of the day
![image](https://github.com/user-attachments/assets/c59429fa-033f-4911-b035-de7f3c00b7db)


#### 8️⃣ Category-wise distribution of pizzas ordered
![image](https://github.com/user-attachments/assets/d6cae5f4-2101-48d0-8948-5ae897df7df2)


#### 9️⃣ Average number of pizzas ordered per day
![image](https://github.com/user-attachments/assets/babdfddb-823b-416d-b441-ca7a46615d9c)


#### 🔟 Top 3 most ordered pizza types based on revenue
![image](https://github.com/user-attachments/assets/ab9cd4d1-30d9-4acc-98ea-ba679489b007)


---
### 🔹 Advanced Analysis

#### 1️⃣1️⃣ Percentage contribution of each pizza type to total revenue
![image](https://github.com/user-attachments/assets/945227b0-cea2-4565-8ea0-b6dea3498b4f)


#### 1️⃣2️⃣ Cumulative revenue over time
![image](https://github.com/user-attachments/assets/9a44ee17-2c1e-4c59-8442-82f89aea5f08)


#### 1️⃣3️⃣ Top 3 most ordered pizza types based on revenue for each category
![image](https://github.com/user-attachments/assets/6faa6c92-493d-4d53-a445-42764fb42416)


## 📈 Key Insights
- **Total Orders:** 21350
- **Total Revenue:** $817860.05
- **Most Popular Pizza Size:** Large(L)
- **Top-Selling Pizza Type:** The Classic Deluxe Pizza
- **Peak Order Hour:** 12 PM
- **Highest Revenue-Generating Pizza:** The Thai Chicken Pizza

## 🏆 Future Improvements
- Implement visualization using Power BI or Tableau.
- Optimize SQL queries for performance.
- Perform predictive analysis for future sales forecasting.

---
### 📂 Repository Structure
```
📂 Pizza-Sales-Analysis
 ├── 📄 README.md  # Project Documentation
 ├── 📄 pizza_sales_queries.sql  # All SQL queries
 ├── 📊 Insights_Report.pdf  # Key insights and analysis
```



