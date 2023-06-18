-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 2
-- Provide a query only showing the Customers from Brazil.
SELECT CustomerId, FirstName || ' ' || LastName AS FullName, Country
FROM Customer
WHERE Country = "Brazil";