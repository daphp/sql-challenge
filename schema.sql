-- Create departments table with length constraints
CREATE TABLE IF NOT EXISTS departments (
    dept_no TEXT NOT NULL PRIMARY KEY CHECK (LENGTH(dept_no) <= 4),
    dept_name TEXT NOT NULL CHECK (LENGTH(dept_name) <= 50)
);

-- Create a staging table to load the raw data
CREATE TABLE IF NOT EXISTS employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title TEXT NOT NULL,
    birth_date TEXT NOT NULL,  -- Loading as TEXT first
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex TEXT NOT NULL,
    hire_date TEXT NOT NULL  -- Loading as TEXT first
);

-- Create employees table with length constraints
/*CREATE TABLE IF NOT EXISTS employees (
    emp_no INTEGER NOT NULL PRIMARY KEY CHECK (emp_no BETWEEN 1 AND 99999),
    emp_title TEXT NOT NULL CHECK (LENGTH(emp_title) <= 5),
    birth_date DATE NOT NULL,
    first_name TEXT NOT NULL CHECK (LENGTH(first_name) <= 50),
    last_name TEXT NOT NULL CHECK (LENGTH(last_name) <= 50),
    sex TEXT NOT NULL CHECK (LENGTH(sex) = 1),
    hire_date DATE NOT NULL
); */

-- Create dept_emp table with foreign keys
-- Create dept_emp table with foreign keys
CREATE TABLE IF NOT EXISTS dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no TEXT NOT NULL CHECK (LENGTH(dept_no) <= 4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create dept_manager table with foreign keys
CREATE TABLE IF NOT EXISTS dept_manager (
    dept_no TEXT NOT NULL CHECK (LENGTH(dept_no) <= 4),
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create salaries table with foreign key
CREATE TABLE IF NOT EXISTS salaries (
    emp_no INTEGER NOT NULL PRIMARY KEY,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- Create titles table with length constraints
CREATE TABLE IF NOT EXISTS titles (
    title_id TEXT NOT NULL PRIMARY KEY CHECK (LENGTH(title_id) <= 5),
    title TEXT NOT NULL UNIQUE CHECK (LENGTH(title) <= 50)
);

COMMIT;
