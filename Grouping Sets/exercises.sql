/*
*  Calculate the total amount of employees per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/

select d.dept_no, d.dept_name, count(e.emp_no) from employees
join dept_emp as de using(emp_no)
join departments as d using(dept_no)
group by 
	GROUPING SETS(
		(),
		(d.dept_no, d.dept_name)
	)
order by d.dept_no, d.dept_name

/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/

select de.dept_no, AVG(salary) from salaries s
join dept_emp de using(emp_no)
group by
	grouping sets(
		(),
		(de.dept_no)
	)
order by de.dept_no desc
