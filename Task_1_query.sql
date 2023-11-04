-- Task 1

-- Write a SQL query to retrieve all the customer information along with the total number of orders placed by each customer. Display the result in descending order of the number of orders.

SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email,
    c.location,
    COUNT(o.order_id) AS total_orders
FROM
    customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id
ORDER BY
    total_orders DESC;
    