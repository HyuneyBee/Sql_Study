SELECT
    HISTORY_ID,
    ROUND((((100 - IF(DISCOUNT_RATE IS NULL, 0, DISCOUNT_RATE))) / 100) * DAILY_FEE) * DAYS as FEE
FROM
    (SELECT
         H.HISTORY_ID,
         C.DAILY_FEE as DAILY_FEE,
         DATEDIFF(END_DATE, START_DATE) + 1 as DAYS,
         (SELECT
              MAX(DISCOUNT_RATE)
          FROM
              CAR_RENTAL_COMPANY_DISCOUNT_PLAN as P
          WHERE
              CAR_TYPE = '트럭'
            AND
              REPLACE(DURATION_TYPE, '일 이상', '') <= DATEDIFF(END_DATE, START_DATE) + 1
         ) as DISCOUNT_RATE
     FROM
         CAR_RENTAL_COMPANY_RENTAL_HISTORY as H
     JOIN CAR_RENTAL_COMPANY_CAR as C ON
         H.CAR_ID = C.CAR_ID
     WHERE
         C.CAR_TYPE = '트럭') S
ORDER BY
    FEE desc, HISTORY_ID desc