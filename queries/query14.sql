-- My answers to Chinook DB questions: https://github.com/joshualloyd/chinook-sqlite

-- Query 14
-- Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.

SELECT 
    P.Name, COUNT(*) AS NumberOfTracks
FROM 
    Playlist AS P
LEFT JOIN
    PlaylistTrack as PT ON P.PlaylistId = PT.PlaylistId
GROUP BY 
    P.Name
ORDER BY
    NumberOfTracks DESC;