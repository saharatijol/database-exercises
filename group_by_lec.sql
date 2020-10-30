USE employees;

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

SELECT AVG(salary)
FROM salaries
WHERE to_date > NOW();
# MAX, MIN, AVG, SUM -- Aggregate functions

SELECT COUNT(*), first_name
FROM employees
WHERE hire_date = '1990-12-25'
GROUP BY first_name;

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;