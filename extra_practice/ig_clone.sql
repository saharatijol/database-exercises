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

INSERT INTO users (username)
VALUES('BlueTheCat'), ('CharlieBrown'), ('SaraTijol');

INSERT INTO photos(image_url, user_id)
VALUES('/sdfsdfgs', 1), ('/ghjghj', 2), ('/vbnvbnvbnn', 2);


SELECT * FROM users;
SELECT * FROM photos;

SELECT username, photos.image_url
FROM photos
JOIN users ON photos.user_id = users.id;
