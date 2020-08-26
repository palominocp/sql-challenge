-- 1. A join statement to query employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
JOIN salaries AS salary
  ON employees.emp_no = salary.emp_no
ORDER BY employees.emp_no ASC;

-- 2. List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date ASC;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no ASC;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no ASC;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'
ORDER BY employees.first_name ASC;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no ASC;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY employees.emp_no ASC;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT (last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
