-- Table: Tree

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | p_id        | int  |
-- +-------------+------+
-- id is the column with unique values for this table.
-- Each row of this table contains information about the id of a node and the id of its parent node in a tree.
-- The given structure is always a valid tree.
 

-- Each node in the tree can be one of three types:

-- "Leaf": if the node is a leaf node.
-- "Root": if the node is the root of the tree.
-- "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.

-- Return the result table in any order.

-- *** Analyze:
-- ***** + Bài toán yêu cầu biến đổi thành dạng tree với 3 loại:
-- "Root" là node gốc, nó sẽ không có parent nên p_id is null
-- "Inner" là node có cả parent và cả node con 
-- "Leaf" là node chỉ có node parent
---------------------------------------------------
-- => Áp dụng vào thuật giải: "Root" có p_id là null
-- "Inner" sẽ có id xuất hiện trong p_id, tức là làm parent của 1 node khác
-- "Leaf" sẽ không có id xuẩ hiện trong p_id

-- Write your PostgreSQL query statement below
select id, 
    case when p_id is null then 'Root'
         when id in (select distinct p_id from tree) then 'Inner'
         else 'Leaf'
    end as type
from tree;