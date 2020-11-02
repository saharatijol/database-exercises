USE bookshop_db;

SELECT * FROM books;

# COUNT
SELECT COUNT(*) FROM books;
-- I want unique authors first names
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;

SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

# GROUP BY - summarizes or aggregates identical data into single rows
-- Example scenarios:
-- take all movies and group them by genres and tell me how many movies each genres have
-- group teas by variety and find the average sales price for each variety OR add together all sales and figure out whcih tea type sells the best

SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_lname, author_fname;

SELECT released_year, COUNT(released_year) FROM books GROUP BY released_year;

# MIN and MAX
-- FIND the minimum released_year
SELECT MIN(released_year) FROM books;
SELECT MIN(pages) FROM books;
SELECT MAX(pages) FROM books;

-- This seems like it could work... BUT it doesn't, use subqueries to fix this
SELECT MAX(pages), title FROM books;

# SUBQUERIES
SELECT title, pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);
-- Well, that's great but this is a bit slower because this is running 2 queries and run independently

-- Faster way:
SELECT * FROM books ORDER BY pages DESC LIMIT 1;
SELECT * FROM books;

# MIN AND MAX with GROUP BY
-- Find the year that each author published their first book
SELECT author_fname, author_lname, MIN(released_year)
FROM books
GROUP BY author_lname, author_fname;

-- Find the longest page count for each author
SELECT author_fname, author_lname, MAX(pages)
FROM books
GROUP BY author_lname, author_fname;

# SUM FUNCTION
SELECT SUM(pages) FROM books;

-- SUM + Group BY
-- Sum all pages author has written
SELECT author_fname, author_lname, SUM(pages) FROM books
GROUP BY author_lname, author_fname;

# AVG - average data
SELECT AVG(pages) FROM books;

-- AVG + GROUP BY
-- Calculate the average stock quantity for books released in the same year
SELECT AVG(stock_quantity), released_year from books
GROUP BY released_year;

# EXERCISES
SELECT * FROM books;

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books
GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT author_fname, author_lname, AVG(released_year)
FROM books
GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, pages
FROM books
ORDER BY pages DESC LIMIT 1;

SELECT released_year AS 'year', COUNT(released_year) AS '#_books', AVG(pages) AS 'avg_pages'
FROM books
GROUP BY released_year;




