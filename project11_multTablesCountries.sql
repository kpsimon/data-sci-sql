-- How many entries in the database are from Africa?
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';


-- What was the total population of Oceania in 2005?
SELECT countries.continent,
	population_years.year,
	ROUND(SUM(population_years.population),1) AS 'avg population'
FROM countries
INNER JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.continent = 'Oceania'
	AND population_years.year = 2005;


-- What is the average population of countries in South America in 2003?
SELECT countries.name,
	population_years.year,
	ROUND(AVG(population_years.population),1) AS 'avg population'
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.continent = 'South America'
	AND population_years.year = 2003;


-- What country had the smallest population in 2007?
SELECT countries.name,
	population_years.year,
	MIN(population_years.population) AS 'population'
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id;



-- What is the average population of Poland during the time period covered by this dataset?
SELECT countries.name,
	ROUND(AVG(population_years.population),2) AS 'avg population'
FROM countries
JOIN population_years
	ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';


-- How many countries have the word "The" in their name?
SELECT COUNT(*)
FROM countries
WHERE name LIKE '%the%';


-- What was the total population of each continent in 2010?
SELECT countries.continent,
	ROUND(SUM(population_years.population),2) AS 'total population',
	population_years.year
FROM population_years
JOIN countries
	ON population_years.country_id = countries.id
WHERE population_years.year = 2010
GROUP BY countries.continent
ORDER BY 2 DESC;

