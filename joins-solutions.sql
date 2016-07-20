Tasks:
-- 1.  Get all customers and their addresses.
SELECT * FROM customers INNER JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM orders INNER JOIN line_items ON orders.id = line_items.order_id;

--3.  Which warehouses have cheetos?
SELECT * FROM products JOIN warehouse_product ON (products.description = 'cheetos' AND products.id = warehouse_product.product_id) JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id;

--OR

SELECT warehouse_id FROM warehouse_product INNER JOIN products ON warehouse_product.product_id = 5;


-- 4. Which warehouses have diet pepsi?

SELECT * FROM products JOIN warehouse_product ON (products.description = 'diet pepsi' AND products.id = warehouse_product.product_id) JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id;

 --OR See below to JUST return the list of warehouses

SELECT warehouse.warehouse FROM products JOIN warehouse_product ON (products.description = 'diet pepsi' AND products.id = warehouse_product.product_id) JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id;


--5.  Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT * FROM customers JOIN addresses ON (customers.id = addresses.customer_id) JOIN orders ON orders.address_id = addresses.id;

-- OR.. For a little LESS information:
SELECT customers.last_name, orders.total  FROM customers JOIN addresses ON (customers.id = addresses.customer_id) JOIN orders ON orders.address_id = addresses.id;

--Or to answer the question very specifically:
SELECT customers.last_name, count(orders.total)  FROM customers JOIN addresses ON (customers.id = addresses.customer_id) JOIN orders ON (orders.address_id = addresses.id) GROUP BY customers.last_name;




-- 6. How many customers do we have?

SELECT count(customers.id) FROM customers;

--Below could also work, but not as safe because there might be a deleted item in the table..
SELECT max(customers.id) FROM customers;


--7.  How many products do we carry?

SELECT count(products.id) FROM products;



-- 8.  What is the total available on-hand quantity of diet pepsi?
SELECT sum(on_hand) FROM products JOIN warehouse_product ON (products.description = 'diet pepsi' AND products.id = warehouse_product.product_id);
