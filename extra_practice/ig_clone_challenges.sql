USE instagram_clone_db;

-- 1. Reward users who have been around the longest (loyalty reward). Find the 5 oldest users.
SELECT username, created_at
FROM users
ORDER BY created_at LIMIT 5;

-- 2. What day of the week do most users register on? We need to figure out when to schedule an ad campaign
SELECT DAYNAME(created_at) AS 'day', COUNT(*) AS 'total'
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3. Target inactive users with an email campaign. Find users who have never posted a photo
SELECT username, image_url
FROM photos
RIGHT JOIN users u on photos.user_id = u.id
WHERE image_url IS NULL;