-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 3
-- Provide a query showing the Invoices of customers who are from Brazil. 
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT Customer.FirstName || ' ' || Customer.LastName AS FullName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry 
FROM Invoice 
LEFT JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
WHERE Customer.Country = "Brazil";