use sakila;

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    category VARCHAR(30) NOT NULL,
    product VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL
);

-- Insert sample data (15 rows)
INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1, 55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3, 1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2, 18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4, 3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1, 22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2, 4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1, 8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5, 2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2, 3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1, 15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1, 25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3, 1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2, 6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3, 2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2, 9500, '2024-02-25');

select * from orders;


-- Q1. Orders per city
SELECT city, COUNT(*) AS total_orders
FROM orders
GROUP BY city
ORDER BY city ASC;

-- Q2. Total revenue per category
SELECT category, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY category
ORDER BY total_revenue DESC;

-- Q3. Orders per category
SELECT category, COUNT(*) AS order_count
FROM orders
GROUP BY category
ORDER BY category ASC;

-- Q4. Average price per city
SELECT city, ROUND(AVG(price), 2) AS avg_price
FROM orders
GROUP BY city
ORDER BY city ASC;

-- Q5. Maximum price per category
SELECT category, MAX(price) AS max_price
FROM orders
GROUP BY category
ORDER BY category ASC;

-- Q6. Minimum price per city
SELECT city, MIN(price) AS min_price
FROM orders
GROUP BY city
ORDER BY city ASC;

-- Q7. Total quantity per category
SELECT category, SUM(quantity) AS total_qty
FROM orders
GROUP BY category
ORDER BY total_qty DESC;

-- Q8. Total items per city
SELECT city, SUM(quantity) AS total_items
FROM orders
GROUP BY city
ORDER BY total_items DESC, city ASC;

-- Q9. Cities with more than 3 orders
SELECT city, COUNT(*) AS order_count
FROM orders
GROUP BY city
HAVING COUNT(*) > 3
ORDER BY order_count DESC;

-- Q10. Categories with revenue > 50000
SELECT category, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY category
HAVING SUM(price * quantity) > 50000
ORDER BY total_revenue DESC;

-- Q11. Cities with avg order price > 10000
SELECT city, ROUND(AVG(price), 2) AS avg_price
FROM orders
GROUP BY city
HAVING AVG(price) > 10000
ORDER BY avg_price DESC;

-- Q12. Revenue per city (Electronics only)
SELECT city, SUM(price * quantity) AS total_revenue
FROM orders
WHERE category = 'Electronics'
GROUP BY city
ORDER BY total_revenue DESC;

-- Q13. Categories with total quantity > 8
SELECT category, SUM(quantity) AS total_qty
FROM orders
GROUP BY category
HAVING SUM(quantity) > 8
ORDER BY total_qty DESC;

-- Q14. Distinct cities per category
SELECT category, COUNT(DISTINCT city) AS city_count
FROM orders
GROUP BY category
ORDER BY category ASC;

-- Q15. Cities with min order price < 2000
SELECT city, MIN(price) AS min_price
FROM orders
GROUP BY city
HAVING MIN(price) < 2000
ORDER BY min_price ASC;

-- Q16. Cities with revenue between 30000 and 100000
SELECT city, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY city
HAVING SUM(price * quantity) BETWEEN 30000 AND 100000
ORDER BY total_revenue DESC;

-- Q17. City + Category combinations with revenue > 20000
SELECT city, category, SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY city, category
HAVING SUM(price * quantity) > 20000
ORDER BY total_revenue DESC;


