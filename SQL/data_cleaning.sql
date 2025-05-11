-- 1. fixing currency issues
-- Finding entries with USD
SELECT * FROM orders
WHERE currency = 'USD';
-- fixing currency issues
-- 1 USD = 82.5 INR (approximately on entry day)
UPDATE orders
SET currency = 'INR',
    sales_amount = sales_amount * 82.5
WHERE currency = 'USD';
------------------------------------------------
-- 2. Clean the rating Column (Replace '--' and Blank With NULL)
UPDATE restaurant
SET rating = NULL
WHERE rating IS NULL OR rating IN ('--', '');
-- Convert rating to FLOAT
ALTER TABLE restaurant
ALTER COLUMN rating TYPE FLOAT
USING rating::FLOAT;
-----------------------------------------------
-- 3. price in menu table is in VARCHAR format. it will be converted to FLOAT.
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
-- Convert cost column to FLOAT
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