-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 15
-- Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.

SELECT 
    T.Name as TrackName, 
    A.Title AS AlbumName, 
    M.Name as MediaType, 
    G.Name as Genre
FROM
    Track as T
LEFT JOIN
    Album AS A ON T.AlbumId = A.AlbumId
LEFT JOIN 
    MediaType as M ON T.MediaTypeId = M.MediaTypeId
LEFT JOIN 
    Genre as G ON T.GenreId = G.GenreId