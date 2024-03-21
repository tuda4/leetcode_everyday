Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

** Analyze:
- Find the manager who has at least 5 direct reports
- Create a sub table to store the number of direct reports for each manager
- Join the sub table with the Employee table to get the result

** Result:
WITH a AS (
SELECT managerid AS id
FROM employee
GROUP by managerid
HAVING count(managerid) >= 5
)
SELECT e.name
FROM a
LEFT JOIN employee AS e ON e.id = a.id
WHERE e.id IS NOT NULL;