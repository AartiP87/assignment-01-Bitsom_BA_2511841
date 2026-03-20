-- Q1: List all customers from Mumbai along with their total order value
SELECT c.name, SUM(p.unit_price * oi.quantity) AS total_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE c.city = 'Mumbai'
GROUP BY c.name;

-- Q2: Find the top 3 products by total quantity sold
SELECT p.name, SUM(oi.quantity) AS total_qty
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_qty DESC
LIMIT 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT sr.name, COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Sales_Reps sr
JOIN Orders o ON sr.sales_rep_id = o.sales_rep_id
GROUP BY sr.name;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
SELECT o.order_id, SUM(p.unit_price * oi.quantity) AS order_value
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING order_value > 10000
ORDER BY order_value DESC;

-- Q5: Identify any products that have never been ordered
SELECT p.name
FROM Products p
LEFT JOIN Order_Items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
