
-- query 1
SELECT employees.employee_id, employees.salary
	FROM employees
	WHERE employees.salary = (SELECT MAX(output.sal) FROM 
								(SELECT employees.salary sal FROM employees) output);




-- query 2
SELECT employees.employee_id, CONCAT(employees.first_name," ",employees.last_name) fullname, employees.salary
	FROM employees
	WHERE employees.salary = (SELECT MAX(output.sal) FROM 
								(SELECT employees.salary sal FROM employees 
									INNER JOIN jobs ON employees.job_id = jobs.job_id 
									WHERE jobs.job_title LIKE "%CLERK") output);





-- query 3
SELECT employees.employee_id, CONCAT(employees.first_name," ",employees.last_name) fullname, employees.salary
	FROM employees 
	INNER JOIN jobs ON employees.job_id = jobs.job_id
	WHERE employees.salary > (SELECT MAX(output.sal) FROM 
								(SELECT employees.salary sal FROM employees 
									INNER JOIN jobs ON employees.job_id = jobs.job_id 
									WHERE jobs.job_title LIKE "%CLERK") output)
	AND jobs.job_title = 'Accountant';




-- query 4
SELECT employees.employee_id, CONCAT(employees.first_name," ",employees.last_name) fullname, employees.salary
	FROM employees 
	INNER JOIN jobs ON employees.job_id = jobs.job_id
	WHERE employees.salary > (SELECT MAX(output.sal) FROM 
								(SELECT employees.salary sal FROM employees 
									INNER JOIN jobs ON employees.job_id = jobs.job_id 
									WHERE jobs.job_title LIKE "Programmer") output)
	AND jobs.job_title = '%CLERK';



-- query 5
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname, employees.salary
	FROM employees 
	WHERE employees.salary > (SELECT employees.salary FROM employees WHERE employees.first_name = "Lisa")
	OR employees.salary > (SELECT employees.salary FROM employees WHERE employees.first_name = "Peter" AND employees.last_name = "Tucker");


-- query 6
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname, employees.department_id, employees.salary
	FROM employees
	INNER JOIN (SELECT AVG(employees.salary) sal, employees.department_id d_id FROM employees GROUP BY employees.department_id) output ON output.d_id = employees.department_id
	WHERE employees.salary > output.sal;




-- query 7
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname, employees.department_id, employees.salary
	FROM employees
	INNER JOIN (SELECT MAX(employees.salary) sal, employees.department_id d_id FROM employees GROUP BY employees.department_id) output ON output.d_id = employees.department_id
	WHERE employees.salary = output.sal;



-- query 8
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname
	FROM employees
	WHERE employees.department_id = 20
	AND employees.department_id = (SELECT DISTINCT employees.department_id 
										FROM employees 
										INNER JOIN departments ON departments.department_id = employees.department_id 
										WHERE departments.department_name = "Shipping") ;

-- query 9 
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname, employees.salary, employees.job_id
	FROM employees
	INNER JOIN (SELECT MAX(employees.salary) sal, employees.job_id j_id 
					FROM employees GROUP BY employees.job_id) output ON output.j_id = employees.job_id
	WHERE employees.salary = output.sal;



-- query 10
SELECT *
	FROM (SELECT * FROM employees
	WHERE employees.department_id = 20) output1
	INNER JOIN 
	(SELECT * FROM employees 
	WHERE employees.department_id = 30) output2
	ON output1.job_id = output2.job_id;



-- query 11
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname
	FROM employees
	INNER JOIN departments ON employees.department_id = departments.department_id
	WHERE department_name = "Finance";




-- query 12
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname
	FROM employees 
	WHERE employees.salary > (SELECT MAX(output1.sal) FROM 
								(SELECT employees.salary sal FROM employees 
									WHERE department_id = 20) output1)
	OR employees.salary > (SELECT MAX(output2.sal) FROM 
								(SELECT employees.salary sal FROM employees 
									WHERE department_id = 30) output2);



-- query 13
SELECT CONCAT(employees.first_name," ",employees.last_name) fullname
	FROM ((employees
	INNER JOIN departments ON employees.department_id = departments.department_id) 
	INNER JOIN locations ON departments.location_id = locations.location_id)
	WHERE locations.city = "Sydney";




-- query 14
SELECT DISTINCT CONCAT(output2.first_name," ",output2.last_name) fullname
	FROM (SELECT job_id j_id FROM employees
	INNER JOIN departments ON employees.department_id = departments.department_id
	WHERE departments.department_name = "Development") output1
	INNER JOIN (SELECT * FROM employees	
	WHERE employees.department_id = 10) output2
	ON output1.j_id = output2.job_id;


-- query 15
SELECT job_id, SUM(employees.salary) salry
	FROM employees
	GROUP BY job_id
	HAVING salry > (SELECT MAX(output.sal) FROM 
								(SELECT employees.salary sal FROM employees 
									INNER JOIN jobs ON employees.job_id = jobs.job_id 
									WHERE jobs.job_title LIKE "%Manager") output);




-- query 16
SELECT employees.department_id, employees.salary sal
	FROM employees
	INNER JOIN (SELECT MAX(employees.salary) s, employees.department_id
				FROM employees
				GROUP BY employees.department_id ) output
	ON output.department_id = employees.department_id
	WHERE salary > 9000
	AND salary = output.s;






-- query 17
SELECT employees.department_id, employees.salary sal
	FROM employees
	INNER JOIN (SELECT MIN(employees.salary) s, employees.department_id
				FROM employees
				GROUP BY employees.department_id ) output
	ON output.department_id = employees.department_id
	WHERE employees.department_id = 10
	AND salary > output.s;






-- query 19
SELECT DISTINCT CONCAT(employees.first_name," ",employees.last_name) fullname, job_id, city, department_name
	FROM ((employees
	INNER JOIN  departments ON employees.department_id = departments.department_id) 
	INNER JOIN locations ON locations.location_id = departments.location_id);





-- query 21
SELECT departments.department_name, output.member
	FROM departments 
	INNER JOIN (SELECT COUNT(employees.employee_id) member, employees.department_id
					FROM employees
					GROUP BY employees.department_id) output
	ON departments.department_id = output.department_id
	WHERE output.member > 2; 