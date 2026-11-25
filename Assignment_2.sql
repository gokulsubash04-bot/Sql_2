USE employee;

SELECT DISTINCT salary
FROM Employees;

SELECT age AS Employee_Age,
       salary AS Employee_Salary
FROM Employees;

SELECT *
FROM Employees
WHERE salary > 50000
AND hire_date < '2016-01-01';

SELECT *
FROM Employees
WHERE designation IS NULL
OR designation = '';

UPDATE Employees
SET designation = 'Data Scientist'
WHERE designation IS NULL
OR designation = '';

SELECT *
FROM Employees
ORDER BY department_id ASC, salary DESC;

SELECT *
FROM Employees
WHERE YEAR(hire_date) = 2018
ORDER BY hire_date ASC
LIMIT 5;

SELECT SUM(e.salary) AS total_finance_salary
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS minimum_age
FROM Employees;

SELECT l.location_name,
       MAX(e.salary) AS max_salary
FROM Employees e
INNER JOIN Locations l
ON e.location_id = l.location_id
GROUP BY l.location_id, l.location_name;

SELECT designation,
       AVG(salary) AS avg_salary
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3;

SELECT l.location_id,
       l.location_name,
       AVG(e.age) AS avg_female_age
FROM Employees e
INNER JOIN Locations l
ON e.location_id = l.location_id
WHERE e.gender = 'Female'
GROUP BY l.location_id, l.location_name
HAVING AVG(e.age) < 30;

SELECT e.employee_name,
       e.designation,
       d.department_name
FROM Employees e
INNER JOIN Departments d
ON e.department_id = d.department_id;

SELECT d.department_id,
       d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM Departments d
LEFT JOIN Employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

SELECT l.location_name,
       e.employee_name
FROM Employees e
RIGHT JOIN Locations l
ON e.location_id = l.location_id;