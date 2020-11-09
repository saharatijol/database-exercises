USE instagram_clone_db;

# Let's prevent instagram self-follows with triggers
-- NOT the best solution for actual application.

DELIMITER $$

CREATE TRIGGER prevent_self_follows
    BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
        IF NEW.follower_id = NEW.followee_id
            THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'You cannot follow yourself!';
        end if;
    end;
$$

DELIMITER ;

-- Code below will NOT insert because of the trigger
-- INSERT INTO follows(follower_id, followee_id) VALUES(5, 5);

-- SELECT * from users;

# Creating Logger Triggers - keep track of when somebody unfollows someone
-- Basically, log your unfollows

CREATE TABLE unfollows (
       follower_id INT NOT NULL,
       followee_id INT NOT NULL,
       created_at TIMESTAMP DEFAULT NOW(),
       FOREIGN KEY (follower_id) REFERENCES users(id),
       FOREIGN KEY (followee_id) REFERENCES users(id),
       PRIMARY KEY (follower_id, followee_id)
);

DELIMITER $$

CREATE TRIGGER capture_unfollow
    AFTER DELETE ON follows FOR EACH ROW
    BEGIN
        INSERT INTO unfollows
        SET follower_id = OLD.follower_id,
            followee_id = OLD.followee_id;
    END;
$$

DELIMITER ;

SELECT * FROM unfollows; -- currently empty
SELECT * FROM follows LIMIT 5;

DELETE FROM follows WHERE follower_id = 2 AND followee_id = 1;
SELECT * FROM unfollows; -- only 1 in table

DELETE FROM follows WHERE follower_id = 3; -- 99 rows affected
SELECT * FROM unfollows;

# LIST TRIGGERS
SHOW TRIGGERS;

# REMOVE TRIGGERS
DROP TRIGGER capture_unfollow; -- I did not run this

-- TIP: Triggers can make debugging hard! Avoid triggers as much as you can. Don't create too many of them






