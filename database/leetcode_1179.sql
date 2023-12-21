-- Table: Department
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | revenue     | int     |
-- | month       | varchar |
-- +-------------+---------+
-- In SQL,(id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
--
--
-- Reformat the table such that there is a department id column and a revenue column for each month.
--
-- Return the result table in any order.

-- Solution: reformat with operator case and func sum()
select id,
       sum (case when month = 'Jan' then revenue else null end) as "Jan_Revenue",
       sum (case when month = 'Feb' then revenue else null end) as "Feb_Revenue",
       sum (case when month = 'Mar' then revenue else null end) as "Mar_Revenue",
       sum (case when month = 'Apr' then revenue else null end) as "Apr_Revenue",
       sum (case when month = 'May' then revenue else null end) as "May_Revenue",
       sum (case when month = 'Jun' then revenue else null end) as "Jun_Revenue",
       sum (case when month = 'Jul' then revenue else null end) as "Jul_Revenue",
       sum (case when month = 'Aug' then revenue else null end) as "Aug_Revenue",
       sum (case when month = 'Sep' then revenue else null end) as "Sep_Revenue",
       sum (case when month = 'Oct' then revenue else null end) as "Oct_Revenue",
       sum (case when month = 'Nov' then revenue else null end) as "Nov_Revenue",
       sum (case when month = 'Dec' then revenue else null end) as "Dec_Revenue"
from department
group by id
order by id asc;