
SELECT 
user_id,
COUNT(*) AS Tedad
 FROM comments
 GROUP BY user_id
 ORDER BY user_id DESC
-- ---------------------------------------


 SELECT
       SUM(id) AS sum_id,
       COUNT(*) AS countC,
       MAX(id) AS max_id,
       MIN(id) AS min_id
FROM
       comments

       SELECT * FROM comments



 SELECT * FROM authors


SELECT
       authors_id,
       COUNT(*)
FROM
    books
GROUP BY authors_id
-- ------------------------------------------------------



SELECT * FROM authors

SELECT 
      A.first_name,
      COUNT(*) AS Tedad
FROM
     books B
     LEFT JOIN authors A ON B.authors_id = A.id
     GROUP BY A.first_name
     HAVING COUNT(*) >= 2

-- ------------------------------------------------


     CREATE TABLE keywords(
      id SERIAL PRIMARY KEY,
      manufacturer VARCHAR(100),
      price INT,
      units_sold INT

     )


TRUNCATE TABLE keywords
     INSERT INTO keywords(manufacturer,price,units_sold)
     VALUES('Nokia',199,1925),
            ('Apple',399,9436),
            ('samsung',299,2359),
            ('samsung',250,2385),
            ('Nokia',150,7543),
            ('motorola',150,8395),
            ('samsung',175,9259)

-- ---------------------------------------------
            SELECT
                  manufacturer,
                  SUM(price * units_sold)
            FROM
                  keywords
            GROUP BY 
                  manufacturer
            HAVING
                  SUM(price * units_sold) > 2000000