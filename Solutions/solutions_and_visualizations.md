# Q1: What are the top 10 restaurants by total sales amount?

Identifying the top 10 restaurants by total sales amount is vital for business analytics as it highlights the highest revenue-generating outlets, offering insights into what drives their success—be it location, pricing, menu offerings, or customer satisfaction. This information enables businesses to replicate winning strategies across other branches, allocate resources more effectively, prioritize marketing and investment efforts, and refine operational decisions such as staffing and inventory management. Understanding these top performers serves as a benchmark for evaluating other restaurants and guiding strategic growth initiatives.
## Solution
```SQL
SELECT r.name, SUM(o.sales_amount) AS total_sales
FROM orders o
JOIN restaurant r ON o.r_id = r.id
GROUP BY r.name
ORDER BY total_sales DESC
LIMIT 10;
```
This SQL query retrieves the top 10 restaurants by total sales amount. It joins the orders table (o) with the restaurant table (r) using the common key r_id (restaurant ID). For each restaurant (r.name), it calculates the total sales amount by summing the sales_amount from the orders table. The results are grouped by restaurant name to aggregate sales per restaurant, sorted in descending order of total_sales, and the top 10 records are returned. This helps identify which restaurants have generated the highest revenue.

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

Analyzing the average rating and rating count by city is important for business analytics because it helps identify regional performance trends and customer satisfaction levels across different locations. Cities with high average ratings and large rating counts likely reflect strong customer loyalty, positive dining experiences, and brand trust—making them valuable benchmarks for other branches. Conversely, cities with low ratings or low engagement signal areas needing improvement in service quality, food, or ambiance. This insight guides targeted interventions, resource allocation, marketing strategies, and strategic decisions such as expanding in high-performing regions or improving operations in underperforming ones.

## Solution
```SQL
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
This SQL query retrieves the top 20 cities based on average restaurant ratings. It works by grouping data from the restaurant table by city, calculating the average rating per city while excluding any null ratings. Since the rating_count column contains qualitative labels (e.g., "Too Few Ratings", "20+ ratings"), the query estimates a numeric value for each label using a CASE statement—assigning approximate values like 10, 25, 55, and 110 to represent the respective ranges. The average of these estimated values is then computed as avg_rating_count_est for each city. Finally, the cities are ordered by descending avg_rating, and only the top 20 cities are returned. This query helps compare cities not just by average rating but also by estimated customer engagement levels.

## Output
|city                            |avg_rating          |avg_rating_count_est  |
|--------------------------------|--------------------|----------------------|
|Chopda                          |4.825               |25.0000000000000000   |
|Kumta                           |4.8                 |55.0000000000000000   |
|Kadayanallur                    |4.525               |25.0000000000000000   |
|Dhanbad                         |4.4                 |55.0000000000000000   |
|Kidderpore,Kolkata              |4.340000000000001   |65.0000000000000000   |
|Fatehgarh-sahib                 |4.339999999999999   |42.0000000000000000   |
|Thiruvalla                      |4.25                |55.0000000000000000   |
|Mylapore,Chennai                |4.2276595744680865  |72.6973684210526316   |
|South Kolkata,Kolkata           |4.2237918215613375  |73.7614678899082569   |
|Frazer Town,Bangalore           |4.219512195121951   |71.0714285714285714   |
|Adyar,Chennai                   |4.218141592920354   |75.2777777777777778   |
|Mahalaxmi Malabar Hill,Mumbai   |4.213207547169811   |64.1584158415841584   |
|Bandra West,Mumbai              |4.20484693877551    |64.7814207650273224   |
|Majestic,Bangalore              |4.202173913043478   |56.2500000000000000   |
|Jagdalpur                       |4.2                 |40.0000000000000000   |
|Budhwal                         |4.2                 |25.0000000000000000   |
|LalDarwaja,Ahmedabad            |4.2                 |110.0000000000000000  |
|Burrabazar,Kolkata              |4.194871794871796   |71.9444444444444444   |
|Central Bangalore,Bangalore     |4.18981818181818    |68.1526104417670683   |
|Nungambakkam,Chennai            |4.189534883720927   |66.8531468531468531   |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_2.png?raw=true)

# Q3: What are the monthly order trends based on order volume over time?

Understanding monthly order trends based on order volume over time is crucial for gaining insights into customer demand patterns and seasonality. By analyzing how the number of orders fluctuates month by month, businesses can identify high-performing periods that may align with holidays, promotions, or weather conditions, and also pinpoint low-demand months that may require marketing boosts or cost-saving strategies. This knowledge enables more accurate sales forecasting, optimized inventory management, and strategic planning for staffing, promotions, and resource allocation—all aimed at maximizing operational efficiency and customer satisfaction.

## Solution
```SQL
SELECT month, total_orders
FROM (
    SELECT 
        TO_CHAR(DATE_TRUNC('month', order_date), 'YYYY-MON') AS month,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
) AS sub
ORDER BY TO_DATE(month, 'YYYY-MON');
```
This SQL query calculates the monthly order trends by counting the total number of orders placed in each month. It first truncates the order_date to the first day of each month and formats it as 'YYYY-MON' to create a readable label for each month. Then, it groups the data by these month labels and counts the number of orders in each group. Finally, it orders the results chronologically by converting the formatted month strings back into date objects using TO_DATE. This allows businesses to observe how order volumes change over time, identify seasonal patterns, and make informed decisions related to marketing, inventory, and staffing based on fluctuations in customer demand.

## Output
|month   |total_orders|
|--------|------------|
|2017-OCT|4293        |
|2017-NOV|5500        |
|2017-DEC|4975        |
|2018-JAN|5320        |
|2018-FEB|5024        |
|2018-MAR|5238        |
|2018-APR|5120        |
|2018-MAY|5279        |
|2018-JUN|5534        |
|2018-JUL|5405        |
|2018-AUG|5379        |
|2018-SEP|4873        |
|2018-OCT|5171        |
|2018-NOV|4905        |
|2018-DEC|4293        |
|2019-JAN|4691        |
|2019-FEB|4630        |
|2019-MAR|4664        |
|2019-APR|4447        |
|2019-MAY|4740        |
|2019-JUN|4385        |
|2019-JUL|4958        |
|2019-AUG|4091        |
|2019-SEP|4142        |
|2019-OCT|4299        |
|2019-NOV|3944        |
|2019-DEC|3431        |
|2020-JAN|4003        |
|2020-FEB|4031        |
|2020-MAR|3583        |
|2020-APR|3621        |
|2020-MAY|3565        |
|2020-JUN|2747        |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_3.png?raw=true)

# Q4: What are the top 5 most popular cuisines by order volume?

Identifying the top 5 most popular cuisines by order volume is vital for understanding customer food preferences and market demand. This insight helps restaurants and food delivery platforms tailor their offerings by prioritizing high-demand cuisines, which can boost customer satisfaction and revenue. It also supports menu optimization, strategic partnerships with specific cuisine-focused vendors, and the design of targeted marketing campaigns. Furthermore, understanding cuisine popularity trends over time can inform expansion decisions, such as opening new branches or launching virtual brands that specialize in trending food categories.

## Solution
```SQL
SELECT m.cuisine, COUNT(o.*) AS order_count
FROM orders o
JOIN menu m ON o.r_id = m.r_id
GROUP BY m.cuisine
ORDER BY order_count DESC
LIMIT 5;
```
This SQL query retrieves the top 5 cuisines with the highest number of orders from the database. It joins the "orders" table (aliased as "o") with the "menu" table (aliased as "m") using the "r_id" field, which is common to both tables. The query then counts the number of orders for each cuisine, grouping the results by the "cuisine" field from the "menu" table. The results are ordered in descending order based on the count of orders, ensuring that the cuisines with the most orders appear first. Finally, the "LIMIT 5" clause restricts the output to only the top 5 cuisines.

## Output
|cuisine               |order_count|
|----------------------|-----------|
|North Indian,Chinese  |83443      |
|Indian,Chinese        |63225      |
|North Indian          |45671      |
|Indian                |43938      |
|Chinese,North Indian  |26935      |

## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/Viz_4.png?raw=true)

# Q5: What is the distribution of vegetarian vs non-vegetarian items ordered?

This query is essential in the context of business intelligence because it provides valuable insight into customer dietary preferences by analyzing the demand for vegetarian versus non-vegetarian items. Understanding this distribution helps restaurant managers and business stakeholders make data-driven decisions regarding menu planning, inventory management, and marketing strategies. For instance, if vegetarian items are significantly more popular, the business might expand its vegetarian offerings or create promotions targeting health-conscious or vegetarian customers. Conversely, if non-vegetarian items dominate, the restaurant may focus on sourcing quality meat products or introducing premium non-veg dishes. Ultimately, this insight enables the business to align its offerings with customer behavior, optimize costs, and enhance customer satisfaction.

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q6: What are the top 20 cities by the number of restaurants?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q7: How do different user demographics correlate with average order value?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q8: Who are the top 15 highest-spending users?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q9: What are the top 15 cuisines with the highest average menu prices?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q10: Which restaurants offer the most diverse menu, based on the number of unique cuisines and dishes available?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q11: What are the most ordered food items across all restaurants?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q12: How does spending behavior differ between genders?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q13: On which days of the week do restaurants experience peak order volumes?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q14: How does order frequency vary across different income groups?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

