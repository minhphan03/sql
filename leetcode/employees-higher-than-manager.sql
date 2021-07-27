# Write your MySQL query statement below
SELECT e.Name as Employee FROM Employee as E
JOIN Employee AS m ON e.managerId = m.Id
WHERE e.salary > m.salary
