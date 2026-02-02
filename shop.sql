


CREATE SCHEMA sh


CREATE TABLE sh.users(
    id SERIAL PRIMARY KEY ,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(150) NOT NULL

)




INSERT INTO sh.users(first_name, last_name)
VALUES  ('John', 'Mitchell'),
        ('Emily', 'Harper'),
        ('Daniel', 'Coleman'),
        ('Sophie', 'Reynolds'),
        ('Ethan', 'Bennett'),
        ('Chloe', 'Morgan'),
        ('Liam', 'Anderson'),
        ('Ava', 'Stevens');


SELECT * FROM sh.users



CREATE TABLE sh.products(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    weight INT NOT NULL
)

SELECT * FROM sh.products

INSERT INTO sh.products(name, department, price, weight)
VALUES ('Wireless Mouse', 'Electronics', 29.99, 120),
       ('Bluetooth Speaker', 'Electronics', 59.99, 540),
       ('Running Shoes', 'Sports', 89.50, 850),
       ('Coffee Maker', 'Home Appliances', 74.00, 2100),
       ('Water Bottle', 'Sports', 12.49, 300),
       ('Desk Lamp', 'Home Decor', 34.90, 450),
       ('Backpack', 'Accessories', 45.00, 700),
       ('Notebook', 'Stationery', 4.99, 200),
       ('Scented Candle', 'Home Decor', 9.99, 250);


SELECT * FROM sh.products


CREATE TABLE sh.orders(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES sh.users(id),
    product_id INTEGER REFERENCES sh.products(id),
    paid BOOLEAN
);

INSERT INTO sh.orders(user_id, product_id, paid)
VALUES 
    (1, 1, TRUE),  -- John → Wireless Mouse
    (1, 3, TRUE),  -- John → Running Shoes
    (2, 2, TRUE),  -- Emily → Bluetooth Speaker
    (2, 7, FALSE),  -- Emily → Backpack
    (3, 4, TRUE),  -- Daniel → Coffee Maker
    (3, 1, TRUE),  -- Daniel → Mouse
    (4, 5, TRUE),  -- Sophie → Water Bottle
    (4, 9, FALSE),  -- Sophie → Scented Candle
    (5, 3, TRUE),  -- Ethan → Running Shoes
    (5, 8, TRUE),  -- Ethan → Notebook
    (6, 6, TRUE),  -- Chloe → Desk Lamp
    (6, 2, TRUE),  -- Chloe → Speaker
    (7, 4, FALSE),  -- Liam → Coffee Maker
    (7, 7, TRUE),  -- Liam → Backpack
    (8, 9, TRUE),  -- Ava → Scented Candle
    (8, 5, TRUE);  -- Ava → Water Bottle



    SELECT * FROM sh.orders



    SELECT
          paid,
          COUNT(*)
    FROM
        sh.orders
    GROUP BY paid


    SELECT
          O.id,
          O.user_id,
          O.product_id,
          O.paid,
          U.first_name || '  ' || U.last_name AS full_name,
          P.name,
          P.department,
          P.price,
          P.weight
    FROM
        sh.orders O 
    LEFT JOIN 
            sh.users U
                    ON O.user_id = U.id
    LEFT JOIN
            sh.products P
                    ON O.product_id = P.id
    