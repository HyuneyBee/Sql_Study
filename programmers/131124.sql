SELECT
    M.MEMBER_NAME,
    R.REVIEW_TEXT,
    DATE_FORMAT(R.REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
FROM
    MEMBER_PROFILE as M
JOIN  REST_REVIEW as R ON
    M.MEMBER_ID = R.MEMBER_ID
WHERE
    M.MEMBER_ID = (SELECT
                    MEMBER_ID
                  FROM
                    REST_REVIEW
                  GROUP BY
                    MEMBER_ID
                   ORDER BY
                    count(*) desc limit 1)
ORDER BY
    R.REVIEW_DATE, R.REVIEW_TEXT