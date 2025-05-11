-- Introduce Foreign key for menu table

-- Add foreign key for r_id referencing restaurant(id):

ALTER TABLE menu
ADD CONSTRAINT menu_r_id_fkey
FOREIGN KEY (r_id) REFERENCES restaurant(id);

-- Add foreign key for f_id referencing food(f_id):

ALTER TABLE menu
ADD CONSTRAINT menu_f_id_fkey
FOREIGN KEY (f_id) REFERENCES food(f_id);
-----------------------------------------------------
-- Add Foreign Key Constraints to orders

ALTER TABLE orders
ADD CONSTRAINT orders_user_id_fkey
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE orders
ADD CONSTRAINT orders_r_id_fkey
FOREIGN KEY (r_id) REFERENCES restaurant(id);
-----------------------------------------------------------------