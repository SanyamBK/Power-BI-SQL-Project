-- A. KPIs

-- i. Total Sales
SELECT CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Revenue
FROM pizza_sales;

-- ii. Average Order Value
SELECT CAST(SUM(total_price) AS DECIMAL(10, 2)) / COUNT(DISTINCT order_id) AS Average_Order_Value
FROM pizza_sales;

-- iii. Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

-- iv. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- v. Average Pizzas Per Order
SELECT CAST(SUM(quantity) AS DECIMAL(10, 2)) / COUNT(DISTINCT order_id) AS Avg_Pizzas_Per_Order
FROM pizza_sales;


-- B. Daily Trend for Orders
SELECT DATENAME(WEEKDAY, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date);


-- C. Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date);


-- D. Percentage of Total Sales by Pizza Category
SELECT
    pizza_category,
    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales,
    CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price)
    FROM pizza_sales) AS DECIMAL(10, 2)) AS Percentage_Sales_By_Category
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_Sales_By_Category DESC;


-- E. Percentage of Total Sales by Pizza Size
SELECT
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales,
    CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price)
    FROM pizza_sales) AS DECIMAL(10, 2)) AS Percentage_Sales_By_Size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_Sales_By_Size DESC;


-- F. Top 5 Pizzas

-- i. By Revenue
SELECT TOP 5
    pizza_name, CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales DESC;

-- ii. By Quantity
SELECT TOP 5
    pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

-- iii. By Orders
SELECT TOP 5
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


-- G. Bottom 5 Pizzas

-- i. By Revenue
SELECT TOP 5
    pizza_name, CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sales ASC;

-- ii. By Quantity
SELECT TOP 5
    pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC;

-- iii. By Orders
SELECT TOP 5
    pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
