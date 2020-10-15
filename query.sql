-- analysis query

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no,
	last_name,
	first_name,
	sex,
	salary
from employees e join salaries s on e.emp_no = s.emp_no
order by e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name,
	last_name,
	to_char(hire_date, 'MM/DD/YYYY')	-- converts postgres date format yyyy-mm-dd to format as shown
from employees
where EXTRACT(YEAR FROM hire_date) = '1986'
order by hire_date,
	first_name,
	last_name;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select d.dept_no,
	dept_name,
	dm.emp_no,
	first_name,
	last_name
from departments d join dept_manager dm on d.dept_no = dm.dept_no
	join employees e on dm.emp_no = e.emp_no
order by d.dept_no,
	first_name,
	last_name;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no,
	last_name,
	first_name,
	dept_name
from employees e join dept_emp de on e.emp_no = de.emp_no
	join departments d on d.dept_no = de.dept_no
order by dept_name,
	last_name,
	first_name;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%'
order by last_name;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no,
	last_name,
	first_name,
	dept_name
from employees e join dept_emp de on e.emp_no = de.emp_no
	join departments d on d.dept_no = de.dept_no
where d.dept_name = 'Sales'
order by last_name,
	first_name,
	e.emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,
	last_name,
	first_name,
	d.dept_name
from employees e join dept_emp de on e.emp_no = de.emp_no
	join departments d on d.dept_no = de.dept_no
where d.dept_name = 'Sales'
	or d.dept_name = 'Development'
order by last_name,
	first_name,
	e.emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name,
	count(last_name) as "count_last_name"
from employees
group by last_name
order by count_last_name desc;