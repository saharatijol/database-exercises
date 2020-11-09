USE join_us;

-- Challenge 1: Find earliest date a user joined
SELECT
DATE_FORMAT(MIN(created_at), '%M %D %Y') AS 'earliest_date'
FROM users;

-- Challenge 2: Find email of the first (earliest) user
SELECT *
FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

-- Challenge 3: Count users according to the month they joined
SELECT
MONTHNAME(created_at) AS 'month', COUNT(*) AS 'count'
FROM users
GROUP BY month
ORDER BY count DESC;

-- Challenge 4: Count number of users with yahoo emails
SELECT COUNT(email) AS 'yahoo_users'
FROM users
WHERE email LIKE '%yahoo.com%';

-- Challenge 5: Calculate total number of users for each email host
SELECT
    CASE
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
    END as 'provider',
    COUNT(*) as 'total_users'
FROM users
GROUP BY provider
ORDER BY total_users DESC;

SELECT * FROM users;