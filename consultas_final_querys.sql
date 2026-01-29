-- Hipotesis 1: los artistas asociados al rock aparecen con frecuencia en decadas pasadas

-- 1. Artistas de rock aparecen en billboard
SELECT 
COUNT(DISTINCT b.artist_id) AS rock_artist
FROM billboard_clean AS b
INNER JOIN rock_clean AS r 
ON b.artist_id = r.artist_id;
-- 72 artistas de rock en billboard

-- 2. % de artistas de rock dentro de billboard
SELECT 
(COUNT(DISTINCT r.artist_id) / COUNT(DISTINCT b.artist_id) * 100) AS pct_rock
FROM billboard_clean as b
LEFT JOIN rock_clean AS r 
ON r.artist_id = b.artist_id;
-- 2.63% dentro de los billboard

-- 3. evolución por década en % 
SELECT
FLOOR(b.year / 10) * 10 AS decade,
ROUND(SUM(CASE WHEN r.artist_id IS NOT NULL THEN 1 ELSE 0 END)
/ COUNT(*) * 100,2) AS pct_rock
FROM billboard_clean b
LEFT JOIN rock_clean r
ON b.artist_id = r.artist_id
GROUP BY decade
ORDER BY decade;
-- 1960 -> 84%, 1970 -> 97%, 1980 -> 97%, 1990 -> 90%, 2000 -> 68%, 2010 en adelante -> 0
-- ( 68% de rock en spotify)

-- Hipotesis 2: En la actualidad, el rock tiene menor peso en las plataformas de streaming?
-- 4. AVG(propularity) ROCK vs Not Rock 

SELECT 
CASE 
	WHEN r.artist_id IS NOT NULL THEN 'Rock'
    ELSE 'Not-Rock'
END AS category, 
AVG(s.popularity) AS avg_s_popularity
FROM spotify_clean AS s
LEFT JOIN rock_clean AS r
ON s.artist_id = r.artist_id
GROUP BY category;
-- not-rock: 52, Rock: 61

-- 5.Top artistas rock en la actualidad
SELECT
a.artist_name,
AVG(s.popularity) AS avg_popularity
FROM spotify_clean s
JOIN rock_clean r
ON s.artist_id = r.artist_id
JOIN artists a
ON s.artist_id = a.artist_id
GROUP BY a.artist_id
ORDER BY avg_popularity DESC
LIMIT 15;

-- Hipotesis 3. Actual vs. Históico 
-- spotify
SELECT
ROUND(
SUM(CASE WHEN r.artist_id IS NOT NULL THEN 1 ELSE 0 END)/ COUNT(*) * 100, 2) AS pct_rock_spotify
FROM spotify_clean s
LEFT JOIN rock_clean r
ON s.artist_id = r.artist_id;
-- 68% de rock en spotify