USE join_test_db;

-- #2
INSERT INTO users (name, email, role_id)
VALUES('thomas', 'thomas@example.com', 2),
      ('cory', 'cory@example.com', 2),
      ('lili', 'lili@example.com', 2),
      ('jason', 'jason@example.com', null);
SELECT * FROM users;

-- #3
# USING JOIN
SELECT u.name AS user_name, r.name AS role_name
FROM users AS u
JOIN roles AS r ON r.id = u.role_id;

#  -- USING LEFT JOIN - all users included + null roles
SELECT u.name AS user_name, r.name AS role_name
FROM users AS u
LEFT JOIN roles AS r ON r.id = u.role_id;

# -- USING RIGHT JOIN - shows all the roles even one that is unassigned
SELECT u.name AS user_name, r.name AS role_name
FROM users AS u
RIGHT JOIN roles AS r ON r.id = u.role_id;

-- #4 WERE TOLD TO SKIP BUT TRIED ANYWAY, FOUND SOLUTION IN STACK OVERFLOW
SELECT r.name AS role, COUNT(r.name)
FROM users AS u
JOIN roles AS r ON u.role_id = r.id
GROUP BY r.name;



