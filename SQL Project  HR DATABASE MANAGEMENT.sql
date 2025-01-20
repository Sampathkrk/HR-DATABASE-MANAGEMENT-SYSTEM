CREATE TABLE regions ( 
region_id INT PRIMARY KEY, 
region_name VARCHAR (25) DEFAULT NULL 
); 

CREATE TABLE countries ( 
country_id CHAR (2) PRIMARY KEY, 
country_name VARCHAR (40) DEFAULT NULL, 
region_id INT NOT NULL, 
FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE 
CASCADE ON UPDATE CASCADE 
); 

CREATE TABLE locations ( 
location_id INT PRIMARY KEY, 
street_address VARCHAR (40) DEFAULT NULL, 
postal_code VARCHAR (12) DEFAULT NULL, 
city VARCHAR (30) NOT NULL, 
state_province VARCHAR (25) DEFAULT NULL, 
country_id CHAR (2) NOT NULL, 
FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE 
CASCADE ON UPDATE CASCADE 
); 

CREATE TABLE jobs ( 
job_id INT PRIMARY KEY, 
job_title VARCHAR (35) NOT NULL, 
min_salary DECIMAL (8, 2) DEFAULT NULL, 
max_salary DECIMAL (8, 2) DEFAULT NULL 
); 

CREATE TABLE departments ( 
department_id INT PRIMARY KEY, 
department_name VARCHAR (30) NOT NULL, 
location_id INT DEFAULT NULL, 
FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE 
CASCADE ON UPDATE CASCADE 
); 

CREATE TABLE employees ( 
employee_id INT PRIMARY KEY, 
first_name VARCHAR (20) DEFAULT NULL, 
last_name VARCHAR (25) NOT NULL, 
email VARCHAR (100) NOT NULL, 
phone_number VARCHAR (20) DEFAULT NULL, 
hire_date DATE NOT NULL, 
job_id INT NOT NULL, 
salary DECIMAL (8, 2) NOT NULL, 
manager_id INT DEFAULT NULL, 
department_id INT DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON 
UPDATE CASCADE, 
FOREIGN KEY (department_id) REFERENCES departments (department_id) ON 
DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (manager_id) REFERENCES employees (employee_id) 
) ;

CREATE TABLE dependents ( 
dependent_id INT PRIMARY KEY, 
first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (50) NOT NULL, 
relationship VARCHAR (25) NOT NULL, 
employee_id INT NOT NULL, 
FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE 
CASCADE ON UPDATE CASCADE 
);

/*Data for the table regions */ 
INSERT INTO regions(region_id,region_name)  
VALUES (1,'Europe'); 
INSERT INTO regions(region_id,region_name)  
VALUES (2,'Americas'); 
INSERT INTO regions(region_id,region_name)  
VALUES (3,'Asia'); 
INSERT INTO regions(region_id,region_name)  
VALUES (4,'Middle East and Africa');

/*Data for the table countries */ 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('AR','Argentina',2); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('AU','Australia',3); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('BE','Belgium',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BR','Brazil',2); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('CA','Canada',2); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('CH','Switzerland',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('CN','China',3); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('DE','Germany',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('DK','Denmark',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('EG','Egypt',4); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('FR','France',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('HK','HongKong',3); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IL','Israel',4); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('IN','India',3); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IT','Italy',1); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('JP','Japan',3); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('KW','Kuwait',4); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('MX','Mexico',2); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('NG','Nigeria',4); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('NL','Netherlands',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('SG','Singapore',3); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('UK','United Kingdom',1); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('US','United States of America',2); 
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZM','Zambia',4); 
INSERT INTO countries(country_id,country_name,region_id)  
VALUES ('ZW','Zimbabwe',4);

/*Data for the table locations */ 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)  
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)  
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)  
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'); 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

/*Data for the table jobs */ 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (1,'Public Accountant',4200.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (2,'Accounting Manager',8200.00,16000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (3,'Administration Assistant',3000.00,6000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (4,'President',20000.00,40000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (5,'Administration Vice President',15000.00,30000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (6,'Accountant',4200.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (7,'Finance Manager',8200.00,16000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (8,'Human Resources Representative',4000.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (9,'Programmer',4000.00,10000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (10,'Marketing Manager',9000.00,15000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (11,'Marketing Representative',4000.00,9000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (12,'Public Relations Representative',4500.00,10500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (13,'Purchasing Clerk',2500.00,5500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (14,'Purchasing Manager',8000.00,15000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (15,'Sales Manager',10000.00,20000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (16,'Sales Representative',6000.00,12000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (17,'Shipping Clerk',2500.00,5500.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (18,'Stock Clerk',2000.00,5000.00); 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)  
VALUES (19,'Stock Manager',5500.00,8500.00);

/*Data for the table departments */ 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (1,'Administration',1700); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (2,'Marketing',1800); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (3,'Purchasing',1700); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (4,'Human Resources',2400); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (5,'Shipping',1500); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (6,'IT',1400); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (7,'Public Relations',2700); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (8,'Sales',2500); 
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (9,'Executive',1700); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (10,'Finance',1700); 
INSERT INTO departments(department_id,department_name,location_id)  
VALUES (11,'Accounting',1700);

/* Data for the table employees */
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES 
(100, 'Steven', 'King', 'steven.king@sqltutorial.org', '515.123.4567', '1987-06-17', 4, 24000.00, NULL, 9),
(101, 'Neena', 'Kochhar', 'neena.kochhar@sqltutorial.org', '515.123.4568', '1989-09-21', 5, 17000.00, 100, 9),
(102, 'Lex', 'De Haan', 'lex.dehaan@sqltutorial.org', '515.123.4569', '1993-01-13', 5, 17000.00, 100, 9),
(103, 'Alexander', 'Hunold', 'alexander.hunold@sqltutorial.org', '590.423.4567', '1990-01-03', 9, 9000.00, 102, 6),
(104, 'Bruce', 'Ernst', 'bruce.ernst@sqltutorial.org', '590.423.4568', '1991-05-21', 9, 6000.00, 103, 6),
(105, 'David', 'Austin', 'david.austin@sqltutorial.org', '590.423.4569', '1997-06-25', 9, 4800.00, 103, 6),
(106, 'Valli', 'Pataballa', 'valli.pataballa@sqltutorial.org', '590.423.4560', '1998-02-05', 9, 4800.00, 103, 6),
(107, 'Diana', 'Lorentz', 'diana.lorentz@sqltutorial.org', '590.423.5567', '1999-02-07', 9, 4200.00, 103, 6),
(108, 'Nancy', 'Greenberg', 'nancy.greenberg@sqltutorial.org', '515.124.4569', '1994-08-17', 7, 12000.00, 101, 10),
(109, 'Daniel', 'Faviet', 'daniel.faviet@sqltutorial.org', '515.124.4169', '1994-08-16', 6, 9000.00, 108, 10),
(110, 'John', 'Chen', 'john.chen@sqltutorial.org', '515.124.4269', '1997-09-28', 6, 8200.00, 108, 10),
(111, 'Ismael', 'Sciarra', 'ismael.sciarra@sqltutorial.org', '515.124.4369', '1997-09-30', 6, 7700.00, 108, 10),
(112, 'Jose Manuel', 'Urman', 'josemanuel.urman@sqltutorial.org', '515.124.4469', '1998-03-07', 6, 7800.00, 108, 10),
(113, 'Luis', 'Popp', 'luis.popp@sqltutorial.org', '515.124.4567', '1999-12-07', 6, 6900.00, 108, 10),
(114, 'Den', 'Raphaely', 'den.raphaely@sqltutorial.org', '515.127.4561', '1994-12-07', 14, 11000.00, 100, 3),
(115, 'Alexander', 'Khoo', 'alexander.khoo@sqltutorial.org', '515.127.4562', '1995-05-18', 13, 3100.00, 114, 3),
(116, 'Shelli', 'Baida', 'shelli.baida@sqltutorial.org', '515.127.4563', '1997-12-24', 13, 2900.00, 114, 3),
(117, 'Sigal', 'Tobias', 'sigal.tobias@sqltutorial.org', '515.127.4564', '1997-07-24', 13, 2800.00, 114, 3),
(118, 'Guy', 'Himuro', 'guy.himuro@sqltutorial.org', '515.127.4565', '1998-11-15', 13, 2600.00, 114, 3),
(119, 'Karen', 'Colmenares', 'karen.colmenares@sqltutorial.org', '515.127.4566', '1999-08-10', 13, 2500.00, 114, 3),
(120, 'Matthew', 'Weiss', 'matthew.weiss@sqltutorial.org', '650.123.1234', '1996-07-18', 19, 8000.00, 100, 5),
(121, 'Adam', 'Fripp', 'adam.fripp@sqltutorial.org', '650.123.2234', '1997-04-10', 19, 8200.00, 100, 5),
(122, 'Payam', 'Kaufling', 'payam.kaufling@sqltutorial.org', '650.123.3234', '1995-05-01', 19, 7900.00, 100, 5),
(123, 'Shanta', 'Vollman', 'shanta.vollman@sqltutorial.org', '650.123.4234', '1997-10-10', 19, 6500.00, 100, 5),
(126, 'Irene', 'Mikkilineni', 'irene.mikkilineni@sqltutorial.org', '650.124.1224', '1998-09-28', 18, 2700.00, 120, 5),
(145, 'John', 'Russell', 'john.russell@sqltutorial.org', NULL, '1996-10-01', 15, 14000.00, 100, 8),
(146, 'Karen', 'Partners', 'karen.partners@sqltutorial.org', NULL, '1997-01-05', 15, 13500.00, 100, 8),
(176, 'Jonathon', 'Taylor', 'jonathon.taylor@sqltutorial.org', NULL, '1998-03-24', 16, 8600.00, 100, 8),
(177, 'Jack', 'Livingston', 'jack.livingston@sqltutorial.org', NULL, '1998-04-23', 16, 8400.00, 100, 8),
(178, 'Kimberely', 'Grant', 'kimberely.grant@sqltutorial.org', NULL, '1999-05-24', 16, 7000.00, 100, 8),
(179, 'Charles', 'Johnson', 'charles.johnson@sqltutorial.org', NULL, '2000-01-04', 16, 6200.00, 100, 8),
(192, 'Sarah', 'Bell', 'sarah.bell@sqltutorial.org', '650.501.1876', '1996-02-04', 17, 4000.00, 123, 5),
(193, 'Britney', 'Everett', 'britney.everett@sqltutorial.org', '650.501.2876', '1997-03-03', 17, 3900.00, 123, 5),
(200, 'Jennifer', 'Whalen', 'jennifer.whalen@sqltutorial.org', '515.123.4444', '1987-09-17', 3, 4400.00, 101, 1),
(201, 'Michael', 'Hartstein', 'michael.hartstein@sqltutorial.org', '515.123.5555', '1996-02-17', 10, 13000.00, 100, 2),
(202, 'Pat', 'Fay', 'pat.fay@sqltutorial.org', '603.123.6666', '1997-08-17', 11, 6000.00, 201, 2),
(203, 'Susan', 'Mavris', 'susan.mavris@sqltutorial.org', '515.123.7777', '1994-06-07', 8, 6500.00, 101, 4),
(204, 'Hermann', 'Baer', 'hermann.baer@sqltutorial.org', '515.123.8888', '1994-06-07', 12, 10000.00, 101, 7),
(205, 'Shelley', 'Higgins', 'shelley.higgins@sqltutorial.org', '515.123.8080', '1994-06-07', 2, 12000.00, 101, 11);

/*Data for the table dependents */ 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (1,'Penelope','Gietz','Child',206); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (2,'Nick','Higgins','Child',205); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (3,'Ed','Whalen','Child',200); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (4,'Jennifer','King','Child',100); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (5,'Johnny','Kochhar','Child',101); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (6,'Bette','De Haan','Child',102); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (7,'Grace','Faviet','Child',109); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (8,'Matthew','Chen','Child',110); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (9,'Joe','Sciarra','Child',111); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (10,'Christian','Urman','Child',112); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (11,'Zero','Popp','Child',113); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (12,'Karl','Greenberg','Child',108); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (13,'Uma','Mavris','Child',203); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (14,'Vivien','Hunold','Child',103); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (15,'Cuba','Ernst','Child',104); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (16,'Fred','Austin','Child',105); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (17,'Helen','Pataballa','Child',106); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (18,'Dan','Lorentz','Child',107); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (19,'Bob','Hartstein','Child',201); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (20,'Lucille','Fay','Child',202); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (21,'Kirsten','Baer','Child',204); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (22,'Elvis','Khoo','Child',115); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (23,'Sandra','Baida','Child',116); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (24,'Cameron','Tobias','Child',117); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (25,'Kevin','Himuro','Child',118); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (26,'Rip','Colmenares','Child',119); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (27,'Julia','Raphaely','Child',114); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (28,'Woody','Russell','Child',145); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (29,'Alec','Partners','Child',146); 
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)  
VALUES (30,'Sandra','Taylor','Child',176);

--Task1
--a
SELECT * 
FROM employees;
--b
SELECT employee_id, first_name, last_name, hire_date 
FROM employees;
--c
SELECT first_name, last_name, salary, New_SALARY 
FROM employees;
--d
SELECT first_name, last_name, salary, salary * 2 AS new_salary
FROM employees;
--2
--a
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees;
--b
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY first_name ASC;
--c
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY first_name ASC, last_name DESC;
--d
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY salary DESC;
--e
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY hire_date ASC;
--f
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees
ORDER BY hire_date DESC;
--a
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC;
--b
SELECT DISTINCT salary
FROM employees;
--c
SELECT DISTINCT job_id, salary
FROM employees;
--d
SELECT DISTINCT job_id, salary
FROM employees;
--e
SELECT DISTINCT phone_number
FROM employees;
--4
--a
SELECT  * 
FROM employees
ORDER BY first_name;
--b
SELECT TOP 5 * 
FROM employees
ORDER BY employee_id;
--c
SELECT * 
FROM employees
ORDER BY employee_id
OFFSET 3 ROWS 
FETCH NEXT 5 ROWS ONLY;
--d
SELECT TOP 5 * 
FROM employees
ORDER BY salary DESC;
--e
WITH RankedSalaries AS (
SELECT *, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees
)
SELECT * 
FROM RankedSalaries
WHERE row_num = 2;
--5
-- A
SELECT * 
FROM employees 
WHERE salary > 14000
ORDER BY salary DESC;
-- B. 
SELECT * 
FROM employees 
WHERE department_id = 5;
-- C 
SELECT * 
FROM employees 
WHERE last_name = 'Chen';
-- D
SELECT * 
FROM employees 
WHERE hire_date > '1999-01-01';
-- E
SELECT * 
FROM employees 
WHERE YEAR(hire_date) = 1999;
-- F
SELECT * 
FROM employees 
WHERE last_name = 'Himuro';
-- G
SELECT * 
FROM employees 
WHERE last_name LIKE '%Himuro%';
-- H
SELECT * 
FROM employees 
WHERE phone_number IS NULL;
-- I
SELECT * 
FROM employees 
WHERE department_id != 8;
-- J.
SELECT * 
FROM employees 
WHERE department_id NOT IN (8, 10);
-- K
SELECT * 
FROM employees 
WHERE salary > 10000;
-- L
SELECT * 
FROM employees 
WHERE department_id = 8 AND salary > 10000;
-- M
SELECT * 
FROM employees 
WHERE salary < 10000;
-- N
SELECT * 
FROM employees 
WHERE salary >= 9000;
-- O
SELECT * 
FROM employees 
WHERE salary <= 9000;
--6

CREATE TABLE courses (
 course_id INT PRIMARY KEY,
 course_name VARCHAR(100)
);

-- A
ALTER TABLE courses
ADD credit_hours INT;
-- B
ALTER TABLE courses
ADD fee DECIMAL(10, 2), max_limit INT;
-- C.
ALTER TABLE courses
ALTER COLUMN fee DECIMAL(10, 2) NOT NULL;
-- D
ALTER TABLE courses
DROP COLUMN fee;
-- E
ALTER TABLE courses
DROP COLUMN max_limit, credit_hours;

--SQL FOREIGN KEY constraint 
CREATE  TABLE  projects ( 
project_id  INT  PRIMARY KEY, 
project_name  VARCHAR(255), 
start_date  DATE  NOT NULL, 
end_date  DATE  NOT NULL 
); 

CREATE  TABLE  project_milestones( 
milestone_id  INT  PRIMARY KEY, 
project_id   INT, 
milestone_name VARCHAR(100) 
);

--A
CREATE TABLE project_milestones (
milestone_id INT PRIMARY KEY,
project_id INT,
milestone_name VARCHAR(100),
FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

--B
ALTER TABLE project_milestones
ADD CONSTRAINT fk_project
FOREIGN KEY (project_id) REFERENCES projects(project_id);

--Task-2
--part-1
-- A
SELECT * 
FROM employees
WHERE salary > 5000 AND salary < 7000
-- B. 
SELECT * 
FROM employees
WHERE salary IN (7000, 8000)
-- C. 
SELECT * 
FROM employees
WHERE phone_number IS NULL
-- D.
SELECT * 
FROM employees
WHERE salary BETWEEN 9000 AND 12000
-- E. 
SELECT * 
FROM employees
WHERE department_id IN (8, 9)
-- F.
SELECT * 
FROM employees
WHERE first_name LIKE 'jo%'
-- G. 
SELECT * 
FROM employees
WHERE first_name LIKE '_h%'
-- H. 
SELECT * 
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 8);
--part2
-- A. 
SELECT * 
FROM employees
WHERE salary > ALL (SELECT AVG(salary) FROM employees GROUP BY department_id)
-- B. 
SELECT * 
FROM employees
WHERE employee_id IN (SELECT employee_id FROM dependents)
-- C. 
SELECT * 
FROM employees
WHERE salary BETWEEN 2500 AND 2900
-- D. 
SELECT * 
FROM employees
WHERE salary NOT BETWEEN 2500 AND 2900
-- E. 
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31'
-- F. 
SELECT * 
FROM employees
WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31'
-- G. 
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1993-12-31';
--Part3
-- A. 
SELECT * 
FROM employees
WHERE first_name LIKE 'Da%'
-- B. 
SELECT * 
FROM employees
WHERE first_name LIKE '%er'
-- C. 
SELECT * 
FROM employees
WHERE last_name LIKE '%an%'
-- D. 
SELECT * 
FROM employees
WHERE first_name LIKE 'Jo%' AND LEN(first_name) <= 4
-- E. 
SELECT * 
FROM employees
WHERE first_name LIKE '%_' 
-- F. 
SELECT * 
FROM employees
WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%';
--Part-4
-- A. 
SELECT * 
FROM employees
WHERE department_id = 5
-- B. 
SELECT * 
FROM employees
WHERE department_id = 5 AND salary <= 5000
-- C. 
SELECT * 
FROM employees
WHERE department_id NOT IN (1, 2, 3)
-- D. 
SELECT * 
FROM employees
WHERE first_name NOT LIKE 'D%'
-- E. 
SELECT * 
FROM employees
WHERE salary NOT BETWEEN 1000 AND 5000;
--Part5
-- A. 
SELECT * 
FROM employees
WHERE employee_id NOT IN (SELECT employee_id FROM dependents);
-- B. 
SELECT * 
FROM employees
WHERE phone_number IS NULL;
-- C.
SELECT * 
FROM employees
WHERE phone_number IS NOT NULL;

--Task3
-- A. 
SELECT country_name 
FROM countries
WHERE country_id IN ('US', 'UK', 'CN') ;
-- B. 
SELECT * 
FROM locations
WHERE country_id IN ('US', 'UK', 'CN') ;
-- C. 
SELECT countries.country_name, locations.city, locations.street_address
FROM countries
JOIN locations ON countries.country_id = locations.country_id ;
-- D. 
SELECT country_name
FROM countries
WHERE country_id NOT IN (SELECT DISTINCT country_id FROM locations) ;
--E
SELECT regions.region_name, countries.country_name, locations.city, locations.street_address
FROM regions
JOIN countries ON regions.region_id = countries.region_id
JOIN locations ON countries.country_id = locations.country_id;
--F
SELECT e1.employee_id AS Employee_ID, e1.first_name AS Employee_First_Name, e1.last_name AS Employee_Last_Name,
       e2.employee_id AS Manager_ID, e2.first_name AS Manager_First_Name, e2.last_name AS Manager_Last_Name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

--SQL FULL OUTER JOIN 
CREATE  TABLE  fruits ( 
fruit_id  INT PRIMARY KEY, 
fruit_name  VARCHAR (255) NOT NULL, 
basket_id  INTEGER 
); 
CREATE TABLE baskets ( 
basket_id  INT PRIMARY KEY, 
basket_name  VARCHAR (255) NOT NULL 
);


INSERT  INTO  baskets  (basket_id, basket_name) 
VALUES 
(1, 'A'), 
(2, 'B'), 
(3, 'C'); 
INSERT  INTO  fruits ( 
fruit_id, 
fruit_name, 
basket_id 
) 
VALUES 
(1, 'Apple', 1), 
(2, 'Orange', 1), 
(3, 'Banana', 2), 
(4, 'Strawberry', NULL);

-- A. 
SELECT f.fruit_name, b.basket_id
FROM fruits  f
FULL OUTER JOIN basketS  b
ON f.fruit_id = b.basket_id
FULL OUTER JOIN baskets  
ON b.basket_id = b.basket_id;
-- B. 
SELECT b.* 
FROM baskets AS b
WHERE b.basket_id NOT IN (SELECT DISTINCT b.basket_id FROM basketS );
-- C. 
SELECT f.* 
FROM fruits AS f
WHERE f.fruit_id NOT IN (SELECT DISTINCT f.fruit_id FROM basketS );

--CROSS JOIN
CREATE  TABLE  sales_organization ( 
sales_org_id  INT PRIMARY KEY, 
sales_org  VARCHAR (255) 
); 
CREATE  TABLE  sales_channel ( 
channel_id  INT PRIMARY KEY, 
channel  VARCHAR (255) 
);

INSERT INTO sales_organization (sales_org_id, sales_org) 
VALUES 
(1, 'Domestic'), 
(2, 'Export') ;

INSERT INTO sales_channel (channel_id, channel) 
VALUES 
(1, 'Wholesale'), 
(2, 'Retail'), 
(3, 'eCommerce'), 
(4, 'TV Shopping'); 

--A
SELECT s.sales_org, sc.channel
FROM sales_organization S
JOIN sales_channel SC
ON S.sales_org_id=SC.channel_id ;

--Task4
-- A. 
SELECT department_id
FROM employees
GROUP BY department_id;
-- B. 
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;
-- C. 
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;
-- D. 
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;
-- E. 
SELECT department_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;
-- F. 
SELECT department_id, MIN(salary) AS min_salary, MAX(salary) AS max_salary, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
-- G. 
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;
-- H. 
SELECT department_id, job_id, COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, job_id;

--HAVING CLAUSE
-- A. 
SELECT manager_id, COUNT(*) AS direct_reports
FROM employees
GROUP BY manager_id;
-- B. 
SELECT manager_id, COUNT(*) AS direct_reports
FROM employees
GROUP BY manager_id
HAVING COUNT(*) >= 5;
-- C. 
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000;
-- D. 
SELECT department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 10000;
-- E. 
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000;

--Task5
--1
SELECT e.first_name + ' ' + e.last_name AS name
FROM employees e
UNION
SELECT d.first_name + ' ' + d.last_name AS name
FROM dependents d;
--2
SELECT id
FROM A
INTERSECT
SELECT id
FROM B
ORDER BY id DESC;
--3
-- A
SELECT e.first_name, e.last_name
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id;
-- B
SELECT e.first_name, e.last_name
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.dependent_id IS NULL;
--4
-- A.
SELECT first_name, last_name, 
 CASE 
    WHEN YEAR(hire_date) = 2000 THEN 'Anniversary in 2000'
    WHEN YEAR(hire_date) < 2000 THEN 'Anniversary before 2000'
    ELSE 'Anniversary after 2000'
    END AS work_anniversary
FROM employees;
-- B
SELECT first_name, last_name, salary,
 CASE 
   WHEN salary < 3000 THEN 'Low'
   WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
   ELSE 'High'
   END AS salary_level
FROM employees;
--5
UPDATE employees
SET last_name = 'Lopez'
WHERE first_name = 'Sarah' AND last_name = 'Bell';

--FINAL TASK
-- A
SELECT e.first_name, e.last_name, e.salary, e.department_id
FROM employees e
WHERE e.department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);
-- B
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE location_id = 1700
);
-- C
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
-- D
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
-- E
SELECT DISTINCT d.department_id, d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 10000;
-- F
SELECT DISTINCT d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING MAX(e.salary) <= 10000 OR MAX(e.salary) IS NULL;
-- G
SELECT department_id, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;
-- H
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > ALL (SELECT MIN(salary) FROM employees GROUP BY department_id);
-- I
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary >= ALL (SELECT MAX(salary) FROM employees GROUP BY department_id);
-- J
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
-- K
SELECT AVG(department_avg) AS avg_of_avg_salary
FROM (
    SELECT AVG(salary) AS department_avg
    FROM employees
    GROUP BY department_id
) AS department_avg_table;
-- L
SELECT e.first_name, e.last_name, e.salary, avg_salary, (e.salary - avg_salary) AS salary_difference
FROM employees e
JOIN (SELECT AVG(salary) AS avg_salary FROM employees) avg_table
ON 1 = 1;
