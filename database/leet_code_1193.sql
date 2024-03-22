Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.

The query result format is in the following example.

** Analyze:
- Group by month and country
- Count the number of transactions and their total amount
- Count the number of approved transactions and their total amount

** Sulotion:

SELECT
	TO_CHAR(DATE_TRUNC('month', trans_date)::date, 'YYYY-MM') AS "month",
	country,
	count(state) as trans_count,
	sum(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count,
	sum(amount) as trans_total_amount,
	sum(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM transactions
GROUP BY country, DATE_TRUNC('month', trans_date)::date;