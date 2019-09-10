 SELECT *
 FROM users
 LIMIT 10;
 
 --q1 Find the email addresses and birthdays of users whose birthday is between 1980-01-01 and 1989-12-31.
 SELECT email, birthday
 FROM users
 WHERE birthday BETWEEN '1980-01-01' AND '1989-12-31'
 ORDER BY birthday ASC
 LIMIT 10;
 
 --q2 We are interested in the cohort of users that signed up prior to May 2017.
 SELECT email, created_at
 FROM users
 WHERE created_at < '2017-05-01'
 ORDER BY created_at ASC
 LIMIT 10;
 
 --q3 Find the emails of the users who received the ‘bears’ test.
 SELECT email, test
 FROM users
 WHERE test = 'bears'
 LIMIT 10;
 
 --q4 Find all the emails of all users who received a campaign on website BBB.
 SELECT email, campaign
 FROM users
 WHERE campaign LIKE 'BBB%'
 LIMIT 10;
 
 --q5 Find all the emails of all users who received ad copy 2 in their campaign.
 SELECT email, campaign
 FROM users
 WHERE campaign LIKE '%2'
 LIMIT 10;
 
 --q6 Find the emails for all users who received both a campaign and a test.
 SELECT email, campaign, test
 FROM users
 WHERE campaign IS NOT NULL 
 	AND test IS NOT NULL
 LIMIT 10;
