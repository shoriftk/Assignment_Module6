-- Task 2

-- Write a SQL query to retrieve the product name, quantity, and total amount for each order item. Display the result in ascending order of the order ID.

SELECT
    o.order_id,
    p.name AS product_name,
    oi.quantity,
    ROUND(oi.quantity * oi.unit_price, 2) AS total_amount
FROM
    order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN products p ON oi.product_id = p.product_id
ORDER BY
    o.order_id ASC;
