SELECT
    YEAR(S.SALES_DATE) as YEAR,
    MONTH(S.SALES_DATE) as MONTH,
    U.GENDER,
    count(DISTINCT(S.USER_ID)) as USERS
FROM
    ONLINE_SALE as S
    JOIN USER_INFO as U ON
    S.USER_ID = U.USER_ID
WHERE
    U.GENDER is not null
GROUP BY
    YEAR, MONTH, U.GENDER
ORDER BY
    YEAR, MONTH, U.GENDER