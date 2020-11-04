USE bookshop_db;

# Logical Operators

SELECT * FROM books;

# NOT EQUALS => !=
SELECT title, released_year FROM books
WHERE released_year != 2017;

SELECT title, author_lname FROM books
WHERE author_lname != 'Harris';

# LIKE VS NOT LIKE
SELECT title FROM books WHERE title LIKE '%W%';
SELECT title FROM books WHERE title NOT LIKE '%W%';

# GREATER THAN >
SELECT title, released_year FROM books
WHERE released_year > 2000
ORDER BY released_year;

# GREATER THAN EQUAL TO >=
SELECT title, stock_quantity FROM books
WHERE stock_quantity >= 100;
-- Try this
SELECT 99 > 1; -- this evaluates to true, which explains the output of 1, if false, it will be 0

# MINI EXERCISE elaborating on logical operators
SELECT 100 > 5; -- 1
SELECT -15 > 15; -- 0
SELECT 9 > -1; -- 1
SELECT 1 > 1; -- 0
SELECT 'a' > 'b'; -- 0
SELECT 'A' > 'a'; -- 0
SELECT 'A' = 'a'; -- 1

# LESS THAN <
SELECT title, released_year FROM books
WHERE released_year < 2000
ORDER BY released_year;

# AND &&
SELECT title, author_lname FROM books
WHERE author_lname = 'Eggers' AND released_year > 2010;

SELECT * FROM books
WHERE author_lname = 'Eggers'
AND released_year > 2010
AND title LIKE '%novel%';

# OR ||
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Eggers' OR released_year > 2010;

SELECT title, author_lname, released_year, stock_quantity FROM books
WHERE author_lname = 'Eggers' OR  released_year > 2010 OR stock_quantity > 100;

# BETWEEN and NOT BETWEEN
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015
ORDER BY released_year;

# CAST
SELECT CAST('2020-05-02' AS DATETIME);

SELECT name, birth_dt FROM people
WHERE birth_dt BETWEEN CAST('1980-01-01' AS DATETIME ) AND CAST('2000-01-01' AS DATETIME );

# IN and NOT IN
-- Longer way
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' OR author_lname = 'Lahiri' OR author_lname = 'Smith';

-- Shorter way using IN
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books
WHERE released_year IN (2017, 1985);

SELECT title, released_year FROM books
WHERE released_year >= 2000 AND released_year NOT IN(2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016);

-- there's still a better way
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND released_year % 2 != 0
ORDER BY released_year;

