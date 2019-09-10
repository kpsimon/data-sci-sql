SELECT * 
FROM startups
LIMIT 1;

--q1 Calculate the total number of companies in the table.
SELECT COUNT(*)
FROM startups;

--q2 We want to know the total value of all companies in this table.
SELECT SUM(valuation)
FROM startups;

--q3 What is the highest amount raised by a startup?
SELECT MAX(raised)
FROM startups;

--q4 Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';

--q5 In what year was the oldest company on the list founded?
SELECT MIN(founded)
FROM startups;

--q6 Return the average valuation.
SELECT AVG(valuation)
FROM startups;

--q7 Return the average valuation, in each category.
SELECT category, 
	AVG(valuation)
FROM startups
GROUP BY category;

--q8 Return the average valuation, in each category. Round the averages to two decimal places.
SELECT category, 
	ROUND(AVG(valuation),2)
FROM startups
GROUP BY category;

--q9 Return the average valuation, in each category. Round the averages to two decimal places. Lastly, order the list from highest averages to lowest.
SELECT category, 
	ROUND(AVG(valuation),2)
FROM startups
GROUP BY category
ORDER BY 2 DESC;

--q10 First, return the name of each category with the total number of companies that belong to it.
SELECT category,
	COUNT(*)
FROM startups
GROUP BY category;

--q11  Filter the result to only include categories that have more than three companies in them. What are the most competitive markets?
SELECT category,
	COUNT(*) AS 'companies'
FROM startups
GROUP BY category
HAVING companies > 3
ORDER BY companies DESC;

--q12 What is the average size of a startup in each location?
SELECT location,
	AVG(employees)
FROM startups
GROUP BY location;

--q13 What is the average size of a startup in each location, with average sizes above 500?
SELECT location,
	AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;
