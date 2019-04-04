--query 1
SELECT orders.order_id, orders.customer_name, orders.order_date
	FROM ((orders 
	INNER JOIN order_detail ON orders.order_id = order_detail.order_id)
	INNER JOIN products On products.p_id = order_detail.p_id)
	WHERE p_name = "Flagyl";



-- query 2
SELECT *
	FROM ((orders 
	INNER JOIN order_detail ON orders.order_id = order_detail.order_id)
	INNER JOIN products On products.p_id = order_detail.p_id)
	WHERE customer_name = "Javed Iqbal";



-- query 3
SELECT COUNT(products.p_id) total_product, suppliers.s_id, suppliers.s_name
	FROM (products
	INNER JOIN suppliers ON products.s_id = suppliers.s_id)
	GROUP BY suppliers.s_id
	HAVING suppliers.s_name = "Munir Brothers";


-- query 4
DELETE FROM products
	WHERE p_name = "Avil";

-- query 5
SELECT products.p_name Product, suppliers.s_name Supplier
	FROM products
	INNER JOIN suppliers ON suppliers.s_id = products.s_id
	WHERE suppliers.city = "Peshawar";


-- query 6
SELECT COUNT(products.p_id) Products , suppliers.s_name Supplier  
	FROM products
	INNER JOIN suppliers ON suppliers.s_id = products.s_id
	WHERE suppliers.s_name = "Sanofi Aventis";