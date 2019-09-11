--q1 What are the column names?
SELECT * 
FROM trips;

SELECT * 
FROM riders;

SELECT * 
FROM cars;

--q2 What’s the primary key of trips? What’s the primary key of riders? What’s the primary key of cars?
SELECT id
FROM trips;
--id column for each table

--q3 Try out a simple cross join between riders and cars. Is the result useful? No.
SELECT *
FROM riders
CROSS JOIN cars;

--q4 Suppose we want to create a Trip Log with the trips and its users. Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN. Let trips be the left table.
SELECT *
FROM trips
LEFT JOIN riders
	ON trips.rider_id = riders.id;

--q5 Find the columns to join on and combine the trips and cars table using an INNER JOIN
SELECT *
FROM trips
INNER JOIN cars
	ON trips.car_id = cars.id;

--q6 Stack the riders table on top of the new table named riders2.
SELECT * 
FROM riders
UNION
SELECT *
FROM riders2;

--q7 What is the average cost for a trip?
SELECT ROUND(AVG(cost),2)
FROM trips;

--q8 REBU is looking to do an email campaign for all the irregular users. Find all the riders who have used REBU less than 500 times!
SELECT first,
	last,
  username
FROM riders
WHERE total_trips < 500
UNION
SELECT first,
	last,
  username
FROM riders2
WHERE total_trips < 500
ORDER BY last;

--q9 Calculate the number of cars that are active.
SELECT COUNT(*) AS 'active cars'
FROM cars
WHERE status = 'active';

--q10 Write a query that finds the two cars that have the highest trips_completed.
SELECT * 
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
