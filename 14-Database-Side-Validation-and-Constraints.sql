



CREATE SCHEMA shop;

CREATE TABLE shop.products(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50),
  price INTEGER,
  weight INTEGER

);


INSERT INTO shop.products(name,department,price,weight)
VALUES ('shirt','clothes',20,1)


-- ----------------------------------------------------------------


-- خب ما باید محدویت هایی را قائل شویم تا برای مثال مقدار تهی درون جدول های ما ذخیره نشود
-- درحالت قبلی که داشتیم میتوانستیم مثلا برای واحد قیمت مقدار خالی درج کنم اما درخط بعد میتوانیم
-- جلوی این رویه اشتباه را بگیریم

ALTER TABLE shop.products ALTER COLUMN price SET NOT NULL;

INSERT INTO shop.products(name,department,price,weight)
VALUES ('pans','clothes',32,3)
-- -------------------------------------------------------------------


-- خب حالا توی این سناریو میخوام کاری انجام بدم که مقدار های تهی درج شده رو پیدا کنم و داخلشون مقدار ذخیره کنم

INSERT INTO shop.products(name,department,price,weight)
VALUES
    (null,'clothes',42,2),
    ('jin',null,54,3)

-- این قسمت برای نام محصولی که تهی بود
UPDATE
    shop.products
    SET
       name = 'hat'
    WHERE
         name IS NULL

-- این قسمت برای دپارتمانی که تهی است

UPDATE
    shop.products
    SET
    department = 'clothes'
    WHERE
        department IS NULL
-- -------------------------------------

-- میتونیم چد ستون رو جلوی نال بودنشون رو بگیریم

-- ---------------------------------------------------

-- خب با در بعضی از مواقع میتونیم برای ستون های خودیم مقدار های دیفالت در نظر بگیریم

ALTER TABLE shop.products ALTER COLUMN weight SET DEFAULT 1;

INSERT INTO shop.products(name,department,price)
VALUES
    ('gloves','clothes',455)















-- -------------------------------------------------------------
-- خب حالا در این بخش میخوایم اطمینان حاصل کنیم حتما مقادیر قرار گرفته داخله یک جدول منحصر به فرد یا همان یونیک باشد

ALTER TABLE shop.products ADD UNIQUE(name);

-- در این حال که بخواهیم مقدار تکراری درج کنیم خطلایی که با ان مواجه میشویم

-- Started executing query at Line 77
-- duplicate key value violates unique constraint "products_name_key"
-- DETAIL: Key (name)=(gloves) already exists.




SELECT * FROM shop.products

------------------------------------------------------------------







-- ** Multi-Column Uniqueness **
-- خب من میخوام ابتدا یک جدول دیگه ای ایجاد کنم و بتونم چند ستون رو داخلش یونیک در نظر بگیرم

CREATE TABLE shop.users(
    id SERIAL PRIMARY KEY NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    userName VARCHAR(10) NOT NULL,
    password VARCHAR(15) NOT NULL

)


ALTER TABLE shop.users ADD UNIQUE(email,phone);

INSERT INTO shop.users(firstName,lastName,email,phone,userName,password)
VALUES
    ('ayin','mannani','mannanniaein1234@gmail.com','09901656003','ayin1376','1234'),
    ('ayin','mannani','mannanniaein1234@gmail.com','09901656003','ayin1376','1234')

    -- حالا برای مثال اگر بخواهیم یونیکی رو حذف کنیم
    ALTER TABLE shop.users DROP CONSTRAINT users_email_phone_key









-----------------------------------------------------------------   

-- ** Adding a Validation Check **
-- خب حالا میخواهیم گزینه چک رو روی فیلد ها برسی کنیم و ابتدا من یک فیلد سن اضافه میکنم

ALTER TABLE shop.users  ADD COLUMN age INTEGER;
ALTER TABLE shop.users ADD CHECK (age >= 20 AND age <= 40);


TRUNCATE TABLE shop.users;

SELECT * FROM shop.users

INSERT INTO shop.users(firstName,lastName,email,phone,userName,password,age)
VALUES
    ('ayin','mannani','mannanniaein1234@gmail.com','09901656003','ayin1376','1234',50)

    -- Error
-- 9:19:33 AM
-- Started executing query at Line 127
-- new row for relation "users" violates check constraint "users_age_check"
-- DETAIL: Failing row contains (3, ayin, mannani, mannanniaein1234@gmail.com, 09901656003, ayin1376, 1234, 50).





---------------------------------------------------------

-- ** Checks Over Multiple Columns **


-- خب میخوایم با نوعی دیگر اس سیاست چک کار کنیم
-- فرض میکنیم با جدول جدیدی از داده ها بنام سفارشات کار میکنیم
-- خب میخوایم مطمئن بشیم تاریخ تحویل همیشه دیرتر از اینده است و یا در اینده است بعد از تاریخ ایجاد شده





CREATE TABLE shop.orders(
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(40) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    est_delivery TIMESTAMP NOT NULL
    CONSTRAINT users_check_tieming CHECK(created_at < est_delivery)
);


INSERT INTO shop.orders(name,created_at,est_delivery)
VALUES
    ('shirt','2000-NOV-20 01:00AM'::TIMESTAMP,'2000-NOV-25 01:00PM'::TIMESTAMP)




INSERT INTO shop.orders(name,created_at,est_delivery)
VALUES
    ('shirt','2000-NOV-20 01:00AM'::TIMESTAMP,'2000-NOV-10 01:00PM'::TIMESTAMP);

--Error
-- 9:37:25 AM
-- Started executing query at Line 199
-- new row for relation "orders" violates check constraint "users_check_tieming"
-- DETAIL: Failing row contains (2, shirt, 2000-11-20 01:00:00, 2000-11-10 13:00:00).
-- Total execution time: 00:00:00.003

SELECT * FROM shop.orders

--------------------------------------------------------------------



-- ** So Where Are We Applying Validation **