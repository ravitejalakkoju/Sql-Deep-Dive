/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/

CREATE or ALTER VIEW "90-95" AS 
SELECT * from employees
where EXTRACT(YEAR from hire_date) BETWEEN 1990 and 1995

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

CREATE OR ALTER VIEW "bigbucks" AS
SELECT * from employees
join salaries USING(emp_no)
where salary > 80000
order by salary
-- ...
