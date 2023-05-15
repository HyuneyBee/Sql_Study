SELECT
    F.FLAVOR
FROM
    FIRST_HALF as F,
    (SELECT
         FLAVOR,
         INGREDIENT_TYPE
     FROM
         ICECREAM_INFO
     WHERE
         INGREDIENT_TYPE = 'fruit_based') as I
WHERE
        F.FLAVOR = I.FLAVOR
  AND
        F.TOTAL_ORDER >= 3000
ORDER BY
    F.TOTAL_ORDER desc