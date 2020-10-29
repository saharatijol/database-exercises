USE join_test_db;

-- #2
INSERT INTO users (name, email, role_id)
VALUES('thomas', 'thomas@example.com', 2),
      ('cory', 'cory@example.com', 2),
      ('lili', 'lili@example.com', 2),
      ('jason', 'jason@example.com', null);
select * from users;

-- #3
# USING JOIN
SELECT u.name AS user_name, r.name AS role_name
FROM users AS u
JOIN roles AS r ON r.id = u.role_id;

# USING LEFT JOIN - all users included + null roles
SELECT u.name AS user_name, r.name AS role_name
FROM users AS u
LEFT JOIN roles AS r ON r.id = u.role_id;

# USING RIGHT JOIN
SELECT u.name AS user_name, r.name AS role_name
FROM users AS u
RIGHT JOIN roles AS r ON r.id = u.role_id;

-- #4 WERE TOLD TO SKIP BUT TRIED ANYWAY, FOUND SOLUTION IN STACK OVERFLOW
SELECT roles.name AS role_name, COUNT(roles.name)
FROM users JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;



