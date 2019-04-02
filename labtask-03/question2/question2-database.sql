DROP DATABASE IF EXISTS;
CREATE DATABASE IF NOT EXISTS employee_data;
USE employee_data;

CREATE TABLE EMPLOYEE (
	EMP_ID 			varchar(10) 	NOT NULL,
	FIRSTNAME 		varchar(50) 	NOT NULL,
    LASTNAME 		varchar(50) 	NOT NULL,
    EMAIL 			varchar(20) 	NOT NULL,
    HIRE_DATE 		DATE 			NOT NULL,
    JOB_ID 			varchar(20) 	NOT NULL,
    SALARY			decimal(10) 	NOT NULL,
    MANAGER_ID 		varchar(10),
    DEPT_ID 		varchar(5)		NOT NULL,
    CONSTRAINT  PK_EMPLOYEE PRIMARY KEY(EMP_ID) 
);

