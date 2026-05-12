use sakila;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(20),
    Category VARCHAR(50),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);



INSERT INTO Orders (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from orders;
-- level 1
-- 1
SELECT Category, SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY Category
order by TotalRevenue desc;

-- 2
SELECT Category, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Category
order by TotalOrders desc;       


-- 3
SELECT Category, MAX(OrderValue) AS MaxOrderValue
FROM Orders
GROUP BY Category
order by maxordervalue desc;

-- level 2
-- 1
SELECT DISTINCT Category
FROM Orders;


-- 2
SELECT DISTINCT CustomerID
FROM Orders;

-- 3
SELECT DISTINCT CustomerID, Category
FROM Orders
ORDER BY CustomerID, Category desc;

-- Level 3
-- 1
SELECT CustomerID, Category,
       SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY CustomerID, Category
order by CustomerID, Category desc;

-- 2
SELECT CustomerID, Category,
       COUNT(*) AS OrdersCount
FROM Orders
GROUP BY CustomerID, Category
order by CustomerID, Category desc;

-- 3
SELECT Category,
       DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
       SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY Category, Month
ORDER BY month,category desc;

-- Level 4
-- 1
SELECT Category,
       SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY Category
HAVING SUM(OrderValue) > 20000;

-- 2
SELECT CustomerID,
       COUNT(*) AS OrdersCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- 3
SELECT CustomerID, Category,
       SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY CustomerID, Category
HAVING SUM(OrderValue) > 10000
order by totalRevenue desc ;


-- Level 5
-- 1
SELECT Category,
		count(orderid) as totalorder,
       SUM(OrderValue) AS TotalRevenue,
       AVG(OrderValue) AS AvgOrderValue
FROM Orders
GROUP BY Category
HAVING AVG(OrderValue) > 5000
ORDER BY TotalRevenue DESC;

-- 2
SELECT CustomerID,
       COUNT(*) AS OrdersCount,
       AVG(OrderValue) AS AvgOrderValue,
       SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 1 AND AVG(OrderValue) > 6000
ORDER BY TotalRevenue DESC;

-- 3
SELECT Category,
       DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
       COUNT(*) AS OrdersCount,
       SUM(OrderValue) AS TotalRevenue
FROM Orders
GROUP BY Category, Month
HAVING COUNT(*) >= 2
ORDER BY Month, TotalRevenue DESC;







