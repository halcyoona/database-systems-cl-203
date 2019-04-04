INSERT INTO suppliers 
	(s_id, s_name, contact, city)
	VALUES 
	(320,'Munir Brothers','0313-1231234', "Karachi"),
	(312,'Alliance Pharmaceuticals','0313-7654321', "Peshawar"),
	(478,'Abbot Pharmaceuticals','0313-7234214', "Lahore"),
	(657,'Sanofi Aventis','0310-7654321', "Islamabad"),
	(987,'Ferozsons LABS','0313-7658321', "Peshawar");


INSERT INTO products
	(p_id, p_name, units, unit_price, type, s_id) 
	VALUES 
	(1005,'Ponstan',100,15,'Tablets', 312),
	(1421,'Brufen',25,35,'Syrup', 657),
	(3215,'Avil',122,26,'Syrup', 478),
	(1215,'Flagyl',42,30,'Tablets', 987),
	(7513,'Avil',140,20,'Injection', 478),
	(1216,'Flagyl',10,35,'Syrup', 987),
	(1007,'Disprin',98,15,'Tablets', 320);


INSERT INTO orders 
	(order_id, customer_name, order_date)
	VALUES 
	(22, 'Waleed Ali', '2014-11-25'),
	(23, 'Azhar Akbar', '2014-02-12'),
	(24, 'Shahzeb Khan', '2014-05-12'),
	(25, 'Javed Iqbal', '2015-01-15'),
	(26, 'Tariq Khan', '2015-06-23');


INSERT INTO order_detail
	(p_id, order_id, unit_purchased) 
	VALUES 
	(1007,22, 5),
	(1216,22, 1),
	(1005,22, 4),
	(1421,23, 1),
	(1005,23, 1),
	(3215,23, 2),
	(7513,23, 3),
	(1421,24, 2),
	(1215,24, 1),
	(1005,25, 5),
	(1215,26, 1),
	(1421,26, 3);