/*
limit response to first 15 rows and include the date, account_id, and channel fields in
the web_events table
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

-- single line comment

/*
Multi
Line
Comment
*/

### Order By
-- must come after SELECT and FROM
-- Must come before LIMIT

### DESC
-- write it after the colum in your ORDER BY statement to sorty in descending order
-- default is to sort in ascending order

SELECT *
FROM orders
ORDER BY occurred_at DESC
LIMIT 1000;

-- write a query that returns 10 earliest (DESC) order in the orders table
-- include the id, occurred_at, total_amt_usd

SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at 
LIMIT 10;

-- New query return the top 5 orders in terms of the largest total_amt_usd
-- include the id, account_id, and total_amt_usd

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

-- New Query to return the lowest 20 orders in terms of the smallest total_amt_usd
-- include the id, account_id, total_amt_usd

SELECT id, accout_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

-- Evaluator was used to check all these answers before submittal

-- don't forget your semicolons at the end of each statement

-- WHERE clause allows you to filter a set of results basedon specific criteria

-- WHERE goes after SELECT & FROM but before ORDER BY & LIMIT

-- WHERE is similar to FILTER in excel or google sheets

/*  Query that pulls 5 rows and all columns from the orders table
    that have a dollar amount of gloss_amt_usd greater than or equal to 1000
*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

/*
    QUERY: pulls the fist 10 rows and all columns from the orders table that
    have a total_amt_usd less than 500
*/

SELECT *
FROM orders
WHERE gloss_amt_usd < 500
LIMIT 10;
