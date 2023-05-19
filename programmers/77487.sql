SELECT
    P.ID,
    P.NAME,
    P.HOST_ID
FROM
    PLACES as P,
    (SELECT
         HOST_ID,
         COUNT(ID) as total
     FROM
         PLACES
     GROUP BY
         HOST_ID HAVING total >=2) as G
WHERE
    P.HOST_ID = G.HOST_ID
ORDER BY
    P.ID