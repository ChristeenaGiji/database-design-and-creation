USE CompanyDatabase;

GO
--ALias canot have with *

select e.salary from employee e;

-- Aggregate Functions
SELECT * FROM Employee;

SELECT COUNT(*) AS Total_employees FROM Employee e;

SELECT AVG(e.salary) AS AvgSalary FROM Employee e;

--Join
SELECT e.firstName,e.salary,d.departmentName FROM Employee e
JOIN Department d
ON
e.departmentId=d.departmentId;


SELECT e.firstName +' ' + e.lastName AS FULLNAME ,
d.departmentName 
FROM Employee e
JOIN Department d
ON
e.departmentId=d.departmentId
