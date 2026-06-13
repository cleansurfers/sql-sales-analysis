-- we want to calculate total number of customers
SELECT COUNT(*) AS total_customers FROM Customers;

-- we want to calculate total revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

-- we want to extract best-selling product
SELECT p.name, SUM(o.quantity) AS total_sold
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 1;

-- we want to extract revenue by city
SELECT c.city, SUM(p.price * o.quantity) AS revenue
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue DESC;

-- we want to calculate daily sales
SELECT order_date, SUM(quantity) AS total_items_sold
FROM Orders
GROUP BY order_date
ORDER BY order_date;