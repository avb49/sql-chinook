-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 7
-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

-- 1) join Employee and Customer table to get mapping of sales people to customers
WITH sales_agent_mapping AS (
    SELECT 
        E.FirstName || ' ' || E.LastName as EmployeeName, 
        C.CustomerID,
        C.FirstName || ' ' || C.LastName as CustomerName,
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
    M.CustomerName,
    I.BillingCountry,
    M.EmployeeName,
    I.Total
FROM 
    Invoice AS I
LEFT JOIN
    sales_agent_mapping AS M ON I.CustomerID = M.CustomerID
ORDER BY
    M.EmployeeName ASC, 
    I.InvoiceId ASC;