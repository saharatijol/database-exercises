USE cat_app;

CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

desc cats;

INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

-- Show me all columns in cats table
SELECT * FROM cats;

-- Show me all names from cats table
SELECT name FROM cats;

-- Show me all age of cat
SELECT age FROM cats;

-- Multiple pieces of data
SELECT name, age FROM cats;
SELECT cat_id, name, age, breed FROM cats;

# q1
SELECT cat_id from cats;
# q2
SELECT name, breed from cats;
# q3
SELECT name, age from cats where breed='Tabby';
# q4
SELECT cat_id, age from cats where cat_id=age;
