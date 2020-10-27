USE codeup_test_db;

-- #2
SELECT * FROM albums;

SELECT * FROM albums WHERE release_date < 1980;

SELECT * FROM albums WHERE artist = 'Michael Jackson';

-- #3
UPDATE albums
SET sales = sales * 10;


UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;
-- SELECT * FROM albums WHERE release_date BETWEEN 1800 AND 1980;

UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';
-- SELECT * FROM albums WHERE artist = 'Peter Jackson';

SELECT * FROM albums;

