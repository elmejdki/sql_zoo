SELECT COUNT(*)
FROM stops;


SELECT id
FROM stops
WHERE name = 'Craiglockhart';


SELECT id, name
FROM route JOIN stops ON stop = id
WHERE num = 4 AND company = "LRT"
ORDER BY pos;


SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;


SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;


SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name = 'Leith';


SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross';


SELECT DISTINCT stopa.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'
ORDER BY a.num, a.pos;


SELECT a.num, a.company, stopb.name, d.num, d.company
FROM 
  route a 
    JOIN route b on ( a.num = b.num and a.company = b.company) 
    JOIN route c on b.stop = c.stop 
    JOIN route d on (
      c.num = d.num and 
      c.company = d.company and 
      d.stop = 147 
    )
    JOIN stops stopa on a.stop = stopa.id 
    JOIN stops stopb on b.stop = stopb.id
where a.stop = 53
order by a.num, stopb.name, d.num
