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

INSERT INTO users (username)
VALUES('BlueTheCat'), ('CharlieBrown'), ('SaraTijol');

INSERT INTO photos(image_url, user_id)
VALUES('/sdfsdfgs', 1), ('/ghjghj', 2), ('/vbnvbnvbnn', 2);

INSERT INTO comments(comment_text, user_id, photo_id)
VALUES ('Funny picture.. lol', 1, 2),
       ('What happened?', 3, 2),
       ('Nice color', 2, 1);



SELECT * FROM users;
SELECT * FROM photos;
SELECT * FROM comments;

SELECT username, photos.image_url
FROM photos
JOIN users ON photos.user_id = users.id;
