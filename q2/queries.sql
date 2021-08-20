-- 1. I want to know the list of our customers and their spending.

SELECT customer.customer_id, customer.name, customer.phone, sum(car.price) "Spending" FROM customer LEFT JOIN transaction ON customer.customer_id = transaction.customer_id LEFT JOIN car ON car.serial_number = transaction.serial_number GROUP BY customer.customer_id, customer.name, customer.phone;

-- 2. I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.

SELECT manufacturer_name, count(transaction_id) AS "Sales (Quantity)", sum(price) AS "Sales (Number)", count(transaction_id) * sum(price) AS total_sales
FROM manufacturer INNER JOIN car on manufacturer.manufacturer_id = car.manufacturer_id INNER JOIN transaction ON car.serial_number = transaction.serial_number WHERE date_part('month', transaction.date_time) = date_part('month', CURRENT_DATE) GROUP BY manufacturer_name ORDER BY total_sales DESC LIMIT 2;