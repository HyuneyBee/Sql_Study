SELECT
    A.APNT_NO,
    P.PT_NAME,
    P.PT_NO,
    A.MCDP_CD,
    D.DR_NAME,
    A.APNT_YMD
FROM
    PATIENT as P
        JOIN APPOINTMENT as A ON
            P.PT_NO = A.PT_NO
        JOIN DOCTOR as D ON
            D.DR_ID = A.MDDR_ID
WHERE
    DATE_FORMAT(A.APNT_YMD, '%Y-%m-%d') = '2022-04-13'
  AND
    APNT_CNCL_YN = 'N'
ORDER BY
    A.APNT_YMD