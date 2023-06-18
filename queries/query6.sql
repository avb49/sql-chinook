-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 6
-- Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

-- 1) join Employee and Customer table to get mapping of sales people to customers
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
-- 2) join resultant table with invoice table (on customerId)
SELECT 
    I.InvoiceId, 
    I.Total, 
    I.CustomerID, 
    M.FullName
FROM 
    Invoice AS I
LEFT JOIN
    sales_agent_mapping AS M ON I.CustomerID = M.CustomerID
ORDER BY
    M.FullName ASC, 
    I.InvoiceId ASC;