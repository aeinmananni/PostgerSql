--  Approaching More Complicated Designs
-- خب در این بخش ها میخواهیم ساختار پیچیده تری به نسبت نمونه های قبلی داشته باشم 
-- ساختاری مانند جداول اینستاگرام
-- در این بخش ها میخوایم بدونیم چطوری میتونیم جداولی رو که ایجاد میکنیم ساختار کنترلی تری بهش داشته باشم
-- پس ما در ادامه میتونیم از برخی از این ساختار هایی که ایجاد کردیم و جداولی که ساختیم
-- نمونه های ان رو توی اسکیما های ساخته شده در دیتابیس مشاهده کنیم

-- نمونه هایی از این دیتابیس دیزاینر ها عبارت هستند از
-- 1- dbdiagram.io
-- 2- drawsql.app
-- 3- sqldbm.com
-- 4-quickdatabsediagrams.com
-- 5


----------------------------------------------------------------------
--  Using a SQL Design Tool

-- خب حالامیخوایم طرحی رو برای پیاده سازی پروژه اینستاگرام طراحی کنیم
-- به طراحی 3 جدول میپردازیم

-- 1- users
-- 2- comments
-- 3- posts


CREATE DATABASE instagramsdb;
CREATE SCHEMA instagram;

-------------------------------------------------------------------
--  A Config-based Schema Designer

-- dbdiagram.io
-- با مراجعه به این وب سایت میتونید دیاگرام مربوط به پروژه ای رو که دارید
--  با کد ایتور و دستوراتی   که خودش در اختیارتون قرار میده باز سازی کنید

-- Table users {
--     id INTEGER [pk,increment]
--     username varchar
-- }

-- Table comments {
--     id INTEGER [pk,increment]
--     contents VARCHAR
--     user_id INTEGER [ref > users.id]
--     post_id INTEGER [ref > posts.id]
-- }

-- Table posts {
--     id INTEGER [pk,increment],
--     title VARCHAR 
-- }

-- بعد از اجرا در خروجی اسکیما به شما مدل های ساخته شده رو نشون میده

-----------------------------------------------------------------------


-- 005 Rebuilding Some Schema_fa


-- خب در بخش های بالا ما دیتابیس رو ایجاد کردیم و سپس اسکیمای مربوط به اینستاگرام رو ساختیم
-- حالا دربخش میخوایم کاملا موارد مربتط با ساخت جداول اینستاگرام رو پیاده سازی کنیم
--  پروژه هارا ایجاد میکنیم dbdiagram.io پس با استفاده از 


-- Table users {
--     id SERIAL [pk,increment]
--     userName VARCHAR(50)
--     created_at TIMESTAMP
--     updated_at TIMESTAMP
-- }


-- Table posts {
--     id SERIAL [pk,increment]
--     url VARCHAR(200)
--     created_at TIMESTAMP
--     updated_at TIMESTAMP
--     user_id INTEGER [ref: > users.id]
-- }

-- Table comments{
--     id SERIAL [pk,increment]
--     contents VARCHAR(240)
--     created_at TIMESTAMP
--     updated_at TIMESTAMP
--     user_id INTEGER [ref: > users.id]
--     post_id INTEGER [ref: > posts.id]
-- }