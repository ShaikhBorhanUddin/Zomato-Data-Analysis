# Zomato-Data-Analysis
![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/title.png?raw=true)

## 📌 Project Overview

## 📦 Dataset, Visualization & Data Cleaning

The [dataset](https://www.kaggle.com/datasets/anas123siddiqui/zomato-database) is sourced from Kaggle. A brief overview of the dataset with key columns and description is given in the following table.
| Table Name       | Columns                              | Key Columns                        | Description                                                                 |
|------------------|--------------------------------------|------------------------------------|-----------------------------------------------------------------------------|
| `food.csv`       | <p align="center">4</p>              | `f_id`, `item`, `veg_or_non_veg`   | Contains unique food items and their vegetarian classification.            |
| `menu.csv`       | <p align="center">6</p>              | `menu_id`, `f_id`, `r_id`, `price` | Maps food items to restaurant menus, including price and cuisine type.     |
| `orders.csv`     | <p align="center">7</p>              | `order_date`, `user_id`, `r_id`    | Records order transactions including sales amount, quantity, and date.     |
| `restaurant.csv` | <p align="center">12</p>             | `id`, `name`, `city`, `rating`     | Information about each restaurant: name, location, ratings, cuisines, and licensing details. |
| `users.csv`      | <p align="center">12</p>             | `user_id`, `Age`, `Gender`         | User demographics including age, income, education, and family size.       |

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/veg_vs_non_veg.png?raw=true" alt="Veg vs Non-Veg" width="30%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/distribution_of%20_cuisine.png?raw=true" alt="Cuisine Distribution" width="35.09%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/price_groups.png?raw=true" alt="Price Groups" width="31.32%" />
</p>

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/price-groups_bar.png?raw=true" alt="Price Groups Bar" width="28.72%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/top_20_f_id.png?raw=true" alt="Top 20 Food IDs" width="34.5%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/top_20_r_id.png?raw=true" alt="Top 20 Restaurant IDs" width="34.5%" />
</p>

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/top_20_order_date.png?raw=true" alt="Top 20 Order Dates" width="32.5%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/order_count_y_and_m.png?raw=true" alt="Order Count by Year and Month" width="38%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/order_count_day.png?raw=true" alt="Order Count by Day" width="27%" />
</p>

For more details and python codes for visualizations, click the [link](https://colab.research.google.com/drive/1HsaqNjhSE_akLOapiRKfzaz7DPkM3cNT?usp=sharing).

### 🧹 Data Cleaning Steps

### 🧱 ER Diagram

The primary key for the restaurant table is `id`, which is in INT format. Both the menu and orders tables use this as a foreign key, referred to as `r_id`. However, in the menu table, `r_id` is formatted as VARCHAR, while in the orders table, it is formatted as FLOAT. To avoid errors during data uploading, the restaurant ID should be in INT format across all three tables. Additionally, there are several instances of the same `menu_id` in the menu table. Therefore, this column is combined with index column to create a composite primary key.

![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/zomato_erd.png?raw=true)

## 📂 Folder Structure
```bash
Zomato_Data_Analysis/
│
├── Dataset/                                    # Contains raw CSV and ZIP files
├── Images/                                     # ERD, visualization, title images
├── SQL/                                        # SQL scripts for this project
├── Solutions/                                  # Details solutions, outputs with visualizations
├── Requirements.txt                            # Project requirements
├── README.md                                   # Overvier of the project
└── Licence                                     # Licence details
```
## 🔄 Workflow

The following steps outline the end-to-end workflow for this project:

- **SQL Table Formation** : Database schema is designed and SQL tables are created based on the structure of the CSV files using appropriate data types and primary keys.

- **Data Upload (CSV Files)** : Raw datasets are imported into the respective SQL tables using COPY or \COPY commands (PostgreSQL) or relevant database import methods.

- **Data Cleaning** : Unnecessary nulls, duplicates, and inconsistencies are handled using SQL scripts to ensure data quality and integrity before analysis.

- **Foreign Key Formation** : Relationships are established between tables by defining foreign key constraints to maintain referential integrity and enable relational queries.

- **SQL Queries** : Complex SQL queries are written to extract insights such as sales trends, customer behavior, and product performance across various dimensions.

- **Result Visualization with Tableau** : The query results are connected to Tableau for interactive dashboards and visualizations to effectively communicate key business insights.

## ❓ Analytic Questions
1. What are the top 10 restaurants by total sales amount?
2. What is the average rating and total rating count for restaurants in the top 20 cities?
3. What are the monthly order trends based on order volume over time?
4. What are the top 5 most popular cuisines by order volume?
5. What is the distribution of vegetarian vs non-vegetarian items ordered?
6. What are the top 20 cities by the number of restaurants?
7. How do different user demographics correlate with average order value?
8. Who are the top 15 highest-spending users?
9. What are the top 15 cuisines with the highest average menu prices?
10. Which restaurants offer the most diverse menu, based on the number of unique cuisines and dishes available?
11. What are the most ordered food items across all restaurants?
12. How does spending behavior differ between genders?
13. On which days of the week do restaurants experience peak order volumes?
14. How does order frequency vary across different income groups?

Solving these 14 analytic questions is essential for business intelligence and analytics as they provide valuable insights into various aspects of restaurant operations, customer behavior, and market trends. By analyzing top performers, customer satisfaction, order trends, menu preferences, and demographic influences, businesses can optimize pricing strategies, marketing campaigns, and operational efficiency. Understanding factors such as peak order times, menu diversity, and the relationship between income and order frequency helps companies make data-driven decisions, tailor offerings to customer segments, improve inventory management, and identify growth opportunities. Ultimately, these insights enable businesses to enhance customer experience, increase profitability, and maintain a competitive edge in a dynamic market.

## 🔍 Sample SQL Queries
```sql
-- 2. Average Rating and Rating Count by top 20 City

SELECT 
    city,
    AVG(rating) AS avg_rating,
    AVG(
        CASE 
            WHEN rating_count = 'Too Few Ratings' THEN 10
            WHEN rating_count = '20+ ratings' THEN 25
            WHEN rating_count = '50+ ratings' THEN 55
            WHEN rating_count = '100+ ratings' THEN 110
            ELSE NULL
        END
    ) AS avg_rating_count_est
FROM restaurant
WHERE rating IS NOT NULL
GROUP BY city
ORDER BY avg_rating DESC
LIMIT 20;
```
```sql
-- 8. High-Spending Users (Top 15)

WITH user_spending AS (
    SELECT user_id, SUM(sales_amount) AS total_spent
    FROM orders
    GROUP BY user_id
),
percentile_value AS (
    SELECT PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY total_spent) AS threshold
    FROM user_spending
)
SELECT us.user_id, us.total_spent
FROM user_spending us, percentile_value p
WHERE us.total_spent > p.threshold
LIMIT 15;
```
```sql
-- 10. Restaurants Offering the Most Diverse Menu

SELECT r.name, COUNT(DISTINCT m.f_id) AS item_count
FROM restaurant r
JOIN menu m ON r.id = m.r_id
GROUP BY r.name
ORDER BY item_count DESC
LIMIT 10;
```
```sql
-- 13. Peak Ordering Days

SELECT 
  TRIM(TO_CHAR(order_date, 'Day')) AS weekday,
  EXTRACT(DOW FROM order_date) AS weekday_num,
  COUNT(*) AS total_orders,
  SUM(sales_amount) AS total_sales
FROM orders
GROUP BY weekday, weekday_num
ORDER BY weekday_num;
```
```sql
-- 14. Income Group vs Order Frequency

SELECT 
  u.Monthly_Income, 
  COUNT(o.*) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.Monthly_Income
ORDER BY order_count DESC;
```
## 📊 Tableau Visualization

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_1.png?raw=true" alt="Visualization 1" width="49.5%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_3.png?raw=true" alt="Visualization 3" width="49%" />
</p>

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_4.png?raw=true" alt="Visualization 4" width="49.4%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_5.png?raw=true" alt="Visualization 5" width="49.4%" />
</p>

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_10.png?raw=true" alt="Visualization 10" width="49.5%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_11.png?raw=true" alt="Visualization 11" width="49.5%" />
</p>

## ✅ Key Takeaway

## 💡 Tools & Technology Used

## 🧠 Practical Applications

## 🛠️ How to use this repository

## 📄 Licence

This project is licensed under the MIT License. You are free to use, modify, and distribute this project for personal or commercial purposes, provided that proper credit is given to the original author. See the Licence file for full details.
                     
## 📬 Contact

If you have any questions or would like to connect, feel free to reach out!

**Shaikh Borhan Uddin**  
📧 Email: [`shaikhborhanuddin@gmail.com`](mailto:shaikhborhanuddin@gmail.com)  
🔗 [`LinkedIn`](https://www.linkedin.com/in/shaikh-borhan-uddin-905566253/)  
🌐 [`Portfolio`](https://github.com/ShaikhBorhanUddin)

Feel free to fork the repository, improve the queries, or add visualizations!

