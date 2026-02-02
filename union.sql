
(
SELECT * FROM sh.products
ORDER BY price DESC
)
UNION ALL
(

SELECT
      *
FROM
    sh.products
    ORDER BY price / weight DESC
)



(
SELECT * FROM sh.products
ORDER BY price DESC
)
INTERSECT ALL
(

SELECT
      *
FROM
    sh.products
    ORDER BY price / weight DESC
    LIMIT 4
)