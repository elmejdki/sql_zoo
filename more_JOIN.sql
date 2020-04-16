SELECT id, title
FROM movie
WHERE yr=1962;


SELECT yr
FROM movie
WHERE title='Citizen Kane';


SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;


SELECT id
FROM actor
WHERE name='Glenn Close';


SELECT id
FROM movie
WHERE title='Casablanca';


SELECT name
FROM casting JOIN actor ON actorid = id
WHERE movieid = 11768;


SELECT a.name
FROM movie m
  JOIN casting c ON
    c.movieid = m.id
  JOIN actor a ON
    c.actorid = a.id
WHERE m.title = 'Alien';


SELECT m.title
FROM movie m
  JOIN casting c ON
    m.id = c.movieid
  JOIN actor a ON
    c.actorid = a.id
WHERE a.name = 'Harrison Ford';


SELECT title
FROM movie m
  JOIN casting c ON
    m.id = c.movieid
  JOIN actor a ON
    c.actorid = a.id
WHERE a.name = 'Harrison Ford' AND c.ord > 1;


SELECT m.title, a.name
FROM movie m
  JOIN casting c ON
    m.id = c.movieid
  JOIN actor a ON
    c.actorid = a.id
WHERE yr = 1962 AND ord = 1;


SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;


SELECT DISTINCT m.title, a.name
FROM (SELECT movieid
      FROM casting
      WHERE actorid IN ( SELECT id
                         FROM actor
                         WHERE name = 'Julie Andrews')) cc 
      JOIN casting c ON cc.movieid = c.movieid
      JOIN movie m ON m.id = c.movieid
      JOIN actor a ON a.id = c.actorid
WHERE c.ord = 1;


SELECT name
FROM casting JOIN actor ON actorid = id
WHERE ord = 1
GROUP BY actorid
HAVING COUNT(*) >= 15
ORDER BY name;


SELECT title, COUNT(actorid)
FROM movie JOIN casting ON movieid = id
WHERE yr = 1978
GROUP BY movieid
ORDER BY COUNT(actorid) DESC, title;


SELECT DISTINCT a.name
FROM actor a
JOIN casting c ON c.actorid = id 
JOIN (SELECT movieid
      FROM casting
      WHERE actorid = (SELECT id
                       FROM actor
                       WHERE name = 'Art Garfunkel')) cc ON c.movieid = cc.movieid
WHERE a.name <> 'Art Garfunkel';
