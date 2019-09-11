 SELECT * FROM met
 LIMIT 1;
 
 --q1 How many pieces are in the American Decorative Art collection?
 SELECT COUNT(*)
 FROM met
 WHERE department = 'American Decorative Arts';
 
 --q2 Count the number of pieces where the category includes ‘celery’.
 SELECT DISTINCT category, 
 	COUNT(*)
 FROM met
 WHERE category LIKE '%celery%'
 GROUP BY 1;
 
 --q3 Find the title and medium of the oldest piece(s) in the collection.
 SELECT title,
 	medium,
  date
 FROM met
 ORDER BY date ASC
 LIMIT 10;
 
 --q4 Find the top 10 countries with the most pieces in the collection.
 SELECT country,
 	COUNT(*) AS 'amount'
 FROM met
 WHERE country IS NOT NULL
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 10;
 
 --q5 Find the categories HAVING more than 100 pieces.
 SELECT category,
 	COUNT(*) AS 'amount'
 FROM met
 GROUP BY 1
 HAVING COUNT(*) > 100
 ORDER BY 2 DESC;
 
 --q6 Count the number of pieces where the medium contains ‘gold’ or ‘silver’. And sort in descending order.
 SELECT medium,
 	COUNT(*) AS 'amount'
 FROM met
 WHERE medium LIKE '%gold%' 
 	OR medium LIKE '%silver%'
 GROUP BY 1
 ORDER BY 2 DESC;
