DROP DATABASE IF EXISTS pharma;
CREATE DATABASE IF NOT EXISTS pharma;
USE pharma;



CREATE TABLE suppliers (
		s_id 					INT 	 		NOT NULL,
		s_name 					varchar(25)		NOT NULL,
		contact 				varchar(12)		NOT NULL,
		city					varchar(20)		NOT NULL,
		CONSTRAINT PK_suppliers PRIMARY KEY(s_id)
);



CREATE TABLE orders (
		order_id 			INT		 			NOT NULL,
		customer_name		varchar(25)			NOT NULL,
		order_date 			DATE 				NOT NULL,
		CONSTRAINT PK_orders PRIMARY KEY(order_id)
);


CREATE TABLE order_detail (
		p_id 			INT 					NOT NULL,
		order_id 		INT						NOT NULL,
		unit_purchased	INT 					NOT NULL,
		CONSTRAINT PK_order_detail PRIMARY KEY(p_id, order_id)
);


CREATE TABLE products (
		p_id 			INT						NOT NULL,
		p_name 			varchar(25)				NOT NULL,
		units			INT						NOT NULL,
		unit_price		INT 					NOT NULL,
		type 			varchar(10)				NOT NULL,
		s_id 			INT 					NOT NULL,
		CONSTRAINT PK_products PRIMARY KEY(p_id),
		CONSTRAINT FK_products_suppliers FOREIGN KEY(s_id) references suppliers(s_id) ON DELETE CASCADE 
);