

SELECT
     *
      FROM
           sh.products
    ORDER BY price,weight DESC


-----------------------------------------------
-- میگه از چندتا بعد شروع کن رکورد هارو نمایش بده 
SELECT 
        *
    FROM
        sh.users
    OFFSET 2

    -- میگه چند تا رکورد رو بگیر

SELECT
      *
    FROM
        sh.users
    LIMIT 3
    
    -- -------------------


    SELECT
          * FROM sh.products
          ORDER BY price DESC
          LIMIT 4
          OFFSET 1;

-- -----------------------------------------------------

SELECT
      *
    FROM
        sh.products
    LIMIT 5
    OFFSET 5;