/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT hire_date, COUNT(e.emp_no) as totalEmp
FROM employees as e
group by hire_date
order by totalEmp desc;

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT e.emp_no, count(t.title) FROM employees as e
join titles as t using(emp_no)
where Extract(year from hire_date) > 1991
group by emp_no
order by emp_no;


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT e.emp_no, de.from_date, de.to_date FROM employees as e
inner join dept_emp as de using(emp_no)
where dept_no = 'd005'
group by e.emp_no, de.from_date, de.to_date
order by de.from_date, de.to_date

