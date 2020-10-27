USE codeup_test_db;

-- #3
SELECT * FROM albums WHERE artist = 'Pink Floyd';

SELECT released_date FROM albums WHERE name = 'Supernatural';

SELECT genre FROM albums WHERE name = 'Thriller';

SELECT name FROM albums WHERE release_date BETWEEN 1989 AND 1999;

SELECT name FROM albums WHERE sales < 20;

SELECT * FROM albums;
SELECT * FROM albums WHERE genre = 'Rock';

