USE customers_db;

CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR (100),
  last_name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

SHOW tables;

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

SELECT * FROM customers;

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

SELECT * FROM orders;

-- Using Subquery but this is cumbersome
SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name = 'George'
    );

# CROSS JOINS/IMPLICIT JOIN -- USELESS
-- not meaningful but good to know
-- this is what you call a CROSS JOIN it jams everything together, CRAZINESS
SELECT * FROM customers, orders;

# INNER JOIN - more relevant and meaningful
-- IMPLICIT INNER JOIN
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM customers, orders
WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN = more conventional
SELECT * FROM customers
JOIN orders ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders ON customers.id = orders.customer_id;

-- ARBITRARY JOIN - don't do this!
SELECT * FROM customers
JOIN orders ON customers.id = orders.id;

-- GETTING FANCIER
SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders ON customers.id = orders.customer_id
ORDER BY order_date;

-- WHO'S OUR BIGGEST SPENDER?
SELECT first_name, last_name, order_date, SUM(amount) AS total_spent
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY orders.customer_id, order_date
ORDER BY total_spent DESC;

# LEFT JOINS
SELECT * FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.id, order_date
ORDER BY total_spent;

# RIGHT JOINS
-- this is good to use to spot any mistakes or missing records that we don't see from inner or right joins
-- for example, what if someone accidentally deleted a customer but the records still persists for orders.
-- Easier to find orphan data
# NOTE: Tried to insert into orders but the constraint of foreign key is preventing it
SELECT * FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

# ON DELETE CASCADE
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
    ON DELETE CASCADE
);

-- this means:  when a customer is deleted that has corresponding order, delete the order as well.
SELECT * FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;
-- this should delete orders made by boy george
DELETE FROM customers WHERE email = 'george@gmail.com';

# ONE-TO-MANY EXERCISE
-- A student can have many papers, but many papers can belong to only ONE student

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30)
);

CREATE TABLE papers(
  title VARCHAR(40),
  grade INT UNSIGNED,
  student_id INT,
  FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade )
VALUES(1, 'My First Book Report', 60),
      (1, 'My Second Book Report', 75),
      (2, 'Russian Lit Through The Ages', 94),
      (2, 'De Montaigne and The Art of The Essay', 98),
      (4, 'Borges and Magical Realism', 89);

-- #1
SELECT first_name, title, grade
FROM students
JOIN papers p ON students.id = p.student_id
ORDER BY grade DESC;

-- #2
SELECT first_name, title, grade
FROM students
LEFT JOIN papers p ON students.id = p.student_id;

-- #3
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM students
LEFT JOIN papers p ON students.id = p.student_id;

-- #4
SELECT first_name, IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers p ON students.id = p.student_id
GROUP BY first_name
ORDER BY average DESC;

-- #5
SELECT first_name, IFNULL(AVG(grade), 0) AS average,

FROM students
LEFT JOIN papers p ON students.id = p.student_id
GROUP BY first_name
ORDER BY average DESC;

