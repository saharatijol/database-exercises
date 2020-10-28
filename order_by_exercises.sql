USE employees;

-- ORDER BY #2
SELECT *
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- ORDER BY #3
SELECT *
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- ORDER BY #4
SELECT *
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- ORDER BY #5
SELECT *
FROM employees
WHERE last_name like 'E%'
   OR last_name like '%E'
ORDER BY emp_no;

-- ORDER BY #6
SELECT *
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY last_name DESC, first_name DESC;

SELECT *
FROM employees
WHERE last_name like 'E%'
   OR last_name like '%E'
ORDER BY emp_no DESC;

-- ORDER BY #7
SELECT *
FROM employees
WHERE hire_date like '199%'
   AND birth_date like '%-12-25'
ORDER BY birth_date, hire_date DESC;


