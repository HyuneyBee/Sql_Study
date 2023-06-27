SELECT
    B.CATEGORY,
    sum(BS.SALES) as TOTAL_SALES
FROM BOOK as B
JOIN BOOK_SALES as BS ON
    B.BOOK_ID = BS.BOOK_ID
WHERE
    DATE_FORMAT(SALES_DATE, "%Y-%m") = "2022-01"
GROUP BY
    B.CATEGORY
ORDER BY
    B.CATEGORY