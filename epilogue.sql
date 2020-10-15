-- find employee 499942 information
select first_name,
	last_name,
	e.emp_no as employee_id,
	to_char(hire_date, 'MM/DD/YYYY'),
	d.dept_name,
	d.dept_no,
	title,
	salary
from employees e join dept_emp de on e.emp_no = de.emp_no
	join departments d on d.dept_no = de.dept_no
	join titles t on t.title_id = e.emp_title_id
	join salaries s on s.emp_no = e.emp_no
where e.emp_no = '499942';