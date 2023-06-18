-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 1
-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT CustomerId, FirstName || ' ' || LastName AS FullName, Country
FROM Customer
WHERE Country <> "USA";