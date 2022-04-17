CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT DISTINCT salary
      FROM Employee e1
      -- make sure that count of all distinct salary = N-1 (before the Nth highest salary)
      WHERE N-1 = (SELECT COUNT(DISTINCT salary) 
                   FROM Employee e2
                   WHERE e2.salary > e1.salary)
  );
END
