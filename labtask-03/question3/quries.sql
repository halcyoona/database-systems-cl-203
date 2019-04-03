-- query 1
SELECT CategoryName, `Order Details`.OrderID, `Order Details`.UnitPrice, `Order Details`.Quantity, `Order Details`.Discount 
	FROM ((Categories
	INNER JOIN Products ON  Categories.CategoryID = Products.CategoryID)
	INNER JOIN `Order Details` ON `Order Details`.ProductID = Products.ProductID)
	WHERE CategoryName = "Beverages";


-- query 2
SELECT ProductName,  Count(`Order Details`.OrderID) Total_Orders
	FROM Products 
	INNER JOIN `Order Details` ON `Order Details`.ProductID = Products.ProductID
	GROUP BY ProductName; 


-- query 3
SELECT CONCAT(FirstName," ",LastName) AS Name
	FROM Employees
	INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
	WHERE Employees.City = Orders.ShipCity;


-- query 4
SELECT CONCAT(FirstName," ",LastName) AS Name
	FROM Employees
	INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
	WHERE Employees.City != Orders.ShipCity;


-- query 5
SELECT CategoryName, Customers.CompanyName 
	FROM ((((Categories
	INNER JOIN Products ON  Categories.CategoryID = Products.CategoryID)
	INNER JOIN `Order Details` ON `Order Details`.ProductID = Products.ProductID)
	INNER JOIN Orders ON `Order Details`.OrderID = Orders.OrderID)
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
	WHERE CategoryName = "Seafood";

-- query 6
SELECT CategoryName, COUNT(Orders.OrderID) Total_Orders, Employees.Country 
	FROM ((((Categories
	INNER JOIN Products ON  Categories.CategoryID = Products.CategoryID)
	INNER JOIN `Order Details` ON `Order Details`.ProductID = Products.ProductID)
	INNER JOIN Orders ON `Order Details`.OrderID = Orders.OrderID)
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
	WHERE Employees.Country = "USA"
	GROUP BY CategoryName;


-- query 7
SELECT SUM(`Order Details`.UnitPrice * `Order Details`.Quantity) SubTotal, `Order Details`.OrderID
	FROM `Order Details`
	GROUP BY `Order Details`.OrderID;


-- query 8
SELECT SUM(`Order Details`.UnitPrice * `Order Details`.Quantity) Total, Orders.EmployeeID
	FROM ((`Order Details`
	INNER JOIN Orders ON Orders.OrderID = `Order Details`.OrderID)
	INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID) 
	GROUP BY Orders.EmployeeID;



-- query 9
SELECT CategoryName, Products.ProductName, Suppliers.CompanyName 
	FROM ((Categories
	INNER JOIN Products ON  Categories.CategoryID = Products.CategoryID)
	INNER JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID)
	ORDER BY Products.ProductName;



-- query 10
SELECT CategoryName, COUNT(Products.ProductName) Total_Products
	FROM (Categories
	INNER JOIN Products ON  Categories.CategoryID = Products.CategoryID)
	GROUP BY CategoryName;

