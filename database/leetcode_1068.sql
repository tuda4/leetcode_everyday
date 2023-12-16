-- Table: Sales
--
-- +-------------+-------+
-- | Column Name | Type  |
-- +-------------+-------+
-- | sale_id     | int   |
-- | product_id  | int   |
-- | year        | int   |
-- | quantity    | int   |
-- | price       | int   |
-- +-------------+-------+
-- (sale_id, year) is the primary key (combination of columns with unique values) of this table.
-- product_id is a foreign key (reference column) to Product table.
-- Each row of this table shows a sale on the product product_id in a certain year.
-- Note that the price is per unit.
--
--
-- Table: Product
--
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- +--------------+---------+
-- product_id is the primary key (column with unique values) of this table.
-- Each row of this table indicates the product name of each product.
--
--
-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
--
-- Return the resulting table in any order.

-- Write your PostgreSQL query statement below
select s.year as year, s.price as price, p.product_name as product_name
from sales as s
left join product as p on p.product_id = s.product_id

-- leetcode 1086
-- Table: Product
--
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | int     |
-- | product_name | varchar |
-- | unit_price   | int     |
-- +--------------+---------+
-- product_id is the primary key (column with unique values) of this table.
-- Each row of this table indicates the name and the price of each product.
-- Table: Sales
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | seller_id   | int     |
-- | product_id  | int     |
-- | buyer_id    | int     |
-- | sale_date   | date    |
-- | quantity    | int     |
-- | price       | int     |
-- +-------------+---------+
-- This table can have duplicate rows.
-- product_id is a foreign key (reference column) to the Product table.
-- Each row of this table contains some information about one sale.
--
--
-- Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
--
-- Return the result table in any order.

select product_id, product_name
from product
where product_id in (
    select product_id
    from sales
    where sale_date between '2019-01-01' and '2019-03-31'
) and product_id not in (
    select product_id
    from sales
    where sale_date not between '2019-01-01' and '2019-03-31'
);