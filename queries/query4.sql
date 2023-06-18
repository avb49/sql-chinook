-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 4
--Provide a query showing only the Employees who are Sales Agents.

SELECT EmployeeId, FirstName || ' ' || LastName AS FullName, Title
FROM Employee 
WHERE Title LIKE "%sales%"
AND Title LIKE "%agent%";

-- OR
-- SELECT EmployeeId, FirstName || ' ' || LastName AS FullName, Title
-- FROM Employee 
-- WHERE Title = "Sales Support Agent"