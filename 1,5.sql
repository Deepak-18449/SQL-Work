use sakila;

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);


INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;

select sum(amount) as total_sales 
from sales;

select sum(amount) as Mobile_total_sales 
from sales 
where product='mobile';

-- 1
select sum(amount) as Ml_total_sales ,
       avg(amount) as Ml_avger
from sales
where region='north' and (product='mobile' or product='laptop');


-- 2
SELECT 
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM sales
WHERE MONTH(sale_date) = 2 ;-- AND YEAR(sale_date) = 2025;

-- assment
-- 1
SELECT region, 
		SUM(amount) AS total_sales
FROM sales
GROUP BY region;
-- 2
SELECT sales_person, ROUND(AVG(amount), 2) AS avg_sales
FROM sales
GROUP BY sales_person;
-- 3
SELECT product,
       SUM(amount) AS total_amount,
       COUNT(*) AS total_sales
FROM sales
WHERE sales_person <> 'Amit'
GROUP BY product;
-- 4
SELECT sales_person, COUNT(*) AS sales_count
FROM sales
WHERE amount > 10000
GROUP BY sales_person;
-- 5
SELECT sales_person, COUNT(*) AS transactions_count
FROM sales
WHERE DAY(sale_date) BETWEEN 1 AND 7
GROUP BY sales_person;
-- 6
SELECT region,
       product,
       SUM(amount) AS total_sales,
       ROUND(AVG(amount), 2) AS avg_sales,
       MAX(amount) AS max_sale
FROM sales
GROUP BY region, product;
-- 7
SELECT product,
       COUNT(*) AS total_sales_count,
       SUM(amount) AS total_amount
FROM sales
where COUNT(*) > 13
GROUP BY product;

-- 2-5-26
SELECT product, SUM(amount) 
FROM sales 
GROUP BY product 
HAVING SUM(amount) > 250000;


SELECT sales_person, COUNT(*) AS sales_count
FROM sales
GROUP BY sales_person
having count(*)>50;

SELECT region, SUM(amount)
FROM sales
GROUP BY region
HAVING COUNT(*) > 9;


SELECT sales_person, COUNT(*) AS total_transactions
FROM sales
GROUP BY sales_person
HAVING  count(*)  > 50
ORDER BY total_transactions DESC;

SELECT sales_person, product, COUNT(amount)
FROM sales
GROUP BY sales_person, product;

select year (payment_date), month (payment_date) , sum(amount)
from payment 
group by year (payment_date), month (payment_date);



