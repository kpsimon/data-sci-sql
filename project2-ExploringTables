SELECT *
FROM nomnom;

-- DISTINCT shows unique values
SELECT DISTINCT neighborhood
FROM nomnom;

SELECT DISTINCT cuisine
FROM nomnom;

SELECT *
FROM nomnom
WHERE cuisine = 'Chinese';

-- ORDER BY col ASC/DESC to sort (always after WHERE if in code)
SELECT *
FROM nomnom
WHERE review > 4
ORDER BY review ASC;

SELECT *
FROM nomnom
WHERE cuisine = 'Italian' 
	AND price = '$$$';
  
-- col LIKE val to find values that are similar to val
-- can use _ for single unknown or %string to find any value 
-- ending with string.
SELECT *
FROM nomnom
WHERE name LIKE '%meatball%';

-- can use OR and AND multiple times.
SELECT *
FROM nomnom
WHERE neighborhood = 'Midtown'
	OR neighborhood = 'Downtown'
  OR neighborhood = 'Chinatown'
ORDER BY review ASC;
  
-- use IS NULL or IS NOT NULL to find holes in data.
SELECT *
FROM nomnom
WHERE health IS NULL;

-- use LIMIT and ORDER BY to create rankings
SELECT *
FROM nomnom
ORDER BY review DESC
LIMIT 10;

-- CASE statement uses WHEN and END
SELECT name, cuisine,
CASE
	WHEN review > 4.5 THEN 'Extraordinary'
  WHEN review > 4 THEN 'Excellent'
  WHEN review > 3 THEN 'Good'
  WHEN review > 2 THEN 'Fair'
  ELSE 'Poor'
END AS 'Rating'
FROM nomnom;
