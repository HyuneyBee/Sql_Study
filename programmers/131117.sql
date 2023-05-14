SELECT
    F.PRODUCT_ID,
    F.PRODUCT_NAME,
    (F.PRICE * O.AMOUNT) as TOTAL_SALES
FROM
    FOOD_PRODUCT as F,
    (SELECT
        PRODUCT_ID,
        SUM(AMOUNT) as AMOUNT
    FROM
        FOOD_ORDER
    WHERE
        DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
    GROUP BY
        PRODUCT_ID) as O
WHERE
    F.PRODUCT_ID = O.PRODUCT_ID
ORDER BY
    TOTAL_SALES desc, F.PRODUCT_ID