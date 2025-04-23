WITH cte1 AS (
  SELECT 
    e.name AS Employee,
    e.salary AS Salary,
    d.name AS Department,
    DENSE_RANK() OVER (
      PARTITION BY e.departmentId
      ORDER BY e.salary DESC
    ) AS rank_num
  FROM Employee e
  JOIN Department d
    ON e.departmentId = d.id
)

SELECT Department, Employee, Salary
FROM cte1
WHERE rank_num <= 3;
