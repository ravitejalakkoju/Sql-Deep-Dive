
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

select emp_no from employees as e
join titles as t using(emp_no)
where extract(year from hire_date) > 1991
group by emp_no
having count(emp_no) > 2
order by e.emp_no

/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

select e.emp_no from employees as e
join dept_emp using(emp_no)
join salaries as e using(emp_no)
where dept_no = 'd005'
group by e.emp_no
having count(s.salary) > 15
order by e.emp_no

/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

select emp_no, count(dept_no) from employees
join dept_emp using(emp_no)
group by dept_no
having count(dept_no) > 1
order by e.emp_no