SELECT
    O.ANIMAL_ID,
    O.ANIMAL_TYPE,
    O.NAME
FROM
    (SELECT
         ANIMAL_ID,
         SEX_UPON_INTAKE
     FROM
         ANIMAL_INS
     WHERE
         SEX_UPON_INTAKE like 'intact%')
    AS I
JOIN
    ANIMAL_OUTS as O ON
    I.ANIMAL_ID = O.ANIMAL_ID
WHERE
    O.SEX_UPON_OUTCOME like 'Spayed%'
   OR
    O.SEX_UPON_OUTCOME like 'Neutered%'
ORDER BY
    O.ANIMAL_ID