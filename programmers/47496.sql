SELECT
    I.REST_ID,
    I.REST_NAME,
    I.FOOD_TYPE,
    I.FAVORITES,
    I.ADDRESS,
    R.SCORE
FROM
    REST_INFO as I,
    (SELECT
         REST_ID,
         ROUND(AVG(REVIEW_SCORE), 2) as SCORE
     FROM
         REST_REVIEW
     GROUP BY
         REST_ID) as R
WHERE
    I.REST_ID = R.REST_ID
  AND
    I.ADDRESS like '서울%'
ORDER BY
    R.SCORE desc, I.FAVORITES desc