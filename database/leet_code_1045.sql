Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

** Analyze:
- We need to find the customer ids from the Customer table that bought all the products in the Product table.
- We can use the COUNT() function to count the number of products for each customer, and then use the COUNT() function to count the number of products in the Product table. If the number of products for each customer is equal to the number of products in the Product table, then the customer bought all the products in the Product table.

** Solution:
select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(product_key) from product);