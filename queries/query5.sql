-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 5
-- Provide a query showing a unique list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry
FROM Invoice
ORDER BY BillingCountry ASC;