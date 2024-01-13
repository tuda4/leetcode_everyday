Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last ones seat.

Analyze: - Bài toán yêu cầu việc swap giữa 2 student liên tiếp từ số lẻ thành chẵn, nếu thành viên cuối cùng là số lẻ thì không cần swap.
Solution: - Có 2 cách tiếp cận bài toán này: 
    + Thay đổi cột id: Sử dụng method CASE để set trường hợp số chẵn, lẻ, và số lẻ cuối cùng. (đổi chỗ bằng cách cộng trừ 1 đơn vị với id chẵn lẻ, và giữ nguyên nếu nó là số cuối cùng lẻ).
    + Thay đổi cột student:

Write your PostgreSQL query statement below 
select 
case when mod(id,2)=0 then id-1
     when mod(id,2)=1 and id+1 > (select count(*) from seat) then id 
     else id + 1
end as id, student
from seat order by id asc;