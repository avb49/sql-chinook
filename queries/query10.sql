-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 10
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice
SELECT InvoiceId, COUNT(*) AS CountOfLineItems
FROM InvoiceLine
GROUP BY InvoiceId