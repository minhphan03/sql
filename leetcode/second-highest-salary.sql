SELECT MAX(e1.Salary) as SecondHighestSalary
FROM Employee e1
WHERE e1.Salary < (SELECT MAX(e.Salary) FROM Employee e)
