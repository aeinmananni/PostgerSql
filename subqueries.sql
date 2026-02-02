

SELECT
      id,
      price,
      name
FROM
     sh.products
     WHERE
          price > (
            SELECT
                  AVG(price)
                  FROM
                      sh.products
          );



SELECT
      P1.name,
      (SELECT COUNT(name) FROM sh.products)
       FROM
       (SELECT * FROM sh.products) AS P1
JOIN (SELECT * FROM sh.products)AS P2 ON P1.id = P2.id
WHERE P1.id IN (
                    SELECT
                          id
                    FROM
                        sh.products

);

-- ------------------------------------------------------------

SELECT
        name,price,
        (SELECT MAX(price) FROM sh.products)
FROM
    sh.products
WHERE
    price > 40
-- ---------------------------------------------------------


SELECT
      id,
      name,
      price ,
      price / (SELECT MAX(price) from sh.products) AS Sum
FROM
      sh.products

-- --------------------------------------------------------------




SELECT
      PRICE_WEIGHT_RATIO
FROM (

SELECT
      name,
      price, 
      weight,
      (price * weight) AS PRICE_WEIGHT_RATIO
FROM
      sh.products

) AS Tble
WHERE 
     PRICE_WEIGHT_RATIO > 40000
-- ---------------------------------------------------------



SELECT
      *
FROM
    sh.users U
    INNER  JOIN
    (
      SELECT
      *
FROM
      sh.orders
WHERE product_id = 3
) AS O 
ON
   U.id = O.user_id

----------------------------------------------------------


 SELECT
       *
        FROM sh.products AS P
        WHERE P.id NOT IN (
            SELECT 
   P.id 
   FROM 
   sh.products AS P
   
   WHERE P.price < 30
        )




----------------------------------------------------------



SELECT * FROM sh.products

SELECT P.name , P.department , P.price  FROM sh.products AS P  WHERE P.price > ALL (


SELECT P.price FROM sh.products AS P WHERE P.department = 'Electronics'
);


---------------------------------------------------------



SELECT * FROM sh.products WHERE weight> SOME (


SELECT weight FROM sh.products WHERE department = 'Electronics'
)

---------------------------------------------------------


SELECT 
       ( SELECT MAX(price) FROM sh.products) AS max_prixe,
       (SELECT MIN(price) FROM sh.products) AS min_price,
       (SELECT AVG(price) FROM sh.products) AS avg_price





SELECT (
       ( SELECT MAX(price) FROM sh.products)
       /
       (SELECT MIN(price) FROM sh.products)
) AS Taghsim;