USE employees;

-- #2
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM employees AS e
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY emp_no DESC;

-- #3
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Name', hire_date, curdate(),
       DATEDIFF(CURDATE(), hire_date) AS 'Days in company'
FROM employees AS e
WHERE hire_date LIKE '199%'
  AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;

