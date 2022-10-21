/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

select * FROM orders
join customers using(customerid)
where state in ('OH', 'NY', 'OR')
order by orderid

SELECT c.firstname, c.lastname, o.orderid 
FROM orders AS o, (
    SELECT customerid, state, firstname, lastname
    FROM customers
) AS c
WHERE o.customerid = c.customerid AND 
c.state IN ('NY', 'OH', 'OR')
ORDER BY o.orderid;

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/

select e.emp_no, first_name, last_name from employees e
join dept_emp de using(emp_no)
join dept_manager dm using (dept_no)
where dm.emp_no = 110183

select e.emp_no, first_name, last_name from employees e
where emp_no in (
    select emp_no from dept_emp
    where dept_no = (
        select dept_no from dept_manager where emp_no = 110183
    )
)
order by emp_no