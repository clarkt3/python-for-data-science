/*
limit response to first 15 rows and include the date, account_id, and channel fields in
the web_events table
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;
