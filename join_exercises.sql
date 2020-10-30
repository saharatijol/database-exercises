USE employees;
SHOW TABLES;

-- #2.
SELECT d.dept_name, CONCAT(e.first_name,' ', e.last_name) AS current_manager
FROM employees AS e
    JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
    JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

-- #3.
SELECT d.dept_name, CONCAT(e.first_name,' ', e.last_name) AS current_manager
FROM employees AS e
    JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
    JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
    AND e.gender = 'F'
ORDER BY d.dept_name;

-- #4 Walk through solution
SELECT t.title AS Title, COUNT(t.emp_no) AS Count
FROM titles AS t
    JOIN employees AS e ON t.emp_no = e.emp_no
    JOIN dept_emp AS de on e.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
  AND t.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
  -- above checks employees who moved to new dept that left their previous titles
GROUP BY t.title;


-- #5
SELECT d.dept_name, CONCAT(e.first_name,' ', e.last_name) AS manager_name, s.salary AS manager_salary
FROM employees AS e
        JOIN salaries AS s ON e.emp_no = s.emp_no
        JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
        JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

-- BONUS
SELECT CONCAT(e1.first_name, ' ', e1.last_name) AS employee_name, d.dept_name AS department_name, CONCAT(e2.first_name, ' ', e2.last_name) AS manager_name
FROM employees AS e1
         JOIN dept_emp AS de ON e1.emp_no = de.emp_no
         JOIN departments AS d ON d.dept_no = de.dept_no
         JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
         JOIN employees AS e2 ON e2.emp_no = dm.emp_no
WHERE de.to_date LIKE '9999%' and dm.to_date LIKE '9999%'
ORDER BY e1.last_name ASC;


