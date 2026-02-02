--  What are Transactions Used For

خب میخواهیم با مفهوم تراکنش ها کار کنیم و برای اینکار میخوایم یک بانک
رو برای پیاده سازی از روش مثال بزنیم

یک کاری که ممکن است ما در یک حساب بانکی انجام بدیم انتقال حساب از یک حساب به حساب دیگر است
مثلا فرض کنیم میخوایم پولی رو متقل کنیم اما در هنگام انتقال ناگهان یک مشکلی رخ میده توی برنامه و باعث میشه
عملیات انجام نشه اما بدون استفاده از یک تراکنش ممکنه اگر به خطلایی برخورد کنیم
اون مبلغ از حساب مثلا شما کم بشه 
تراکنش باعث میشه برسی که که عملیات کاملا و به درستی انجام بشه 






CREATE TABLE instagram.accounts(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    balance INTEGER NOT NULL
);


--  Some Sample Data



INSERT INTO instagram.accounts(name,balance)
VALUES  
    ('ayin' , 100),
    ('mortaza',100)


    SELECT * FROM instagram.accounts




-- Opening and Closing Transactions


خب حالا میخوایم معامله ای رو باز کنیم و ببینیم چطوری میتونیم اون رو مدیریت کنیم


BEGIN;

UPDATE
    instagram.accounts
SET
    balance = balance + 50
WHERE
    name = 'mortaza'


SELECT * FROM instagram.accounts

COMMIT;


-- Transaction Cleanup on Crash

UPDATE
    instagram.accounts
SET
    balance = balance - 50
WHERE
    name = 'mortaza';

SELECT * FROM instagram.accounts

-- ------------------------------------

BEGIN;
SAVEPOINT s1;

UPDATE ...  -- این یکی خراب می‌شود

ROLLBACK TO SAVEPOINT s1;  -- فقط برمی‌گردد تا این نقطه
-- حالا می‌توانی ادامه بدهی

COMMIT;
