--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.emp_no, E.last_name, E.first_name, E.sex, S.Salary FROM employees AS E
FULL JOIN salaries AS S ON E.emp_no = S.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date FROM employees
WHERE employees.hire_date >= '1986-01-01'::date
AND employees.hire_date <= '1986-12-31'::date;

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT DM.dept_no, D.dept_name, E.emp_no, E.last_name, E.first_name FROM employees AS E
RIGHT JOIN dept_manager AS DM ON E.emp_no = DM.emp_no
FULL JOIN departments AS D ON DM.dept_no = D.dept_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name FROM employees AS E
FULL JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
FULL JOIN departments AS D ON DE.dept_no = D.dept_no
ORDER BY D.dept_name DESC;

--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name FROM employees AS E
LEFT JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
FULL JOIN departments AS D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';


--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name FROM employees AS E
LEFT JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
FULL JOIN departments AS D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales'
OR D.dept_name = 'Development';

--List the frequency count of employee last names (i.e., how many employees share each last name) 
--in descending order.
SELECT last_name, COUNT(emp_no) FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC;


