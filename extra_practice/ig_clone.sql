USE instagram_clone_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY ,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

-- NOTE: you can only like a corresponding photo only ONE time. We are not really storing any other information
-- we are not adding id primary key here bec we are not going to be referring to likes, therefore don't need it
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id) -- this will not allow users to insert two likes that are exactly the same.
        -- Gives you a unique combination
);

-- NOTE: Relationship Troubles:
-- Followees <-> Follower relationship may pose a problem because follower id and followee id references back to users id table field
-- we must enforce that this will be one-way relationship on both sides
-- ensure that we don't have duplicated follows.
-- Example: if i follow bretman, that means i can't follow him again, there can't be duplicates of ME that follows bretman
CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

INSERT INTO users (username)
VALUES('BlueTheCat'), ('CharlieBrown'), ('SaraTijol');

INSERT INTO photos(image_url, user_id)
VALUES('/sdfsdfgs', 1), ('/ghjghj', 2), ('/vbnvbnvbnn', 2);

INSERT INTO comments(comment_text, user_id, photo_id)
VALUES ('Funny picture.. lol', 1, 2),
       ('What happened?', 3, 2),
       ('Nice color', 2, 1);

INSERT INTO likes (user_id, photo_id)
VALUES (1,1),
       (2,1),
       (1,2),
       (1,3),
       (3,3);

INSERT INTO follows (follower_id, followee_id)
VALUES (1,2),
       (1,3),
       (3,1),
       (2,3);

SELECT * FROM likes;
SELECT * FROM follows;

-- Won't work due to duplicate entry. Passed the test
# INSERT INTO follows(follower_id, followee_id) VALUES (1,3);

-- This will NOT work bec of primary key constraint. Will not allow due to duplicate entry :)
# INSERT INTO likes (user_id, photo_id)
# VALUES
# (1,1);



SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;

SELECT username, photos.image_url
FROM photos
JOIN users ON photos.user_id = users.id;
