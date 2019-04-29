

DROP DATABASE IF EXISTS data;

CREATE DATABASE IF NOT EXISTS data;

USE data;

CREATE TABLE users (
Fname   varchar(30) NOT NULL,
Lname	varchar(30) NOT NULL,
dob 	DATE ,
phone 	varchar(15) NOT NULL,
email 	varchar(40) NOT NULL,
pass 	varchar(30) NOT NULL,
CONSTRAINT PK_USERS PRIMARY KEY(phone)
);




CREATE TABLE pic (
phone        varchar(15) NOT NULL,
img        varchar(100) NOT NULL,
CONSTRAINT PK_PIC PRIMARY KEY(img),
CONSTRAINT FK_PIC_USERS FOREIGN KEY (phone) REFERENCES users(phone)
);


INSERT INTO users (fname, lname, dob, phone, email, pass) 
	VALUES 
	("Mehmood", "Munir", '1999-03-03', '03359898989', "mehmood@yahoo.com", '121111');