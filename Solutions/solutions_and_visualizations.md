# Q1: What are the top 10 restaurants by total sales amount?

## Solution
```SQL
SELECT r.name, SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN restaurant r ON o.r_id = r.id
GROUP BY r.name
ORDER BY total_sales DESC
LIMIT 10;
```
## Output
|name                            |total_sales|
|--------------------------------|-----------|
|Domino's Pizza                  |5025266    |
|Kouzina Kafe - The Food Court   |1958408    |
|Sweet Truth - Cake and Desserts |1952881    |
|Pizza Hut                       |1787100    |
|Huber & Holly                   |1668292    |
|Biryani House                   |1655736    |
|Baskin Robbins                  |1627731    |
|KFC                             |1605569    |
|McCafe by McDonald's            |1541849    |
|Janta Snacks                    |1510944    |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_1.png?raw=true)

# Q2: What is the average rating and total rating count for restaurants in the top 20 cities?
# Q3: What are the monthly order trends based on order volume over time?
# Q4: What are the top 5 most popular cuisines by order volume?
# Q5:What is the distribution of vegetarian vs non-vegetarian items ordered?
# Q6: What are the top 20 cities by the number of restaurants?
# Q7: How do different user demographics correlate with average order value?
# Q8: Who are the top 15 highest-spending users?
# Q9: What are the top 15 cuisines with the highest average menu prices?
# Q10: Which restaurants offer the most diverse menu, based on the number of unique cuisines and dishes available?
# Q11: What are the most ordered food items across all restaurants?
# Q12: How does spending behavior differ between genders?
# Q13: On which days of the week do restaurants experience peak order volumes?
# Q14: How does order frequency vary across different income groups?
