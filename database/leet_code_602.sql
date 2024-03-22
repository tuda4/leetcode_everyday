Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

** Analyze:
- We need to find the person who has the most friends and the number of friends.
- If person A sent a request to person B and person B accepted the request, then A and B are friends.
- We can use the UNION operator to combine the requester_id and accepter_id columns into a single column, and then use the COUNT() function to count the number of friends for each person.
** Solution:

with a as (
	select accepter_id as id, count(accepter_id)
	from requestaccepted
	group by accepter_id
	union all
	select requester_id as id, count(requester_id)
	from requestaccepted
	group by requester_id
)
select id, sum(count) as num
from a
group by a.id
order by sum(count) desc
limit 1;