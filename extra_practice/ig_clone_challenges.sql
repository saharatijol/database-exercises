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
RIGHT JOIN users on photos.user_id = users.id
WHERE image_url IS NULL;

-- Another solution
SELECT username, photos.id
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Who has the most likes on a single photo?
SELECT username, photos.id, photos.image_url, COUNT(likes.user_id)
FROM photos
JOIN likes ON likes.photo_id = photos.id
JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY COUNT(likes.user_id) DESC
LIMIT 1;


