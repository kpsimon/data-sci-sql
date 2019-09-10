--q1 What years are covered in this data set?
SELECT DISTINCT year from population_years;

--q2 What is the largest population size for Gabon in this dataset?
SELECT * 
from population_years
WHERE country = 'Gabon'
ORDER BY population DESC
LIMIT 1;

--q3 What were the 10 lowest population countries in 2005?
SELECT * 
from population_years
WHERE year = 2005
ORDER BY population ASC
LIMIT 10;

--q4 What are all the distinct countries with a population of over 100 million in the year 2010?
SELECT DISTINCT country AS 'Over 100 million'
from population_years
WHERE year = 2010
	AND population > 100;


--q5 How many countries in this dataset have the word “Islands” in their name?
SELECT DISTINCT country
from population_years
WHERE country LIKE '%Islands%';

--q6 What is the difference in population between 2000 and 2010 in Indonesia?
SELECT * 
from population_years
WHERE country = 'Indonesia'
	AND year = 2010
	OR country = 'Indonesia'
	AND year = 2000;

