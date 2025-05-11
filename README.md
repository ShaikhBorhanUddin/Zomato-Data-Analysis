# Zomato-Data-Analysis
![Dashboard](https://github.com/ShaikhBorhanUddin/Zomato-Data-Analysis/blob/main/Images/title.png?raw=true)

## 📌 Project Overview

## 📦 Dataset, Visualization & Data Cleaning

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
├── Solutions/                                  # Details solutions, outputs with corresponding visualizations
├── Requirements.txt                            # Project requirements
├── README.md                                   # Overvier of the project
└── Licence                                     # Licence details
```
## 🔄 Workflow

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

## 📊 Tableau Visualization

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

