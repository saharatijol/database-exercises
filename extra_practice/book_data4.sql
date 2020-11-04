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

# AND
SELECT title, author_lname FROM books
WHERE author_lname = 'Eggers' AND released_year > 2010;

SELECT * FROM books
WHERE author_lname = 'Eggers'
AND released_year > 2010
AND title LIKE '%novel%';


