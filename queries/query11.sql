-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 11
-- Provide a query that includes the track name with each invoice line item.
SELECT 
    I.InvoiceLineId, T.Name AS TrackName
FROM 
    InvoiceLine AS I
LEFT JOIN 
    Track as T ON I.TrackId = T.TrackId
    
ORDER BY I.InvoiceLineId;