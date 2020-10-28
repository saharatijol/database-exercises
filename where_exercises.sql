USE employees;

-- #2
SELECT *
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya');

-- #3
SELECT *
FROM employees
WHERE last_name LIKE 'E%';

-- #4
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- #5
SELECT *
FROM employees
WHERE birth_date like '%-12-25';

-- #6
SELECT *
FROM employees
WHERE last_name like '%q%';

-- --------------------------------------
-- #1
SELECT *
FROM employees
WHERE first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya';

-- #2
SELECT *
FROM employees
WHERE (first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya')
    AND gender = 'M';

-- #3
SELECT *
FROM employees
WHERE last_name like 'E%'
   OR last_name like '%E';

-- #4
SELECT *
FROM employees
WHERE last_name like 'E%'
  AND last_name like '%E';

-- #5
SELECT *
FROM employees
WHERE hire_date like '199%'
   AND birth_date like '%-12-25';

-- #6
SELECT *
FROM employees
WHERE last_name like '%q%'
   AND last_name not like '%qu%';


