USE employees;

-- #2
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

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
WHERE birth_date LIKE '%-12-25';

-- #6
SELECT *
FROM employees
WHERE last_name LIKE '%q%';

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
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

-- #4
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E';

-- #5
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
   AND birth_date LIKE '%-12-25';

-- #6
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
   AND last_name NOT LIKE '%qu%';


USE adlister_db;

SELECT users.email , ad.title
FROM users AS users
         JOIN ad AS ad ON ad.title = user.id;

SELECT ad_title, category_name
FROM ad
JOIN category on category.category_name = ad.id;

SELECT ad_title, category_name
FROM category
JOIN ad on ad.ad_title = category.id;

SELECT users.username , ad.title
FROM users AS users
JOIN users AS ad ON ad.title = user.id;


















