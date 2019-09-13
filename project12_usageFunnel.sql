--q1 Select all columns from the first 10 rows. What columns does the table have?
SELECT *
FROM survey
LIMIT 10;

--q2 Create a quiz funnel.
SELECT question,
	COUNT(*) AS '# responses'
FROM survey
GROUP BY question
ORDER BY question;

--q3 Using a spreadsheet program like Excel or Google Sheets, calculate the percentage of users who answer each question.
-- 475/500*100 = 95%
-- 380/475*100 = 80%
-- 361/380*100 = 95%
-- 270/361*100 = 75%
	
--q4 Examine the first five rows of each table.
SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

--q5 Combine the three tables, starting with the top of the funnel (browse) and ending with the bottom of the funnel (purchase).
-- If the user has any entries in home_try_on, then is_home_try_on will be ‘True’.
-- number_of_pairs comes from home_try_on table
-- If the user has any entries in is_purchase, then is_purchase will be ‘True’.
SELECT quiz.user_id,
	CASE 
  	WHEN home_try_on.user_id IS NOT NULL THEN 'True'
    ELSE 'False'
  END AS 'is_home_try_on',
  home_try_on.number_of_pairs,
  CASE 
  	WHEN purchase.user_id IS NOT NULL THEN 'True'
    ELSE 'False'
  END AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
	ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
	ON quiz.user_id = purchase.user_id
  LIMIT 10;

--q6 We can compare conversion from quiz→home_try_on and home_try_on→purchase.
WITH funnel AS (
  SELECT quiz.user_id,
	CASE 
  	WHEN home_try_on.user_id IS NOT NULL THEN 'True'
    ELSE 'False'
  END AS 'is_home_try_on',
  home_try_on.number_of_pairs,
  CASE 
  	WHEN purchase.user_id IS NOT NULL THEN 'True'
    ELSE 'False'
  END AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
	ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
	ON quiz.user_id = purchase.user_id
)
SELECT COUNT(DISTINCT user_id) AS '# users',
	(SUM(CASE 
         WHEN is_home_try_on = 'True' THEN 1 
         ELSE 0 
    	 END)
  ) AS '# home trials',
  (SUM(CASE 
       	WHEN is_purchase = 'True' THEN 1 
       	ELSE 0 
       END)) AS '# purchases',
  (SUM(CASE WHEN is_home_try_on = 'True' THEN 1.0 ELSE 0 END) /
          COUNT(DISTINCT user_id)) AS '% quiz to home',
  (SUM(CASE WHEN is_purchase = 'True' THEN 1.0 ELSE 0 END) /
        SUM(CASE WHEN is_home_try_on = 'True' THEN 1.0 END)
       ) AS '% home to purchase'
FROM funnel
LIMIT 10;

--q7 Calculate the difference in purchase rates between customers who had 3 number_of_pairs with ones who had 5.
WITH funnel AS (
  SELECT quiz.user_id,
	CASE 
  	WHEN home_try_on.user_id IS NOT NULL THEN 'True'
    ELSE 'False'
  END AS 'is_home_try_on',
  home_try_on.number_of_pairs,
  CASE 
  	WHEN purchase.user_id IS NOT NULL THEN 'True'
    ELSE 'False'
  END AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
	ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
	ON quiz.user_id = purchase.user_id
)
SELECT number_of_pairs,
  100 * ROUND((SUM(CASE WHEN is_purchase = 'True' THEN 1.0 ELSE 0 END) /
        SUM(CASE WHEN is_home_try_on = 'True' THEN 1.0 END)
       ),2) AS '% purchase'
FROM funnel
WHERE number_of_pairs IS NOT NULL
GROUP BY 1;

--q8 The most common results of the style quiz.
SELECT question,
	response,
	count(*)
FROM survey
WHERE question LIKE '1.%'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 5;

SELECT question,
	response,
	count(*)
FROM survey
WHERE question LIKE '2.%'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 5;

SELECT question,
	response,
	count(*)
FROM survey
WHERE question LIKE '3.%'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 5;

SELECT question,
	response,
	count(*)
FROM survey
WHERE question LIKE '4.%'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 5;

SELECT question,
	response,
	count(*)
FROM survey
WHERE question LIKE '5.%'
GROUP BY 2
ORDER BY 3 DESC
LIMIT 5;

--q9 The most common types of purchase made.
SELECT product_id,
	model_name,
	style,
  color,
  count(*)
FROM purchase
GROUP BY 1
ORDER BY 5 DESC;


