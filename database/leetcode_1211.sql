-- Table: Queries
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | query_name  | varchar |
-- | result      | varchar |
-- | position    | int     |
-- | rating      | int     |
-- +-------------+---------+
-- This table may have duplicate rows.
-- This table contains information collected from some queries on a database.
-- The position column has a value from 1 to 500.
-- The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.
--
--
-- We define query quality as:
--
-- The average of the ratio between query rating and its position.
--
-- We also define poor query percentage as:
--
-- The percentage of all queries with rating less than 3.
--
-- Write a solution to find each query_name, the quality and poor_query_percentage.
--
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.
--
-- Return the result table in any order.

-- solution::
-- + quality = average of rating and position
-- + percent of (rating<3) in all rating
select query_name,
       round(avg(rating ::numeric(3, 2)/position), 2) as quality,
       round(sum(case when rating < 3 then 1 else 0 end)*100 ::numeric(5, 2)/count(rating), 2) as poor_query_percentage
from queries
where query_name is not null
group by query_name;