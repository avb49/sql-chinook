-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 17
-- Provide a query that shows total sales made by each sales agent.

WITH sales_agent_mapping AS (
    SELECT 
        E.FirstName || ' ' || E.LastName as FullName, 
        C.CustomerID, 
        C.SupportRepId
    FROM
        Employee AS E
    LEFT JOIN
        Customer AS C ON E.EmployeeId = C.SupportRepId
    WHERE 
        E.Title = 'Sales Support Agent'
)

SELECT 
    M.FullName,
    ROUND(SUM(I.Total), 2) AS TotalSales
FROM 
    Invoice AS I
INNER JOIN
    sales_agent_mapping AS M ON I.CustomerID = M.CustomerID
GROUP BY
    M.FullName;