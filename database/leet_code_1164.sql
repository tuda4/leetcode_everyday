
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.

** Analyze:
- Find the latest change_date for each product_id before 2019-08-16
- If there is no change_date for a product_id, then the price is 10
- If there is a change_date for a product_id, then the price is new_price
** Solution:
with a as (
select product_id, max(change_date) as change_date from products
where change_date <= '2019-08-16'
group by product_id
)
select a.product_id, p.new_price as price
from a
left join products as p on (a.product_id = p.product_id and a.change_date = p.change_date)
union
select product_id, 10 as prices from products
group by product_id
having min(change_date) > '2019-08-16';