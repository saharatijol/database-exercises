USE employees;

-- #2.
SELECT d.depart_name, CONCAT(e.first_name,' ', e.last_name) AS current_manager
FROM employees as e
JOIN dept_manager as dm
    ON e.emp_no = dm.emp_no
JOIN departments as d
    ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

-- #3.



