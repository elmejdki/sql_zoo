SELECT name
FROM world
WHERE population > (
    SELECT population
    FROM world
    WHERE name='Russia'
  );


SELECT name
FROM world
WHERE gdp/population > (
  SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom'
);


SELECT name
FROM world
WHERE
  continent = 'Europe' AND
  gdp/population > (
    SELECT gdp/population
    FROM world
    WHERE name = 'United Kingdom'
  );


SELECT name, continent
FROM world
WHERE
  continent IN (
    SELECT continent
    FROM world
    WHERE name IN ('Australia', 'Argentina')
  )
ORDER BY name;


SELECT name, population
FROM world
WHERE
  population > (
    SELECT population
    FROM world
    WHERE name = 'Canada'
  ) AND
  population < (
    SELECT population
    FROM world
    WHERE name = 'Poland'
  );


SELECT
  name,
  concat(
    FLOOR(
      ROUND(
        population / (
          SELECT population
          FROM world
          WHERE name = 'Germany'
        ), 2
      ) * 100
    ), '%'
  ) AS percentage
FROM world
WHERE continent = 'Europe';


SELECT name
FROM world
WHERE
  gdp > (
    SELECT MAX(gdp)
    FROM world
    WHERE continent = 'Europe'
  );


SELECT continent, name, area
FROM world x
WHERE
  area >= ALL (
    SELECT area
    FROM world y
    WHERE y.continent=x.continent
  );


SELECT continent, name
FROM world
Group BY continent;


select
  a.name,
  a.continent,
  a.population
from
  world a
where
  25000000 > (
    select
      max(b.population)
    from
      world b
    where
      b.continent = a.continent
  );

SELECT name, continent
FROM world x
WHERE
  x.population > ALL(
    SELECT y.population*3
    FROM world y
    WHERE
      x.continent = y.continent AND
      x.name <> y.name
  );
