


CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    user_name VARCHAR(30) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
)

-- ---------------------------------------------

INSERT INTO users(first_name, last_name, user_name, password)
VALUES  ('zahra','karimi','user4','1234O1234o'),
        ('sajd','mosavi','user10','1234M1234m'),
        ('taha','abasi','user13','1234P1234p');
       

-- ---------------------------------------------    

SELECT * FROM users
-- ----------------------------------------------

CREATE TABLE photos(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    photo_url VARCHAR(255) NOT NULL
)

INSERT INTO photos(user_id, photo_url)
VALUES  (1,'https://example.com/photo1.jpg'),
        (2,'https://example.com/photo2.jpg'),
        (3,'https://example.com/photo3.jpg');   

-- --------------------------------------------
SELECT * FROM photos
-- ---------------------------------------------

SELECT * 
  FROM 
        photos 
WHERE 
    user_id = 2;
-- ---------------------------------------------

 SELECT 
        U.id,
        U.first_name,
        U.last_name,
        P.photo_url
        
         FROM photos P
    JOIN 
        users U ON 
        U.id = P.user_id;


-- DROP TABLE photos;


DELETE FROM users WHERE id = 2;
SELECT * FROM photos;

