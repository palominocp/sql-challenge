CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees (
	emp_no INTEGER,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INTEGER,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
