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
![Dashboard](?raw=true)

# Q3: What are the monthly order trends based on order volume over time?

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
## Output

## Visualization
![Dashboard](?raw=true)

# Q4: What are the top 5 most popular cuisines by order volume?

## Solution
```SQL

```
## Output

## Visualization
![Dashboard](?raw=true)

# Q5:What is the distribution of vegetarian vs non-vegetarian items ordered?

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

