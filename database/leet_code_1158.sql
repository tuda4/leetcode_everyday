Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) of this table.
This table has the info of the users of an online shopping website where users can sell and buy items.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| item_id       | int     |
| buyer_id      | int     |
| seller_id     | int     |
+---------------+---------+
order_id is the primary key (column with unique values) of this table.
item_id is a foreign key (reference column) to the Items table.
buyer_id and seller_id are foreign keys to the Users table.
 

Table: Items

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| item_id       | int     |
| item_brand    | varchar |
+---------------+---------+
item_id is the primary key (column with unique values) of this table.
 

Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.

Return the result table in any order.

The result format is in the following example.

** Analyze:
- Count the number of orders made by each user as a buyer in 2019
- Join the Users table with the Orders table on the buyer_id column
- Filter the orders made in 2019
- Group the result by the user_id column
- Select the user_id, join_date, and the number of orders made by each user as a buyer in 2019

** Solution:
WITH a AS (
	SELECT u.user_id as buyer_id, SUM(CASE WHEN EXTRACT(year FROM o.order_date) = 2019::numeric THEN 1 ELSE 0 END)
	FROM users AS u
	LEFT JOIN orders AS o ON u.user_id = o.buyer_id
	GROUP BY u.user_id
)
SELECT a.buyer_id, u.join_date, a.sum as orders_in_2019
FROM users AS u
LEFT JOIN a ON a.buyer_id = u.user_id;