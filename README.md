# python-for-data-science
## Notes on Python for Data Scince

```mysql

SELECT that

FROM this 

LIMIT 
```
### Logical Operators

```mysql
LIKE -- similar to WHERE and = for cases you might not know exact condition
IN -- similar to WHERE and = for more than one condition
NOT -- NOT LIKE NOT IN a certain condition
AND & BETWEEN -- combine where all conditions must be true
OR -- combine operators where at least one combined conditions must be met
```

```mysql
-- query for any rows that are similar to google in web_events_full Table
SELECT *
FROM web_events_full
WHERE referrer_url LIKE '%google%'; -- always use single quotes
```


### Exercise

```mysql
-- all the companies whose names start with 'C'
SELECT *
FROM accounts
WHERE name LIKE 'C%'; -- % = any number of characters after or before

-- all companies whose names contain the string 'one' somewhere w/i the name
SELECT name -- this dictates what columns you want to populate in your output
FROM accounts -- this dictates what db you want to pull from
WHERE name LIKE '%one';

-- all comapines whose names end with 's'.
SELECT name
FROM accounts
WHERE name LIKE '%s'
```
### IN

```mysql
-- double quotation marks are need if an apostrophe is within text being pulled
SELECT name, primary_poc, sales_rep_id
FROM accounts -- enter table you want to pull from after FROM keyword
WHERE name IN ('Walmart', 'Target', 'Nordstrom');
```
### NOT

```mysql
-- NOT provides the inverse results for IN, LIKE, AND similar operators

SELECT sales_rep_id, name
FROM accounts
WHERE sales_rep_id NOT IN (321500, 321570)
ORDER BY sales_rep_id;

SELECT *
FROM accounts
WHERE website NOT LIKE '%com%';
```
### NOT Exervises

```mysql
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

-- Use the accounts table to find:

-- 1. All companies whose names do not start with 'C'
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%'
ORDER BY name;

-- 2. All companies whose names do not contain the string 'one'
SELECT *
FROM accounts
WHERE name NOT LIKE '%one%'
ORDER BY name;

-- 3. All compaines whose names do not end with 's'

SELECT *
FROM accounts
WHERE name NOT LIKE '%s'
ORDER BY name;
```
### AND operator

```mysql
-- AND filters based on multiple criteria
-- AND operator allows you to run two complete logical statements

SELECT *
FROM orders
WHERE standard_qty >= 1000 AND poster_qty = 0 AND gloss_qty = 0

SELECT name
FROM accounts
WHERE name NOT BETWEEN 'C%' AND 's%';
```
