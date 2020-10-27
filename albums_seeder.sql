USE codeup_test_db;

TRUNCATE albums;

INSERT INTO albums (artist, name, release_date, genre, sales)
VALUES  ('Eagles', 'Hotel California', 1976, 'Rock, Soft Rock', 32),
        ('Michael Jackson', 'Thriller', 1982, 'Pop, Funk, Rock', 66),
        ('AC/DC', 'Back In Black', 1980, 'Metal, Hard Rock', 50),
        ('Led Zeppelin', 'Led Zeppelin IV', 1971, 'Hard Rock, Blues Rock', 35),
        ('Pink Floyd', 'The Wall', 1979, 'Art Rock, Progressive Rock', 30),
        ('Hootie & The Blowfish', 'Cracked Rear View', 1994, 'Alternative Rock, Roots Rock', 21),
        ('Fleetwood Mac', 'Rumours', 1977, 'Pop Rock, Soft Rock, Folk Rock', 40),
        ('Guns N'' Roses', 'Appetite for Destruction', 1987, 'Hard Rock, Heavy Metal', 30),
        ('Boston', 'Boston', 1976, 'Hard Rock, Progressive Rock', 17),
        ('Led Zeppelin', 'Physical Graffiti', 1975, 'Rock', 16),
        ('Metallica', 'Metallica', 1991, 'Heavy Metal', 31),
        ('Bob Marley & The Wailers', 'Legend', 1984, 'Roots Reggae', 28),
        ('Pink Floyd', 'Dark Side of the Moon', 1973, 'Progressive Rock', 45),
        ('Santana', 'Supernatural', 1999, 'Latin Rock', 15),
        ('Meat Loaf', 'Bat Out of Hell', 1977, 'Hard Rock', 43),
        ('Def Leppard', 'Hyteria', 1987, 'Hard Rock', 20),
        ('Kenny G', 'Breathless', 1992, 'Smooth Jazz', 20),
        ('Jimi Hendrix', 'Electric Ladyland', 1968, 'Rock, Blues', 20),
        ('Queen', 'Greatest Hits', 1981, 'Rock', 25),
        ('Prince', 'Purple Rain', 1984, 'Rock, Psychedelia, Pop', 21);