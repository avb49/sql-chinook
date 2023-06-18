-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 18
-- Which sales agent made the most in sales in 2009?

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
WHERE
    strftime('%Y', InvoiceDate) = "2009"
GROUP BY
    M.FullName
ORDER BY 
    TotalSales DESC;