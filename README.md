# Zomato Data Analysis
<!-- Project Badges -->
![Made with](https://img.shields.io/badge/Made%20with-SQL-blue?logo=postgresql)
![Python](https://img.shields.io/badge/Data%20Visualization-Python-blue?logo=python)
![License](https://img.shields.io/github/license/ShaikhBorhanUddin/Zomato-Data-Analysis)
![Repo Size](https://img.shields.io/github/repo-size/ShaikhBorhanUddin/Zomato-Data-Analysis)
![Stars](https://img.shields.io/github/stars/ShaikhBorhanUddin/Zomato-Data-Analysis?style=social)
![Forks](https://img.shields.io/github/forks/ShaikhBorhanUddin/Zomato-Data-Analysis?style=social)
![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?logo=postgresql&logoColor=white)
![Tableau](https://img.shields.io/badge/BI%20Tool-Tableau-E97627?logo=Tableau&logoColor=white)
![Git](https://img.shields.io/badge/Version%20Control-Git-orange?logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/Host-GitHub-black?logo=github)
![Project Status](https://img.shields.io/badge/Project-Completed-brightgreen?style=flat-square)

![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/title.png?raw=true)
## 📌 Project Overview

The Zomato Database Analytics Project aims to conduct an in-depth exploratory data analysis and business intelligence assessment on a structured restaurant dataset sourced from Kaggle. This dataset consists of five interrelated tables. These tables capture essential information about food items, menus, customer orders, restaurant details, and user demographics. The primary objective of this project is to uncover actionable insights by addressing strategic business questions. These include identifying top-performing restaurants, understanding cuisine popularity, analyzing customer spending behavior, and revealing geographic and demographic trends. The analysis was carried out using PostgreSQL for complex queries and Python for data preprocessing and visualization.

This project empowers restaurant chains, food delivery platforms, and data analysts to make data-driven decisions regarding marketing strategies, pricing, customer segmentation, and expansion planning. By leveraging relational data modeling and advanced SQL analytics, it demonstrates how raw data can be transformed into meaningful intelligence.

## 📦 Dataset, Visualization & Data Cleaning

The [dataset](https://www.kaggle.com/datasets/anas123siddiqui/zomato-database) is sourced from Kaggle. The database is a comprehensive collection of tables that store vital information related to the app. This includes user data such as names, email addresses, and passwords (though all other data is real). The database features information on orders placed by users, available food items, restaurant menus, the restaurants themselves, and the registered users of the app. The tables are interrelated, allowing for efficient data retrieval. The Orders table includes details about each order, such as the order date and time, quantity sold, total sales amount, currency, user ID, and restaurant ID. The Food table provides information about food items, including their ID, name, and whether they are vegetarian or non-vegetarian. The Menu table contains data about restaurant menus, including menu ID, restaurant ID, food ID, cuisine type, and pricing. The Restaurant table holds information about the restaurants, which includes their ID, name, location, rating, number of ratings, average cost, cuisine type, license number, website link, address, and menu. Finally, the Users table contains information about app users, such as their ID, name, email, password, age, gender, marital status, occupation, monthly income, educational qualifications, and family size.
A brief overview of the dataset with key columns and description is given in the following table.

| Table Name       | Columns                              | Key Columns                        | Description                                                                 |
|------------------|--------------------------------------|------------------------------------|-----------------------------------------------------------------------------|
| `food.csv`       | <p align="center">4</p>              | `f_id`, `item`, `veg_or_non_veg`   | Contains unique food items and their vegetarian classification.            |
| `menu.csv`       | <p align="center">6</p>              | `menu_id`, `f_id`, `r_id`, `price` | Maps food items to restaurant menus, including price and cuisine type.     |
| `orders.csv`     | <p align="center">7</p>              | `order_date`, `user_id`, `r_id`    | Records order transactions including sales amount, quantity, and date.     |
| `restaurant.csv` | <p align="center">12</p>             | `id`, `name`, `city`, `rating`     | Information about each restaurant: name, location, ratings, cuisines, and licensing details. |
| `users.csv`      | <p align="center">12</p>             | `user_id`, `Age`, `Gender`         | User demographics including age, income, education, and family size.       |

Python was utilized for basic visualization of key columns. For instance, visualizations of cuisine or price groups were created using pie charts.
<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/veg_vs_non_veg.png?raw=true" alt="Veg vs Non-Veg" width="30%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/distribution_of%20_cuisine.png?raw=true" alt="Cuisine Distribution" width="35.09%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/price_groups.png?raw=true" alt="Price Groups" width="31.32%" />
</p>

For additional visualizations, such as price groups, restaurants, food items, order counts, and dates, vertical bar charts were employed.

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

### 🧹 Data Cleaning Process

The Zomato dataset contained several inconsistencies that needed to be addressed before running meaningful SQL queries. This data cleaning process involved standardizing currency values in the orders table by converting all USD entries to INR using a fixed exchange rate. In the restaurant table, missing or placeholder ratings were normalized and converted to a numeric format. Menu prices stored as text were cleaned and cast to float values, and orphan records referencing non-existent restaurants were removed to maintain relational integrity. The cost column was also cleaned of non-numeric characters and converted to a consistent numeric format. Additionally, missing restaurant names were reconstructed from URL links to ensure completeness. These steps were essential to prepare the dataset for accurate and efficient analysis. For details of data cleaning process and relevant SQL codes, please refer to [data_cleaning.sql]

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

This project aims to address several critical questions within the context of restaurant analytics. For an in-depth exploration of each question, complete with relevant SQL queries and visualizations, please refer to [Solutions and Visualizations](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Solutions/solutions_and_visualizations.md).

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

Addressing these 14 questions is crucial for effective business intelligence and analytics, as they yield valuable insights into various elements of restaurant operations, customer preferences, and market dynamics. By thoroughly examining top performers, customer satisfaction metrics, order patterns, menu trends, and demographic influences, businesses can refine their pricing approaches, enhance marketing strategies, and improve operational efficiency. Gaining an understanding of factors like peak ordering times, menu diversity, and the interplay between income levels and order frequency empowers companies to make informed, data-driven decisions. This, in turn, helps tailor services to customer segments, optimize inventory management, and spot potential growth avenues. Ultimately, these insights equip businesses to elevate the customer experience, boost profitability, and sustain a competitive advantage in an ever-evolving market.

## 🔍 Sample SQL Queries

Some SQL queries are showcased in this section with codes explained.

```sql
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

The SQL query above identifies the top 15 high-spending users who exceed the 99th percentile in total purchase amount. It first calculates each user's total spending using a `user_spending` CTE by summing `sales_amount` from the orders table grouped by `user_id`. Then, it computes the 99th percentile threshold using the `PERCENTILE_CONT(0.99)` function in a second CTE called `percentile_value`. Finally, it selects users whose total spending is greater than this threshold, orders them in descending order of spending, and limits the result to the top 15 users—highlighting the most valuable customers in the dataset.

```sql
SELECT r.name, COUNT(DISTINCT m.f_id) AS item_count
FROM restaurant r
JOIN menu m ON r.id = m.r_id
GROUP BY r.name
ORDER BY item_count DESC
LIMIT 10;
```
The second SQL query finds the top 10 restaurants offering the most diverse menus. It joins the `restaurant` table with the `menu` table using the restaurant ID `(r.id = m.r_id)`, then counts the number of **distinct food items** (`f_id`) each restaurant offers. The results are grouped by restaurant name, sorted in descending order by the number of unique menu items (`item_count`), and limited to the top 10—highlighting restaurants with the broadest variety of offerings.

```sql
SELECT 
  TRIM(TO_CHAR(order_date, 'Day')) AS weekday,
  EXTRACT(DOW FROM order_date) AS weekday_num,
  COUNT(*) AS total_orders,
  SUM(sales_amount) AS total_sales
FROM orders
GROUP BY weekday, weekday_num
ORDER BY weekday_num;
```
The third SQL query analyzes **peak ordering days** by summarizing order activity by weekday. It extracts the day of the week name using `TO_CHAR(order_date, 'Day')` (trimmed for clean formatting) and the numeric day of the week using `EXTRACT(DOW FROM order_date)` (0 = Sunday, 6 = Saturday). It then groups the data by both the weekday name and number, counting total orders and summing sales for each day. Finally, it orders the results by `weekday_num` to display the days in calendar order—helping identify which weekdays drive the most orders and revenue.

```sql
SELECT 
  u.Monthly_Income, 
  COUNT(o.*) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.Monthly_Income
ORDER BY order_count DESC;
```
The last  SQL query inclued in this section examines the relationship between **monthly income levels** and **order frequency**. It joins the `users` and `orders` tables using `user_id`, then groups the data by each user's `Monthly_Income`. For each income group, it counts the total number of orders placed (`order_count`). The results are ordered in descending order of order count, revealing which income brackets tend to place more orders—helpful for understanding purchasing behavior across income levels.

## 📊 Tableau Visualization

For every SQL query, results are visualized in Tableau. Some of these visualizations are included here with explanations.

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_1.png?raw=true" alt="Visualization 1" width="49.5%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_3.png?raw=true" alt="Visualization 3" width="49%" />
</p>

The first graph (on the left) shows a bar chart of user spending distribution, where most users have spent less than ₹10,000, and only a few exceed that amount, highlighting a sharp decline in high spenders. This indicates that while the majority of customers are low to mid-range spenders, a small segment accounts for significantly higher purchases. The second graph (on the right) illustrates the number of orders across different monthly income groups, showing a clear trend where users with higher incomes—particularly those earning ₹50,000 and above—tend to place more orders. This reflects a positive correlation between income level and order frequency.

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_4.png?raw=true" alt="Visualization 4" width="49.4%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_5.png?raw=true" alt="Visualization 5" width="49.4%" />
</p>

Pie chart visualizations focus on cuisine. The graph on the left presents the distribution of **order counts by different restaurant categories**, showing which types of restaurants receive the most orders. It highlights that categories such as **"Casual Dining"** and **"Quick Bites"** have the highest order volumes, suggesting that these types of establishments are the most popular among customers. The second graph compares the **average order value** across various restaurant categories. It reveals that **"Fine Dining"** restaurants have the highest average order value, indicating that customers are willing to spend more at higher-end establishments, while categories like **"Quick Bites"** and **"Casual Dining"** have relatively lower average spends. These insights offer a deeper understanding of customer preferences across different dining experiences.

<p align="center">
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_10.png?raw=true" alt="Visualization 10" width="49.4%" />
  <img src="https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_11.png?raw=true" alt="Visualization 11" width="49.4%" />
</p>

The last two visualizations were shown in treemaps. The first graph visualizes the **number of orders by day of the week**, revealing that weekends (Friday to Sunday) see significantly higher order volumes compared to weekdays. This pattern suggests that customers are more likely to order food on weekends, potentially due to more leisure time or social activities. The second graph shows **order frequency by time of day**, highlighting peak order times during **lunch (12 PM to 2 PM)** and **dinner (7 PM to 9 PM)** hours. This indicates that **customers tend to place more orders during traditional meal times**, which can help restaurants optimize their operations during these peak periods.

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

