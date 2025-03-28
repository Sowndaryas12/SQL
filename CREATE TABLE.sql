CREATE DATABASE Parks_and_Recreation;
USE Parks_and_Recreation;
 CREATE TABLE customers (
    customerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) DEFAULT '0000000000');
 
select * from customers; 
INSERT INTO customers (customerID, FirstName, LastName,Email, PhoneNumber)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '9874524534'),
(2, 'Jane', 'Smith', 'jame.smith@example.com','9764332510'),
(3, 'Emily', 'Jones', 'emily.jone@example.com','8754321890');
select * from customers; 
INSERT INTO customers (customerID, FirstName, LastName,Email)
VALUES
(4, 'John', 'Doe', 'john1.doe@example.com');
select * from customers; 
create table Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE DEFAULT (CURRENT_DATE),
    customerID INT,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    CONSTRAINT fk_customerID FOREIGN KEY (customerID)
      REFERENCES customers(customerID)
      );
Select * From Orders; 
INSERT INTO Orders (OrderID,customerID, Amount)
VALUES
      (1,  1, 250.75),
      (2,  2, 100.00),
      (3,  3, 300.50);
      
       Select * From Orders; 
	
     UPDATE customers
     SET Email = 'john.newemail@example.com', PhoneNumber = '1112223333'
     WHERE customerID = 1;
 SET SQL_SAFE_UPDATES = 0;
      

delete from Orders
where Amount = 300.50;
	Select * From Orders; 
    
    Alter table customers
    add Gender Varchar(10);
    select *from customers;
    
	Alter table customers
    drop Gender;
select *from customers;

Alter table customers
modify FirstName Varchar(20);

drop table Orders;
select * from Orders;

truncate customers;
select * from customers;

CREATE DATABASE SCHOOL;
USE SCHOOL;
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
BirthDate DATE NOT NULL,
Gender varchar (10), CHECK (Gender IN ('M', 'F')),
EnrollmentDate DATE DEFAULT (CURRENT_DATE)
);
 select * from Students;   
 INSERT INTO Students (StudentID,FirstName,LastName,BirthDate,Gender)
 values
  ( '112', 'Kavitha', 'Kumari', '1997-02-13', 'F'),
  ( '113', 'Harish', 'Raja', '1996-07-14', 'M'),
  ( '114', 'Krishna', 'Kumar', '1997-05-13', 'M'),
  ( '115', 'Kanagaraj', 'Selvan', '1995-09-15', 'M'),
  ( '116', 'Pragya', 'Maanasi', '1996-08-16', 'F');
  
 CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100) NOT NULL,
Credits INT CHECK (Credits Between 1 and 5),
Department VARCHAR (50) NOT NULL
);
Select * from Courses;
    
INSERT INTO Courses ( CourseID, CourseName, Credits, Department)
VALUES 
('123','Computer Application', '4', 'Computer Science'),
('134', 'Fashion Designing', '5', 'Home Science'),
('145', 'Food & Nutrition', '3', 'Home Science');

truncate Courses;
select * from Courses;

INSERT INTO Courses ( CourseID, CourseName, Credits, Department)
VALUES 
('123','Computer Application', '4', 'Computer Science'),
('134', 'Fashion Designing', '5', 'Home Science'),
('145', 'Food & Nutrition', '3', 'Home Science');
Select * from Courses;

CREATE TABLE Employes(
EmployeID INT PRIMARY KEY,
EmployeName VARCHAR(100) NOT NULL,
EmployeDepartment VARCHAR (50) NOT NULL
);    
select *from Employes;
 BEGIN;
 
 INSERT INTO Employes(Employeid, Employename, Employedepartment )values (1, 'Alice' , 'HR');
 INSERT INTO Employes (Employeid, Employename, Employedepartment ) values (2, 'Bob' , 'IT');
 
 COMMIT;
 select *from Employes;
 
  BEGIN;
 
 INSERT INTO Employes(Employeid, Employename, Employedepartment )values (3, 'Charlie' , 'Finance');
 INSERT INTO Employes (Employeid, Employename, Employedepartment ) values (4, 'Diana' , 'Markwting');
 
 ROLLBACK;
 
 CREATE DATABASE Employees;
USE Employees;

 
 select *from Employees;
 select *from Jobs;
 
 CREATE TABLE Jobs (
	job_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);
/*Data for the table jobs */

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);

select *from departments;
CREATE TABLE departments (
	department_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT (11) DEFAULT NULL,
FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);
/*Data for the table departments */

INSERT INTO departments(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) VALUES (11,'Accounting',1700);

 select *from employees;
CREATE TABLE employees (
	employee_id INT (11) AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT (11) NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT (11) DEFAULT NULL,
	department_id INT (11) DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);
/*Data for the table employees */

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

/*1.From the following table, write a SQL query to find those employees who receive a higher salary than the employee with ID 120. Return first name, last name.*/
select *from employees;
select*from Jobs;
select * from departments;

select first_name, last_name from employees
where salary > (select salary from Employees where employee_id = 120);

/*2. From the following table, write a SQL query to find out which employees have the same designation as the employee whose ID is 176. Return first name, last name, department ID and job ID.*/
select *from employees;
select*from Jobs;
select * from departments;

select first_name, last_name, department_id, job_id from employees
where job_id = (select job_id from employees where employee_id = 176);

/*3.From the following table, write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.*/
select *from employees;
select*from Jobs;
select * from departments;

select employee_id, first_name, last_name from employees
where salary > (select avg(salary) from employees);

/*4.  From the following table, write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.*/
select *from employees;
select*from Jobs;
select * from departments;

select * from employees
where salary = (select max(salary)from employees
where salary < (select max(salary) from employees)
);


/*5. From the following tables, write a SQL query to find those employees who earn more than the average salary and work in the same department 
as an employee whose first name contains the letter 'J'. Return employee ID, first name and salary.*/
select *from employees;
select*from Jobs;
select * from departments;

select employee_id, first_name, salary from employees
where salary > (select avg(salary) from employees)
and department_id in (select department_id from Employees
where first_name like '%%J%%');

/*6. From the following table, write a SQL query to search for employees who receive such a salary, which is the maximum salary for salaried employees,
 hired between January 1st, 2002 and December 31st, 2003. Return employee ID, first name, last name, salary, department name and city.*/
select *from employees;
select*from Jobs;
select * from departments;

select e.employee_id, e.first_name, e.last_name, e.salary, d.department_name from employees as e
inner join departments as d
on e.department_id = d.department_id
where e.salary = (select max(salary)FROM employees
where hire_date between '1997-01-01' and '2000-12-31');

/*7.  From the following table, write a SQL query to find those employees who earn more than the maximum salary for a department of ID 11.
 Return first name, last name and department ID.*/
select *from employees;
select*from Jobs;
select * from departments;

select first_name, last_name, department_id from employees
where salary > (select max(salary) from employees 
where department_id = 11);


/*8.  From the following table, write a SQL query to find those employees who earn more than the minimum salary of a department of ID 11. 
Return first name, last name, salary, and department ID.*/
select *from employees;
select*from Jobs;
select * from departments;

select first_name, last_name, salary, department_id from Employees
where salary > (select min(salary) from employees where department_id = 11);

/*9. From the following table, write a SQL query to find employees who have previously worked as 'Sales Representatives'. Return all the fields of jobs.*/
select *from employees;
select*from Jobs;
select * from departments;

select * from Jobs
where job_id in (select job_id from employees
where job_title = 'Sales Representative');

/*10.  From the following table, write a SQL query to find those employees who earn the second-lowest salary of all the employees. Return all the fields of employees.*/
select *from employees;
select*from Jobs;
select * from departments;

select * from employees
where salary = (select min(salary) from employees
where salary > (select min(salary) from employees));

CREATE DATABASE EmployeeDemographics ;
USE EmployeeDemographics ;

 
 /*Table 1 Query:*/
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
);

/*Table 1 Insert:*/
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

select * from EmployeeDemographics;

/*Table 2 Query:*/
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
);

/*Table 2 Insert:*/
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');
 
 select * from employee_Salary;
 INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);
  with CTE_Example as
  ( select gender,sum(salary), min(salary), max(salary), count(salary), avg(salary) as avg_salary
  from employeedemographics as dem
  join employeesalary as sal
  on dem.EmployeeID = sal.EmployeeID
 group by gender)
 select *,round(avg_salary,2) from CTE_Example;
 
 select * from employee_demographics ;
 select * from EmployeeSalary;
 
  select gender, birth_date,salary
  from employee_demographics  as dem
  join employee_Salary as sal
  on dem.employee_id = sal.employee_id
 where birth_date> '1985-01-011' and salary >= 50000;
 
 with CTE_Example as 
 (select employee_id,gender,birth_date from employee_demographics as dem
 where birth_date > '1985-01-01'),
 CTE_Example2 as
 (select employee_id,salary from employee_salary as sal
 where salary >= 50000)
 select* from CTE_Example as cte1
 join CTE_Example2 as cte2
 on cte1.employee_id= cte2.employee_id;
 
/* 1.find out the birth_date from 1987-01-01 and also find salary greater than 40000*/
 with CTE_Example as 
 (select employee_id,gender,birth_date from employee_demographics as dem
 where birth_date > '1987-01-01'),
 CTE_Example2 as
 (select employee_id,salary from employee_salary as sal
 where salary >= 40000)
 select* from CTE_Example as cte1
 join CTE_Example2 as cte2
 on cte1.employee_id= cte2.employee_id;
 
 /* 2.find out the first name of gender(female) where salary greater than 70000*/
  with CTE_Example as 
 (select employee_id,first_name,gender,birth_date from employee_demographics as dem
 where gender = 'Female'),
 CTE_Example2 as
 (select employee_id,salary from employee_salary as sal
 where salary >= 70000)
 select* from CTE_Example as cte1
 join CTE_Example2 as cte2
 on cte1.employee_id= cte2.employee_id;
 
 /* 3.find out the first name of gender(male) where salary greater than 40000*/
  with CTE_Example as 
 (select employee_id,first_name,gender,birth_date from employee_demographics as dem
 where gender = 'Male'),
 CTE_Example2 as
 (select employee_id,salary from employee_salary as sal
 where salary >= 40000)
 select* from CTE_Example as cte1
 join CTE_Example2 as cte2
 on cte1.employee_id= cte2.employee_id;
 
 /* 4. find out the first name,gender & age start from 40 where salary greater than 40000*/
  with CTE_Example as 
 (select employee_id,first_name,age,gender,birth_date from employee_demographics as dem
 where age >=40 ),
 CTE_Example2 as
 (select employee_id,salary from employee_salary as sal
 where salary > 40000)
 select* from CTE_Example as cte1
 join CTE_Example2 as cte2
 on cte1.employee_id= cte2.employee_id;
 
 select * from employee_demographics ;
 select * from employee_Salary;
 
 select * from employee_salary
 where salary >= 60000;
 
 create procedure large_salaries()
 select * from employee_salary
 where salary >= 60000;
 call large_salaries();
 
 /*same*/
create procedure large_salaries1()
 select * from employee_salary
 where salary >= 60000;
 call large_salaries1();
  
create procedure large_salaries2()
 select * from employee_salary
 where salary >= 60000;
 select * from employee_salary
 where salary >= 50000;
 
 call large_salaries2(); 
 
 DELIMITER $$
 create procedure large_salaries3()
 begin
 select * from employee_salary
 where salary >= 60000;
 select * from employee_salary
 where salary >= 50000;
 End $$ 
 
 call large_salaries3(); 
 
/* using from the table*/
 call large_salaries5(); 
 
 call employee_sal(1);
 call employee_sal(2);