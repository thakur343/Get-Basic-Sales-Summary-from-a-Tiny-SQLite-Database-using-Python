-- Step 1: Create sales table
CREATE TABLE IF NOT EXISTS sales (
    id SERIAL PRIMARY KEY,       -- SQLite me use karo: INTEGER PRIMARY KEY AUTOINCREMENT
    product TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    price REAL NOT NULL
);

-- Step 2: Insert some sample data
INSERT INTO sales (product, quantity, price) VALUES
('Apple', 10, 2.0),
('Banana', 5, 1.5),
('Orange', 7, 2.5),
('Apple', 3, 2.0),
('Banana', 8, 1.5),
('Orange', 2, 2.5);

-- Step 3: Get sales summary (total quantity and revenue)
SELECT 
    product,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_revenue
FROM sales
GROUP BY product;
