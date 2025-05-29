-- 1. In `orders` table some input under `currency` column is in USD. It has to be converted to INR.
SELECT * FROM orders
WHERE currency = 'USD';
-- Also, 'sales_amount` corresponding to those 'currency' has to be converted accordingly. Here, 1 USD = 82.5 INR (approximately on entry day) is used.
UPDATE orders
SET currency = 'INR',
    sales_amount = sales_amount * 82.5
WHERE currency = 'USD';
------------------------------------------------
-- 2. There are some blank entries in 'rating' column. Also, there are some '--' entries which also mean blank entries. Both these need to be converted as null.
UPDATE restaurant
SET rating = NULL
WHERE rating IS NULL OR rating IN ('--', '');
-- The 'rating' column is in 'TEXT' format. It should be converted to 'FLOAT' for consistency and further calculation.
ALTER TABLE restaurant
ALTER COLUMN rating TYPE FLOAT
USING rating::FLOAT;
-----------------------------------------------
-- 3. `price` in menu table is in VARCHAR format. It will be converted to FLOAT.
-- First add a temporary float column (if needed)
ALTER TABLE menu ADD COLUMN price_clean FLOAT;
-- Update the new column with converted float values
UPDATE menu
SET price_clean = CAST(REGEXP_REPLACE(price, '[^0-9.]', '', 'g') AS FLOAT);
-- Optionally drop old column and rename
ALTER TABLE menu DROP COLUMN price;
ALTER TABLE menu RENAME COLUMN price_clean TO price;
-----------------------------------------------------------------------------
-- 4. Find menu.r_id entries not in restaurant.id:
SELECT *
FROM menu
WHERE r_id NOT IN (
    SELECT id FROM restaurant
);
-- 273 entries found.
-- Delete rows from menu where r_id is not in restaurant.id:
DELETE FROM menu
WHERE r_id NOT IN (
    SELECT id FROM restaurant
);
-------------------------------------------------------------
-- 5. Keep only the numeric value in the cost column of the restaurant table
-- Remove all characters except digits and the decimal point.
UPDATE restaurant
SET cost = REGEXP_REPLACE(cost, '[^0-9.]', '', 'g');
-- Convert 'cost' column from VARCHAR to FLOAT
ALTER TABLE restaurant
ALTER COLUMN cost TYPE FLOAT
USING cost::FLOAT;
-----------------------------------------------------------
-- 6. Query to find NULL entries in name column
SELECT *
FROM restaurant
WHERE name IS NULL;
-- 86 entries found.
-- Retrieve name from link column
UPDATE restaurant
SET name = INITCAP(
    split_part(SPLIT_PART(link, '/restaurants/', 2), '-', 1) || ' ' ||
    split_part(SPLIT_PART(link, '/restaurants/', 2), '-', 2) || ' ' ||
    split_part(SPLIT_PART(link, '/restaurants/', 2), '-', 3) || ' ' ||
    split_part(SPLIT_PART(link, '/restaurants/', 2), '-', 4)
)
WHERE name IS NULL
  AND link IS NOT NULL;
------------------------------------------------------------------------
