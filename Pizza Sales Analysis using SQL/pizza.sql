create database pizza_sales;

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE,
    order_time TIME,
    PRIMARY KEY (order_id)
)

-- Retrieve the total number of orders placed.


SELECT 
    COUNT(order_id) AS Total_orders
FROM
    pizza_sales.orders;

-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2) AS Total_sales
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id;

-- Identify the highest-priced pizza.
SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizza_types.category,
    SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;

-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(orders.order_time) AS hour,
    COUNT(orders.order_id) AS order_count
FROM
    orders
GROUP BY HOUR(orders.order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) AS pizza_no
FROM
    pizza_sales.pizza_types
GROUP BY category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(quantity), 0) AS average_pizza_order_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;

-- Determine the top 3 most ordered pizza types based on revenue.


SELECT 
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;

-- Calculate the percentage contribution of each pizza type to total revenue.


SELECT 
    pt.category,
    ROUND(SUM(od.quantity * p.price) / (SELECT 
                    SUM(od.quantity * p.price)
                FROM
                    pizza_sales.order_details od
                        JOIN
                    pizza_sales.pizzas p ON od.pizza_id = p.pizza_id) * 100,
            2) AS revenue_percentage
FROM
    pizza_sales.pizza_types pt
        JOIN
    pizza_sales.pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    pizza_sales.order_details od ON od.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY revenue_percentage DESC;

-- Analyze the cumulative revenue generated over time.


SELECT 
    order_date,
    SUM(revenue) OVER (ORDER BY order_date) AS cum_revenue
FROM (
    SELECT 
        o.order_date,
        SUM(od.quantity * p.price) AS revenue
    FROM pizza_sales.order_details od
    JOIN pizza_sales.pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_sales.orders o ON o.order_id = od.order_id
    GROUP BY o.order_date
) AS sales;


-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
SELECT 
    category, 
    name, 
    revenue 
FROM (
    SELECT 
        pt.category, 
        pt.name AS name, 
        SUM(od.quantity * p.price) AS revenue, 
        DENSE_RANK() OVER (PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS rank_num
    FROM pizza_sales.pizza_types pt
    JOIN pizza_sales.pizzas p ON pt.pizza_type_id = p.pizza_type_id
    JOIN pizza_sales.order_details od ON od.pizza_id = p.pizza_id
    GROUP BY pt.category, pt.name
) AS ranked_pizzas
WHERE rank_num <= 3
ORDER BY category, rank_num limit 3;

