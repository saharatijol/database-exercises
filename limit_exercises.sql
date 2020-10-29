USE employees;

-- #2
SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- #3
SELECT *
FROM employees
WHERE hire_date like '199%'
  AND birth_date like '%-12-25'
ORDER BY birth_date, hire_date DESC
LIMIT 5;

-- #4
SELECT *
FROM employees
WHERE hire_date like '199%'
  AND birth_date like '%-12-25'
ORDER BY birth_date, hire_date DESC
LIMIT 5 OFFSET 45;

-- NOTE:
-- let LIMIT = # results per page
-- let pageNumber = GIVEN
-- let OFFSET = (pageNumber -1) * LIMIT