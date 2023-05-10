SELECT  O.animal_id,
        O.NAME
FROM    animal_ins AS I
        RIGHT JOIN animal_outs AS O
            ON I.animal_id = O.animal_id
WHERE  I.animal_id IS NULL