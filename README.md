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
### NOT Exercises

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
WHERE standard_qty >= 1000 AND poster_qty = 0 AND gloss_qty = 0;

SELECT name
FROM accounts
WHERE name NOT IN ('C%', '%s') -- first attempt
WHERE name NOT LIKE 'C%' AND name LIKE '%s'; -- better solution
ORDER BY name; -- this line is for viewability

SELECT gloss_qty
FROM orders
WHERE gloss_qty NOT BETWEEN 24 AND 29
ORDER BY gloss_qty DESC; -- for readability
-- end point values are included in query results

SELECT channel, occurred_at
FROM web_events
WHERE occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at DESC;
```
### OR Operator

```mysql
/* Building logic to find which company's orders omitted one or more paper types*/

SELECT  account_id,
        occurred_at,
        standard_qty,
        gloss_qty,
        poster_qty
FROM orders
WHERE standard_qty = 0 OR gloss_qty = 0 OR poster_qty = 0;

-- OR can be combined with other operators with parenthesis

-- Find orders where either gloss or poster qty is > 4000
SELECT id
FROM orders
WHERE gloss_qty >= 4000 OR poster_qty >= 4000;

/* find orders where standard_qty is 0 and either gloss or poster
qty is over 1000 */

SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000)
ORDER BY total -- for readability

/* find all the company names that start with a 'C' or 'W', and 
the primary contact contains 'ana' or 'Ana', but doesn't contain
'eana' */

SELECT name, primary_poc
FROM accounts
WHERE name 'C%' OR 'W%'

-- if an example query mentions the word 'contains' use '%word%';

 SELECT name, primary_poc
 FROM accounts
 WHERE (name LIKE 'C%' OR name LIKE 'W%')
       AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
       AND primary_poc NOT LIKE '%eana%')
ORDER BY primary_poc;
```

### Recap

```mysql
-- commands learned so far
SELECT: -- provide the coumns you want
FROM: -- table where the columns exist
LIMIT -- limits based number of rows returned
ORDER BY -- orders table based on the column. Used with DESC
WHERE -- conditional statement to filter your results
LIKE -- WHERE Col LIKE '%me%' pulls rows where column has 'me'
IN -- WHERE col IN ('y', 'N')
NOT -- NOT is frequently used with LIKE and IN
AND -- Filter rows where two or more ondition MUST be True
OR -- filter rows where at least one condition must be met
BETWEEN -- Ofter easier syntax than using an AND 

-- KEY TERMS
CREATE TABLE -- statement that creates a new table
DROP TABLE -- statement that removes a table in a db
-- Entity-relationship diagram (ERD) common way to view a db
FROM -- specifies from which table(s) you want to select from
SELECT -- allows you to read and display data; called a query

-- Proper Order to write statements in
SELECT col1, col2
FROM table1
WHERE col3 > 5 AND col4 LIKE '%os%'
ORDER BY col5 DESC
LIMIT 10;
```
### Database Normailzation

```mysql
-- Things to think about for data normalization

-- 1. Are the tables storing logical groupings of data?
-- 2. Can I make changes in a single location not multiple locations?
-- 3. Can I access and manipultae data quickly and efficiently?
```

### Joins

```mysql
JOIN
 ON /*specifies a logical statement to combine the table in 
     FROM & JOIN statement*/

-- EXAMPLE JOIN STATEMENT

SELECT orders.*, accounts.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id; -- holds the two cross-table links
```
### ON clause

ON is a link from our Primary Key (PK) to equal the Foreign Key (FK)
ON PK = FK
```mysql
SELECT orders.standard_qty,
       orders.gloss_qty,
       orders.poster_qty, 
       accounts.website,
       accounts.primary_poc
FROM orders 
JOIN accounts
ON accounts.id = orders.account_id;
```
### Alias

```mysql
orders o -- one space after the orders name and an 'o' will rename order to 'o'

-- quiz questions

-- 1. Mar all that are true
    -- a. The on statment should always occur wit thte fk = pk
    -- b. JOIN statements allow us to pull data from multiple SQL db

-- 2. Select all statements that are true
    -- a. Aliasing is common to shorten table names when we start JOINing tables

```
### Quiz: JOIN Questions Part 1


```mysql
-- Question 1
-- My attempt
SELECT r.name,
       s.name,
       a.name
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id;

--- What I missed
-- more than 2 columns have the same name; must alias them
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

-- Question 2
SELECT r.name region, a.name account, total_amount_usd

SELECT r.name region_name,
       a.name account_name,
       o.total_amt_usd unit_price
FROM accounts a
JOIN orders o
ON o.account_id = a.id
JOIN region r
ON a.region_id = r.id;

-- Question 3
SELECT r.name region, a.name account,
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;
```

### INNER JOIN

```mysql
-- INNER JOIN: only returns rows that appear in both tables

/* To include data this is only in one of our tables in our 
join statment, we use LEFT or RIGHT JOIN */

-- stick to using left joins as they yield the same results
-- consistency is most important esp. w/ multiple joins

SELECT 
FROM -- left table name

OIN -- right table name
OIN -- right table name
OIN -- right table name
```
#### LEFT and RIGHT JOINs

```mysql

OIN -- right table name ```
