/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT *, age(birth_date) FROM employees
where (Extract (year from age(birth_date))) > 60;

--or

SELECT *,AGE(birth_date) FROM employees
WHERE birth_date < now() - interval '61 years'

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT * FROM employees
where EXTRACT(month from hire_date) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT * FROM employees
where Extract(month from birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT first_name, max(age(birth_date)) FROM employees
group by first_name;

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT count(orderid) FROM orders
where date_trunc('month', orderdate) = date '2004-01-01';

--or

SELECT count(orderid) FROM orders
where to_char(orderdate, 'mm yyyy') = '01 2004';