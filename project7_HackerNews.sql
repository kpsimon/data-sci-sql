 SELECT * FROM hacker_news
 LIMIT 5;
 
 --q1 What are the top five stories with the highest scores?
 SELECT title, score
 FROM hacker_news
 ORDER BY score DESC
 LIMIT 5;
 
-- 'Recent studies have found that online forums tend to be dominated by a small percentage of their users (1-9-90 Rule).
-- Is this true of Hacker News?
-- Is a small percentage of Hacker News submitters taking the majority of the points?'

 --q2 First, find the total score of all the stories.
 SELECT SUM(score) AS 'total score'
 FROM hacker_news;
 
 --q3 Find the individual users who have gotten combined scores of more than 200, and their combined scores.
 SELECT user,
 	SUM(score)
FROM hacker_news
GROUP BY 1
HAVING SUM(score) > 200
ORDER BY 2 DESC;
 
 --q4 We want to add these users’ scores together and divide by the total to get the percentage.
 SELECT(517.0+309.0+304.0+282.0)/6366.0;
 
 --q5 How many times has each offending user posted this link? https://www.youtube.com/watch?v=dQw4w9WgXcQ
 SELECT user, 
 	COUNT(url)
 FROM hacker_news
 WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
 GROUP BY 1
 ORDER BY 2 DESC;
 
 --q6/7 Which of these sites feed Hacker News the most: GitHub, Medium, or New York Times?
 SELECT CASE
 	WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'NYT'
  ELSE 'Other'
END AS 'Source',
COUNT(*)
FROM hacker_news
GROUP BY Source
ORDER BY 2 DESC;
 
 --q8/9 What’s the best time of the day to post a story on Hacker News? SQLite comes with a strftime() function - What do you think this does?
SELECT timestamp,
 	strftime('%H', timestamp)
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
LIMIT 1;
 
--q10 Let’s write a query that returns three columns: The hours of the timestamp, The average score for each hour, The count of stories for each hour
 SELECT strftime('%H', timestamp) AS 'Hour',
 	AVG(score) AS 'Avg Score',
  COUNT(*) AS '# Posts'
FROM hacker_news
GROUP BY 1
ORDER BY 1 ASC;
 
 --q11 Round the average scores (ROUND()). Rename the columns to make it more readable (AS). Add a WHERE clause to filter out the NULL values in timestamp. Take a look at the result again: What are the best hours to post a story on Hacker News?
 SELECT strftime('%H', timestamp) AS 'Hour',
 	ROUND(AVG(score)) AS 'Avg Score',
  COUNT(*) AS '# Posts'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 1 ASC;
