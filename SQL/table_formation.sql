-- Drop tables if they exist
DROP TABLE IF EXISTS orders, menu, food, restaurant, users;

-- 1. food.csv
CREATE TABLE food (
    unnamed INT,                         -- Row index
    f_id VARCHAR PRIMARY KEY,            -- Unique food item ID
    item VARCHAR,                        -- Name of the food item
    veg_or_non_veg VARCHAR               -- veg or non-veg (varchar, not binary)
);

-- 2. restaurant.csv
CREATE TABLE restaurant (
    unnamed INT,                         -- Index
    id INT PRIMARY KEY,                  -- Unique restaurant ID
    name VARCHAR,                        -- Restaurant name
    city VARCHAR,                        -- City
    rating TEXT,                         -- Average rating; will be changed to FLOAT after data loading 
    rating_count VARCHAR,                -- Rating count (kept as varchar)
    cost VARCHAR,                        -- Average cost per person (varchar)
    cuisine VARCHAR,                     -- Cuisine offered
    lic_no VARCHAR,                      -- License number
    link TEXT,                           -- Website link
    address TEXT,                        -- Restaurant address
    menu TEXT                            -- Link of menu in JSON format
);

-- 3. users.csv
CREATE TABLE users (
    unnamed INT,                         -- Index
    user_id INT PRIMARY KEY,             -- Unique user ID
    name VARCHAR,                        -- Name
    email VARCHAR,                       -- Email
    password VARCHAR,                    -- Encrypted password
    Age INT,                             -- Age
    Gender VARCHAR,                      -- Gender
    Marital_Status VARCHAR,              -- Marital status
    Occupation VARCHAR,                  -- Occupation
    Monthly_Income VARCHAR,              -- Monthly income (varchar)
    Educational_Qualifications VARCHAR,  -- Education
    Family_size INT                      -- Family size
);

-- 4. menu.csv
CREATE TABLE menu (
    unnamed INT,                         -- Index
    menu_id VARCHAR,                     -- menu ID
    r_id INT,                            -- Foreign key to restaurant(id)
    f_id VARCHAR,                        -- Foreign key to food(f_id)
    cuisine VARCHAR,                     -- Cuisine type
    price VARCHAR,                       -- VARCHAR for now; will be changed to FLOAT later
    PRIMARY KEY (unnamed, menu_id)
);

-- 5. orders.csv
CREATE TABLE orders (
    unnamed INT,                         -- Index
    order_date DATE,                     -- Order date (YYYY-MM-DD)
    sales_qty INT,                       -- Quantity ordered
    sales_amount FLOAT,                  -- Total amount
    currency VARCHAR,                    -- Currency (e.g., INR, USD)
    user_id INT,                         -- Foreign key to users(user_id)
    r_id INT                             -- Restaurant ID (float in source)
    
);

--------------------------------------------------------------
