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


