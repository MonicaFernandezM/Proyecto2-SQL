-- CREATE DATABASE proyecto_sql_rock; 
USE proyecto_sql_rock; 

-- Creando tabla artist and PRIMARY KEY
DROP TABLE IF EXISTS artists;
CREATE TABLE artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) UNIQUE
);

INSERT INTO artists (artist_name)
SELECT DISTINCT artist_name FROM spotify_clean
UNION
SELECT DISTINCT artist_name FROM rock_clean
UNION
SELECT DISTINCT artist_name FROM billboard_clean;

-- spotify con artists 
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE spotify_clean ADD COLUMN artist_id INT;

UPDATE spotify_clean s
JOIN artists a 
ON s.artist_name = a.artist_name
SET s.artist_id = a.artist_id;

-- billboard con artists
ALTER TABLE billboard_clean ADD COLUMN artist_id INT;

UPDATE billboard_clean b
JOIN artists a 
  ON b.artist_name = a.artist_name
SET b.artist_id = a.artist_id;

-- rock con artists
ALTER TABLE rock_clean ADD COLUMN artist_id INT;

UPDATE rock_clean r
JOIN artists a 
ON r.artist_name = a.artist_name
SET r.artist_id = a.artist_id;


SELECT COUNT(*) FROM spotify_clean WHERE artist_id IS NULL;
SELECT COUNT(*) FROM rock_clean WHERE artist_id IS NULL;
SELECT COUNT(*) FROM billboard_clean WHERE artist_id IS NULL;

-- creando Foreign key
ALTER TABLE spotify_clean
ADD CONSTRAINT fk_spotify_artist
FOREIGN KEY (artist_id)
REFERENCES artists(artist_id);

ALTER TABLE rock_clean
ADD CONSTRAINT fk_rock_artist
FOREIGN KEY (artist_id)
REFERENCES artists(artist_id);

ALTER TABLE billboard_clean
ADD CONSTRAINT fk_billboard_artist
FOREIGN KEY (artist_id)
REFERENCES artists(artist_id);
