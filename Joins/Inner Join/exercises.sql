
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
select c.firstname, c.lastname, o.orderid from orders as o
inner join customers as c on o.customerid = c.customerid
where c.state in ('OH', 'NY', 'OR')
order by o.orderid;


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
select p.prod_id, i.quan_in_stock from products as p
inner join inventory as i on i.prod_id = p.prod_id

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
select e.first_name, d.dept from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as d on dp.dept_no = d.dept_no

--or

select e.first_name, d.dept from employees as e
inner join dept_emp as de using(emp_no)
inner join departments as d using(dept_no)