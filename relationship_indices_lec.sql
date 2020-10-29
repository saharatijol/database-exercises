USE codeup_test_db;

CREATE TABLE quotes (
    id INT NOT NULL AUTO_INCREMENT,
    author VARCHAR(100) NOT NULL,
    content VARCHAR(240) NOT NULL,
    PRIMARY KEY (id)
);

show tables;

describe quotes;

# ALTERING TABLES AFTER IT IS CREATED
ALTER TABLE quotes
    ADD UNIQUE (content);

select * from quotes;
insert into quotes (author, content) values ('Fer', 'I love pozole');

CREATE TABLE authors (
                         id INT NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(100) NOT NULL,
                         last_name VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id),
                         UNIQUE (first_name, last_name)
);

insert into authors (first_name, last_name) values ('Fer', 'Mendoza');
insert into authors (first_name, last_name) values ('Fer', 'Mendoza R');

SELECT * from authors;

ALTER TABLE albums
    ADD UNIQUE (artist, name);
describe albums;

select * albums;
# insert into albums(artist, name, release_date, sales, genre)
# values('Michael Jackson', 'Thriller', 2345, 34, 'pop');
# will not be allowed bec its a duplicate, it wants unique artist, name


# use employees;
#
# show tables;
#
describe employees;