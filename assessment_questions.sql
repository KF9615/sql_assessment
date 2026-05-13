USE userprogressdb;

-- 1. Analyse the data
-- Hint: use a SELECT statement via a JOIN to sample the data
-- ****************************************************************
SELECT u.*, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u JOIN progress p ON u.user_id = p.user_id;


-- 2. What are the Top 25 schools (.edu domains)?
-- Hint: use an aggregate function to COUNT() schools with most students
-- ****************************************************************

SELECT email_domain, COUNT(user_id) AS total_users
FROM users
GROUP BY email_domain
ORDER BY total_users DESC
LIMIT 25;

-- 3. How many .edu learners are located in New York?
-- Hint: use an aggregate function to COUNT() students in New York
-- ****************************************************************]

SELECT city, COUNT(user_id) AS total_users
FROM users
WHERE city = 'New York'
GROUP BY city;

-- 4. The mobile_app column contains either mobile-user or NULL. 
-- How many of these learners are using the mobile app?
-- Hint: COUNT()...WHERE...IN()...GROUP BY...
-- Hint: Alternate answers are accepted.
-- ****************************************************************

SELECT mobile_app, COUNT(User_id) AS total_users
from users
WHERE mobile_app IN ('mobile-user')
GROUP BY mobile_app;

-- 5. Query for the sign up counts for each hour.
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
-- ****************************************************************
SELECT HOUR(STR_TO_DATE(sign_up_at, '%m %d %Y %r')) AS signup_hour,
COUNT(*) AS total_signups
FROM users
GROUP BY signup_hour
ORDER BY signup_hour;

-- 6. What courses are the New Yorker Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++"
-- ****************************************************************
-- SELECT *
-- FROM users
-- JOIN progress
-- ON users.user_id = progress.user_id;

SELECT SUM(CASE WHEN learn_cpp NOT IN('') THEN 1
ELSE 0
END)
AS "New Yorker learners taking C++"
FROM users
JOIN progress
ON users.user_id = progress.user_id
WHERE users.city = 'New York';

-- 7. What courses are the Chicago Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++"
-- ****************************************************************
