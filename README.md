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


