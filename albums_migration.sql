USE codeup_test_db;

DROP TABLE IF EXISTS album;
CREATE TABLE IF NOT EXISTS albums(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(25),
    name VARCHAR(25),
    release_date INT(4) UNSIGNED,
    sales FLOAT(15),
    genre VARCHAR(20),
    PRIMARY KEY(id)
)