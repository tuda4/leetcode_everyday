-- Table : Project
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this
-- table
-- .
-- employee_id is a foreign key to Employee table
-- .
-- Each row of this
-- table indicates
-- that the employee with employee_id is working on the project with project_id.
--
--
-- Table: Employee
--
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this
-- table
-- . It's guaranteed that experience_years is not NULL.
-- Each row of this table contains information about one employee.

-- Solution::
select project_id, round(avg(experience_years), 2) as average_years
from project
         left join employee on project.employee_id = employee.employee_id
group by project_id
order by average_years asc