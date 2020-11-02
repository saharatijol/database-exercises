USE bookshop_db;

CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birth_dt DATETIME
);

INSERT INTO people(name, birthdate, birthtime, birth_dt)
VALUES ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people(name, birthdate, birthtime, birth_dt)
VALUES ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

SELECT * FROM people;

# FORMATTING DATES
SELECT name, birthdate FROM people;
SELECT name, birthdate, DAY(birthdate) FROM people;
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;

SELECT name, birth_dt, DAYOFYEAR(birth_dt) FROM people;
SELECT name, birth_dt, MONTHNAME(birth_dt) FROM people;

SELECT name, birth_dt, DATE_FORMAT(birth_dt, '%M %d %Y') FROM people;

# DATE MATH
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
SELECT  birth_dt, DATE_ADD(birth_dt, INTERVAL 1 MONTH) FROM people;
SELECT  birth_dt, DATE_ADD(birth_dt, INTERVAL 1 MONTH) FROM people;
SELECT birth_dt, DATE_ADD(birth_dt, INTERVAL 10 SECOND) FROM people;

SELECT birth_dt, DATE_ADD(birth_dt, INTERVAL 3 QUARTER) FROM people;

SELECT birth_dt, birth_dt + INTERVAL 1 MONTH FROM people;

SELECT birth_dt, birth_dt - INTERVAL 5 MONTH FROM people;

SELECT birth_dt, birth_dt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

