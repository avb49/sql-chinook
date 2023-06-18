-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 16
-- Provide a query that shows all Invoices but includes the # of invoice line items.

SELECT
    I.InvoiceId,
    COUNT(*) as NumberOfLineItems
FROM
    Invoice AS I
JOIN
    InvoiceLine AS IL ON I.InvoiceId = IL.InvoiceId
GROUP BY
    I.InvoiceId