-- 1. Top 10 Restaurants by Total Sales Amount

SELECT r.name, SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN restaurant r ON o.r_id = r.id
GROUP BY r.name
ORDER BY total_sales DESC
LIMIT 10;

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

-- 3. Monthly Order Trends

SELECT month, total_orders
FROM (
    SELECT 
        TO_CHAR(DATE_TRUNC('month', order_date), 'YYYY-MON') AS month,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
) AS sub
ORDER BY TO_DATE(month, 'YYYY-MON');

-- 4. Top 5 Most Popular Cuisines by Order Volume

SELECT m.cuisine, COUNT(o.*) AS order_count
FROM orders o
JOIN menu m ON o.r_id = m.r_id
GROUP BY m.cuisine
ORDER BY order_count DESC
LIMIT 5;

-- 5. Distribution of Vegetarian vs Non-Vegetarian Items Ordered

SELECT f.veg_or_non_veg, COUNT(*) AS item_count
FROM orders o
JOIN menu m ON o.r_id = m.r_id AND o.sales_qty > 0
JOIN food f ON m.f_id = f.f_id
GROUP BY f.veg_or_non_veg
LIMIT 2;

-- 6. Top 20 Cities by Number of Restaurants

SELECT city, COUNT(*) AS restaurant_count
FROM restaurant
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 20;

-- 7. User Demographics by Average Order Value

SELECT u.Occupation, AVG(o.sales_amount) AS avg_order_value
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.Occupation
ORDER BY avg_order_value DESC;

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

-- 9. Top 15 Average Menu Price by Cuisine

SELECT cuisine, AVG(price) AS avg_price
FROM menu
GROUP BY cuisine
ORDER BY avg_price DESC
LIMIT 15;

-- 10. Restaurants Offering the Most Diverse Menu

SELECT r.name, COUNT(DISTINCT m.f_id) AS item_count
FROM restaurant r
JOIN menu m ON r.id = m.r_id
GROUP BY r.name
ORDER BY item_count DESC
LIMIT 10;

-- 11. Most Ordered Food Items

SELECT f.item, SUM(o.sales_qty) AS total_quantity
FROM orders o
JOIN menu m ON o.r_id = m.r_id
JOIN food f ON m.f_id = f.f_id
GROUP BY f.item
ORDER BY total_quantity DESC
LIMIT 30;

-- 12. Gender-wise Spending Behavior

SELECT u.Gender, AVG(o.sales_amount) AS avg_spending
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.Gender;

-- 13. Peak Ordering Days

SELECT 
  TRIM(TO_CHAR(order_date, 'Day')) AS weekday,
  EXTRACT(DOW FROM order_date) AS weekday_num,
  COUNT(*) AS total_orders,
  SUM(sales_amount) AS total_sales
FROM orders
GROUP BY weekday, weekday_num
ORDER BY weekday_num;

-- 14. Income Group vs Order Frequency

SELECT 
  u.Monthly_Income, 
  COUNT(o.*) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.Monthly_Income
ORDER BY order_count DESC;