--q1 How many different segments do you see?
SELECT segment, 
	COUNT(*)
FROM subscriptions
GROUP BY segment;

--q2 Determine range of month of data provided. Which months will you be able to calculate churn for?
SELECT MIN(subscription_start), 
	MAX(subscription_start)
FROM subscriptions;

--q3 You’ll be calculating the churn rate for both segments (87 and 30) over the first 3 months of 2017.
WITH months AS 
(
  SELECT 
    '2017-01-01' as first_day,
    '2017-01-31' as last_day
  UNION
  SELECT
  	'2017-02-01' as first_day,
  	'2017-02-28' as last_day
  UNION
  SELECT
  	'2017-03-01' as first_day,
  	'2017-03-31' as last_day
)
SELECT *
FROM months;

--q4 Create a temporary table, cross_join, from subscriptions and your months.
WITH months AS 
(
  SELECT 
    '2017-01-01' as first_day,
    '2017-01-31' as last_day
  UNION
  SELECT
  	'2017-02-01' as first_day,
  	'2017-02-28' as last_day
  UNION
  SELECT
  	'2017-03-01' as first_day,
  	'2017-03-31' as last_day
),
cross_join AS
(
  SELECT *
  FROM subscriptions
  CROSS JOIN months
),

--q5 Create a temporary table, status, from the cross_join table you created.
status AS
(
	SELECT id,
  	first_day AS 'month',
  	CASE
  		WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND (segment = 87) THEN 1
  			ELSE 0
  		END AS 'is_active_87',
  	CASE
  		WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND (segment = 30) THEN 1
  			ELSE 0
  		END AS 'is_active_30'
	FROM cross_join
)
SELECT *
FROM status
LIMIT 10;

--q6 Add an is_canceled_87 and an is_canceled_30 column to the status temporary table. This should be 1 if the subscription is canceled during the month and 0 otherwise.
WITH months AS 
(
  SELECT 
    '2017-01-01' as first_day,
    '2017-01-31' as last_day
  UNION
  SELECT
  	'2017-02-01' as first_day,
  	'2017-02-28' as last_day
  UNION
  SELECT
  	'2017-03-01' as first_day,
  	'2017-03-31' as last_day
),
cross_join AS
(
  SELECT *
  FROM subscriptions
  CROSS JOIN months
),
status AS
(
	SELECT id,
  	first_day AS 'month',
  	CASE
  		WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND (segment = 87) THEN 1
  			ELSE 0
  		END AS 'is_active_87',
  	CASE
  		WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND (segment = 30) THEN 1
  			ELSE 0
  		END AS 'is_active_30',
  	CASE
  		WHEN (subscription_end IS NOT NULL AND subscription_end BETWEEN first_day AND last_day) 
  					AND (segment = 87) THEN 1
  			ELSE 0
  		END AS 'is_canceled_87',
  CASE
  		WHEN (subscription_end IS NOT NULL AND subscription_end BETWEEN first_day AND last_day) 
  					AND (segment = 30) THEN 1
  			ELSE 0
  		END AS 'is_canceled_30'
	FROM cross_join
),

--q7 Create a status_aggregate temporary table that is a SUM of the active and canceled subscriptions for each segment, for each month.
status_aggregate AS
(
  SELECT month,
    SUM(is_active_87) AS 'sum_active_87',
    SUM(is_active_30) AS 'sum_active_30',
    SUM(is_canceled_87) AS 'sum_canceled_87',
    SUM(is_canceled_30) AS 'sum_canceled_30'
  FROM status
  GROUP BY month
)
--q8 Calculate the churn rates for the two segments over the three month period. Which segment has a lower churn rate?
SELECT month,
	ROUND((1.0 * sum_canceled_87 / sum_active_87) * 100, 2) AS 'churn_87',
	ROUND((1.0 * sum_canceled_30 / sum_active_30) * 100, 2) AS 'churn_30'
  FROM status_aggregate
  GROUP BY month;
