/*List the employee number, last name, first name, sex, and salary of each employee*/
select
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
from
	employees
inner join
	salaries
on 
	employees.emp_no = salaries.emp_no

/*List the first name, kast name, and hire date for the employees who were hired in 1986*/
select
	first_name,
	last_name,
	hire_date
from
	employees
where
	extract(year from hire_date::date) = 1986;

/*List the manager of each department along with their department number, department name, employee number, last name, and first name,*/
select
	departments.dept_no,
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name
from
	dept_manager
inner join
	departments
on
	dept_manager.dept_no = departments.dept_no
inner join
	employees
on
	dept_manager.emp_no = employees.emp_no

/*List the department number for each employeealong eith that employee's employee number, last name, first name, and department name */
select 
	departments.dept_no,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from
	departments
inner join
	dept_emp
on
	departments.dept_no = dept_emp.dept_no
inner join
	employees
on 
	dept_emp.emp_no = employees.emp_no

/*List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B */
select
	first_name,
	last_name,
	sex
from 
	employees
where
	first_name = 'Hercules' 
and 
	last_name like 'B%'

/*List each employee in the Sales department, including their employee number, last name, and first name */
select
	departments.dept_name,
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name
from
	departments
inner join
	dept_emp
on
	departments.dept_no = dept_emp.dept_no
inner join
	employees
on
	dept_emp.emp_no = employees.emp_no
where
	dept_name = 'Sales'
	
/* List each employee in the Sales and Development departments, including their empployee number, last name, first name, and department name */
select 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from
	employees
inner join
	dept_emp
on
	employees.emp_no = dept_emp.emp_no
inner join
	departments
on
	dept_emp.dept_no = departments.dept_no
where 
	dept_name = 'Sales' 
or
	dept_name = 'Development'

/*List the frequency counts , in descending order, of all the employee last names (that is, how many employees share each last name)*/
SELECT 
    last_name,
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;

/* Padding single-digit-dates */
UPDATE employees
SET
    birth_date = TO_DATE(
        LPAD(SPLIT_PART(birth_date, '/', 1), 2, '0') || '/' ||
        LPAD(SPLIT_PART(birth_date, '/', 2), 2, '0') || '/' ||
        SPLIT_PART(birth_date, '/', 3), 'MM/DD/YYYY'
    ),
    hire_date = TO_DATE(
        LPAD(SPLIT_PART(hire_date, '/', 1), 2, '0') || '/' ||
        LPAD(SPLIT_PART(hire_date, '/', 2), 2, '0') || '/' ||
        SPLIT_PART(hire_date, '/', 3), 'MM/DD/YYYY'
    );
