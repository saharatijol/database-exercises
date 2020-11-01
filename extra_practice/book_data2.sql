USE bookshop_db;

INSERT INTO books(title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
      ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
      ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT * FROM books;

# REFINING OUR SELECTIONS

# DISTINCT - returns unique author last names w/o duplicates
SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT released_year FROM books;

-- What about unique full names?
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

# ORDER BY - Sorting our results, this is ascending by default
SELECT author_lname FROM books ORDER BY author_lname;
SELECT title FROM books ORDER BY title;
SELECT released_year FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname
FROM books ORDER BY 2;

SELECT title, author_fname, author_lname
FROM books ORDER BY 3;

SELECT title, author_fname, author_lname
FROM books ORDER BY 1;

SELECT title, author_fname, author_lname
FROM books ORDER BY 1 DESC;

SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;

# LIMIT - top 10, top 5 typically used in conjunction with ORDER BY or any kind of sorting. More meaningful results
SELECT title FROM books LIMIT 10;

SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;

# LIKE
-- Pattern matching
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
-- Starts with 'da'
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';

SELECT title FROM books WHERE title LIKE '%the%';

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '___'; -- to specify # of characters, this indicates 'give me quantity with 3-digits(___)

# MORE WILDCARDS
SELECT title FROM books WHERE title LIKE '%\%%';

SELECT title FROM books WHERE title LIKE '%\_%';

# EXERCISES
SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT_WS(' - ', title, released_year) AS summary FROM books
ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT UPPER(CONCAT('My favorite author is ', author_fname, ' ', author_lname, '!')) AS yell FROM books ORDER BY author_lname;

