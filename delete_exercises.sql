USE codeup_test_db;

-- #4
DELETE FROM albums WHERE release_date > 1991;

DELETE FROM albums WHERE genre = 'Disco';

DELETE FROM albums WHERE artist = 'Eagles';

-- #5 changed SELECT to DELETE

SELECT * FROM albums;


