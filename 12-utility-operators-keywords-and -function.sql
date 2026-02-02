-- بزرگترین عدد توی لیست را برمیگرداند
SELECT GREATEST(10,200,30) AS BiggerThen;


SELECT
      *,
      GREATEST(1560 , weight * 2) AS COST_TO_SHIP
FROM
    sh.products


-- کمترین عدد توی لیست را برمیگرداند
SELECT LEAST(10,200,30) AS BiggerThen;

SELECT
      *,
      LEAST(1560 , weight * 2) AS COST_TO_SHIP
FROM
    sh.products

-------------------------------------------

SELECT
      *,
      CASE
            WHEN P.price >= 50 THEN 'high'
            WHEN P.price < 50 THEN 'medium'
            ELSE 'SHEAP'
            
      END
FROM 
    sh.products P;