DROP DATABASE IF EXISTS data;

CREATE DATABASE IF NOT EXISTS data;


use data;

CREATE TABLE users(
	user_id 	INT AUTO_INCREMENT PRIMARY KEY,
	username 	VARCHAR(50) NOT NULL,
	password 	VARCHAR(50) NOT NULL,
	email 		VARCHAR(50) NOT NULL
);

CREATE TABLE summary(
	id  		INT AUTO_INCREMENT PRIMARY KEY,
	total_users	INT NOT NULL,
	yahoo 		INT,
	hotmail		INT,
	gmail 		INT
);

INSERT INTO users(username, password, email) VALUES ('mehmood', '12345','mehmood@yahoo.com');
INSERT INTO users(username, password, email) VALUES ('hussain', '12345','hussain@gmail.com');
INSERT INTO summary(total_users, yahoo, hotmail, gmail) VALUES (2, 1, 0, 1);



-- Qeustion 1

DELIMITER $$
CREATE PROCEDURE update_user_password(IN uname VARCHAR(50), IN pass VARCHAR(50), OUT uemail VARCHAR(50))
BEGIN
UPDATE users
SET password = pass
WHERE username = uname;
SELECT email INTO uemail FROM users
WHERE username = uname; 
END$$

<?php
    $name = 'mehmood';
    $pass = '123456';
    $email= '';
    $qry = "CALL update_password('".$name."', '".$pass."','".$email."')";
    if ($con->query($qry)) 
        echo "Password Updated. Email is :".$email;
    else
        echo "Error"
?>




-- Question 2

DELIMITER $$
CREATE PROCEDURE add_user(IN uname VARCHAR(50), IN pass VARCHAR(50), IN uemail VARCHAR(50))
BEGIN
INSERT INTO users (username, password, email) VALUES (uname, pass, uemail);
END$$

DELIMITER ;



DELIMITER $$
CREATE PROCEDURE count_user(OUT total_user INT, OUT hotmail_user INT, OUT yahoo_user INT, OUT gmail_user INT)
BEGIN
SELECT COUNT(user_id) INTO total_user FROM users;

SELECT COUNT(user_id) INTO yahoo_user FROM users
WHERE email LIKE "%yahoo.com";

SELECT COUNT(user_id) INTO gmail_user FROM users
WHERE email LIKE "%gmail.com";

SELECT COUNT(user_id) INTO hotmail_user FROM users
WHERE email LIKE "%hotmail.com";
END$$

DELIMITER ;




DELIMITER $$
CREATE TRIGGER update_summary_insert
	AFTER INSERT ON users
	FOR EACH ROW
	BEGIN
	DECLARE total_user integer;
	DECLARE yahoo_user integer;
	DECLARE gmail_user integer;
	DECLARE hotmail_user integer; 
	CALL count_user( total_user, hotmail_user, yahoo_user, gmail_user);
	UPDATE summary
	SET total_users = total_user,
	hotmail = hotmail_user,
	gmail = gmail_user,
	yahoo = yahoo_user
	LIMIT 1;
	END $$


CREATE TRIGGER update_summary_update
	AFTER UPDATE ON users
	FOR EACH ROW
	BEGIN
	DECLARE total_user integer;
	DECLARE yahoo_user integer;
	DECLARE gmail_user integer;
	DECLARE hotmail_user integer; 
	CALL count_user( total_user, hotmail_user, yahoo_user, gmail_user);
	UPDATE summary
	SET total_users = total_user,
	hotmail = hotmail_user,
	gmail = gmail_user,
	yahoo = yahoo_user
	LIMIT 1;
	END $$


CREATE TRIGGER update_summary_delete
	AFTER DELETE ON users
	FOR EACH ROW
	BEGIN
	DECLARE total_user integer;
	DECLARE yahoo_user integer;
	DECLARE gmail_user integer;
	DECLARE hotmail_user integer; 
	CALL count_user( total_user, hotmail_user, yahoo_user, gmail_user);
	UPDATE summary
	SET total_users = total_user,
	hotmail = hotmail_user,
	gmail = gmail_user,
	yahoo = yahoo_user
	LIMIT 1;
	END $$

DELIMITER ;


CALL add_user("Hassaan", "11234","hassaan@hotmail.com");
SELECT * FROM summary;
CALL add_user("ali", "11234","ali@yahoo.com");
SELECT * FROM summary;
CALL add_user("abdullah", "11234","abdullah@hotmail.com");
SELECT * FROM summary;
CALL add_user("raza", "11234","raza@gmail.com");
SELECT * FROM summary;
CALL add_user("asad", "11234","asad@gmail.com");
SELECT * FROM summary;
CALL add_user("fatima", "11234","fatima@gmail.com");
SELECT * FROM summary;
CALL add_user("rabia", "1234","rabia@yahoo.com");
SELECT * FROM summary;
CALL add_user("noor", "11234","noot@gmail.com");
SELECT * FROM summary;