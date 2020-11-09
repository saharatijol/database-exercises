USE instagram_clone_db;

-- Let's prevent instagram self-follows with triggers
-- NOT the best solution for actual application.

-- IF NEW.follower_id = NEW.followee_id

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


