-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 12
-- Provide a query that includes the purchased track name AND artist name with each invoice line item.

WITH album_to_artist_mapping AS (
    SELECT Album.*, Artist.Name AS ArtistName
    FROM Album
    LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId
),
track_to_artist_mapping AS (
    SELECT T.*, A.ArtistName
    FROM Track as T
    LEFT JOIN album_to_artist_mapping AS A ON T.AlbumId = A.AlbumId
)

SELECT I.InvoiceLineId, TAM.Name, TAM.ArtistName
FROM InvoiceLine as I
LEFT JOIN track_to_artist_mapping as TAM ON I.TrackId = TAM.TrackId
ORDER BY I.InvoiceLineId;


-- Using sub-queries:

-- SELECT 
--     I.InvoiceLineId, 
--     T_A.Name, 
--     T_A.ArtistName
-- FROM 
--     InvoiceLine as I
-- LEFT JOIN (
--     SELECT 
--         T.TrackId,
--         T.Name,
--         A.ArtistName
--     FROM 
--         Track as T 
--     LEFT JOIN (
--         SELECT 
--             Album.*, 
--             Artist.Name as ArtistName 
--         FROM 
--             Album
--         LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId 
--     ) AS A ON T.AlbumId = A.AlbumId
-- ) AS T_A ON I.TrackId = T_A.TrackId
-- ORDER BY I.InvoiceLineId;