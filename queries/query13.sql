-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 13
-- Provide a query that shows the # of invoices per country.

SELECT 
    BillingCountry, 
    COUNT(*) AS NumberOfInvoices
FROM 
    Invoice
GROUP BY 
    BillingCountry
ORDER BY 
    NumberOfInvoices DESC;