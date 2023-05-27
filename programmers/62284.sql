SELECT
    C1.CART_ID
FROM
    CART_PRODUCTS as C1,
    (SELECT
        CART_ID,
        NAME
    FROM
        CART_PRODUCTS
    WHERE
        NAME = 'Yogurt') as C2
WHERE
    C1.NAME = 'Milk' AND C1.CART_ID = C2.CART_ID
ORDER BY
    C1.CART_ID