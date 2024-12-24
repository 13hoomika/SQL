-- JOIN is similar ti inner join
-- INNER JOIN: Inter section -> commen ele printed

SELECT *       -- select col
FROM PRODUCTS AS P -- table 1
JOIN CUSTOMERS AS C -- table 2
ON P.P_ID = C.C_ID; -- "ON" condition instead of where (where also works)


OUTER JOIN:
LEFT -> ALL THE ELEMENTS FROM LEFT TABLE AND MATCHING ELEMENTS ITEMS OF RIGHT TABLE
RIGHT -> ALL THE ELEMENTS FROM RIGHT TABLE AND MATCHING ELEMENTS ITEMS OF LEFT TABLE
