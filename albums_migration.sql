USE codeup_test_db;

DROP TABLE IF EXISTS albums;
CREATE TABLE IF NOT EXISTS albums(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL DEFAULT 'Unknown',
    name VARCHAR(100) NOT NULL,
    release_date INT(4) UNSIGNED,
    sales FLOAT(11),
    genre VARCHAR(250) NOT NULL DEFAULT 'Unknown',
    PRIMARY KEY(id)
);

DESCRIBE albums;

/*
This sets field item to NOT allow Null entry and set "Unknown" as its default value instead
Ex: author_last_name VARCHAR(25) NOT NULL DEFAULT 'Unknown'
*/

