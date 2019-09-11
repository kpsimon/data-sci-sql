 --q1 Check out the table.
 SELECT *
 FROM transactions
 LIMIT 1;
 
 --q2 The money_in column records the amount (in USD) the user bought.What is the total money_in in the table?
 SELECT SUM(money_in)
 FROM transactions;
 
 --q3 The money_out column records the amount (in USD) the user sold. What is the total money_out in the table?
 SELECT SUM(money_out)
 FROM transactions;
 
 --q4 How many money_in transactions are in this table? How many money_in transactions are in this table where ‘BIT’ is the currency?
 SELECT COUNT(money_in)
 FROM transactions;
 
 SELECT COUNT(money_in)
 FROM transactions
 WHERE currency = "BIT";
 
 --q5 What was the largest transaction in this whole table? Was it money_in or money_out?
SELECT MAX(money_in),
	MAX(money_out)
FROM transactions;
 
 --q6 What is the average money_in in the table for the currency Ethereum (‘ETH’)?
SELECT currency,
 	AVG(money_in)
FROM transactions
WHERE currency = 'ETH';
 
 --q7 Select date, average money_in, and average money_out from the table. And group everything by date.
SELECT date,
	AVG(money_in),
  AVG(money_out)
FROM transactions
GROUP BY date
ORDER BY date;
 
 --q8 round the averages to 2 decimal places. Give the column aliases using AS for readability.
 SELECT date,
	ROUND(AVG(money_in),2) AS ' avg money in',
  ROUND(AVG(money_out),2) AS 'avg money out'
FROM transactions
GROUP BY date
ORDER BY date;
