SELECT name
FROM person
WHERE gender IN ('female')
  AND age > 25
ORDER BY name;