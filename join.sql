
CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
)



-- --------------------------------------------------------

SELECT * FROM users

INSERT INTO comments(title,user_id)
VALUES('this is my comments user4',4),
      ('this is my comments user4',4),
      ('this is my comments user1',1),
      ('this is my comments user3',3),
      ('this is my comments user5',5),
      ('this is my comments user6',6),
      ('this is my comments user1',1),
      ('this is my comments user4',4)

-- ----------------------------------------------------

SELECT 
      U.id,
      C.title,
      U.first_name ||  ' ' ||  U.last_name AS full_name,
      P.photo_url
    FROM
            comments C 
    JOIN
              users U 
    ON
             U.id = C.user_id
    LEFT JOIN
              photos P 
    ON
      U.id = P.user_id
         
-- --------------------------------------------


CREATE EXTENSION IF NOT EXISTS pgcrypto;


CREATE TABLE authors(
      id UUID PRIMARY KEY DEFAULT         (),
      first_name VARCHAR(50),
      last_name VARCHAR(50)
)

CREATE TABLE books(
      id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
      book_name VARCHAR(100),
      authors_id  UUID REFERENCES authors(id) ON DELETE CASCADE
)

INSERT INTO authors(first_name,last_name)
VALUES('Lila','Karami'),
      ('abase','najafi'),
      ('rasol','rostami'),
      ('sara','bayati')

SELECT * FROM authors

INSERT INTO books(book_name,authors_id)
VALUES('book1','8691285c-5acf-42ac-854a-4252765b3f2d'),
      ('book23','f79c7dd9-fa7c-4517-ad5a-c934abbdc0ad'),
      ('book213','8691285c-5acf-42ac-854a-4252765b3f2d'),
      ('book1445','43ab412d-25d0-44ec-aeee-084624c84eba'),
      ('book1','43ab412d-25d0-44ec-aeee-084624c84eba')


SELECT  
      A.id AS authors_id,
      A.first_name || ' ' || A.last_name AS full_name,
      B.id AS book_id,
      B.book_name
FROM
      authors A
LEFT JOIN
      books B
ON
      A.id = B.authors_id
