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
SELECT d.dept_name, CONCAT(e.first_name,' ', e.last_name) AS current_manager, e.gender
FROM employees AS e
    JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
    JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
    AND e.gender = 'F'
ORDER BY d.dept_name;

-- #4 SKIPPED FOR NOW


-- #5
SELECT d.dept_name, CONCAT(e.first_name,' ', e.last_name) AS Department_manager_name, s.salary AS Salary
FROM employees AS e
        JOIN salaries AS s ON e.emp_no = s.emp_no
        JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
        JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;

-- BONUS
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', CONCAT(e2.first_name, ' ', e2.last_name) AS 'Manager Name'
FROM employees AS e
         JOIN dept_emp AS de ON e.emp_no = de.emp_no
         JOIN departments AS d ON d.dept_no = de.dept_no
         JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
         JOIN employees AS e2 ON e2.emp_no = dm.emp_no
WHERE de.to_date LIKE '9999%' and dm.to_date LIKE '9999%'
ORDER BY e.last_name ASC;


