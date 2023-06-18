-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 8
-- How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?

SELECT
    strftime('%Y', InvoiceDate) AS Year,
    SUM(Total) as TotalSales,
    COUNT(*) as NumberOfInvoices
FROM Invoice
WHERE 
    strftime('%Y', InvoiceDate) = "2009"
    OR strftime('%Y', InvoiceDate) = "2011"
GROUP BY 
    Year