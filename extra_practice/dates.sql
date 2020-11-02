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