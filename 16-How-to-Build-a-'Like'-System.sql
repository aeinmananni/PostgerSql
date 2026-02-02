-- Requirements of a Like System
-- خب در ادامه طراحی مبحث اینستاگرام که در بخش 15 شروع کرده بودیم
-- در این بخش میخوایم به پیاده سازی بخش لایک در پست های اینستاگرام بپردازیم
-- پس بنابراین ما میتونیم یک کاربر داشته باشم که پستی خاص رو دوست داشته باشه
-- و در نهایت میتونیم ترازی برای دوست داشتن پست خاص به صورت عدد قرار بدیم تا مشخص بشه
-- کاربر ها به چه میزانی به این پست ها علاقه دارن

---------------------------------------------------------------









-- How Not to Design a Like System
-- اما در این بخش معماری خاصی وجود دارد و ما نمیخواهیم ستونی مانند لایک رو به جداول پست الحاق کنیم
-- دلایل مختلفی وجود داره که ما نمیخوایم اینکارو انجام بدیم


-- 1- هیچ راهی برای ایجاد ارتباط بین کاربر و یک پست
--    بنابراین ما نمیتونیم اطمینان حاصل کنبم که کاربرفقط یکبار میتونه یک پست رو دوست داشته باشه
--    یعنی یه کاربر میتونه میلیون هابار یک پست رو لایک کنه و ما هیچ راهی برای نگه داری
--    از اون نداریم و همینطور میتونه تعداد لایک هارو فقط یک کاربر چندید بار افزایش بده


-- 2- هیچ راهی وجود ندارد که بدانیم کاربران یک پست خاص رو دوست دارن

-- 3- راهی برای حذف کردن پست های کاربری که از اپلیکشن حذف شده وجود داره













------------------------------------------------------------------------------------
-- Designing a Like System

-- **خب حالا برای مدیریت بهتر لایک ها باید جدول جدایی بنام لایک ایجاد کنیم
-- **که قرار است یک کاربر رو با یک پست خاص مرتبط کنه
-- ** خب حالا میتونیم کنترلی روی ستون های خدومون داشته باشم که یک کاربر میتونه فقط یکبار پسته خاصی رو دوست داته باشه
-- ** تا مدام تنونه به لایک های خودش اضافه کنه

-- ** =>> Add unique constraint with UNIQUE(user_id,post_id)

-- خب زمانی که ما این رویکرد رو پایده سازی کنیم میتونیم خیلی از سوال های جالب رو از کوئری هایی که مینویسم طرح کنیم

--  مثال => 
--     **    زمانی که بخوایم تعداد لایک ه رو در پست با شناسه سه نمایش بدییم

--         SELECT
--             COUNT(*) 
--         FROM 
--             instagram.likes
--         WHERE
--             post_id = 3

--     **   میتونیم افرادی رو که مثلا پست شماره سه رو لایک کردن پیدا کنیم

--         SELECT
--             username
--         FROM
--             instagram.likes L
--         INNER JOIN instagram.users U
--         ON 
--             U.id = L.user_id
--         WHERE
--             post_id = 3;

--     **  خب میتونیم به شناسایی پنج پست برتر و دوست داشتنی
        
--         SELECT
--             L.post_id
--         FROM
--             instagram.posts P
--         INNER JOIN instagram.likes L
--         ON
--             L.post_id = P.id
--         GROUP BY L.post_id
--         ORDER BY 
--                 COUNT(*) DESC
--         LIMIT 5

----------------------------------------------------------------------







--  Making a Reaction System Instead
 
--     خب حالا میخوایم بدونیم چطوری میشه واکنش های مختلف رو برای یک پست خاص اعمال کرد

-- میتونیم جدولی ایجاد کنیم بنام ری اکشن و تایپ هر واکنشی رو داخلش ذخیره کنیم
-- میتونیم تایپ رو به صورت ای نام در نظر بگیریم


-- TABLE reactions {
--     id SERIAL [pk,increment]
--     post_id INTEGER [ref: > posts.id]
--     user_id INTEGER [ref: > users.id]
--     type INTEGER  (LIKE or LOVE or CARE or FUNNY or sad)
-- }

---------------------------------------------------------------------


-- Polymorphic Associations

--  خب حالا میخوایم برسی کنیم که یک کاربر بتونه لایک و یا نظر خودش رو با یک روش بهتر به ثبت برسونه
--  بهترین سیاست برای مقداردهی و استفاده از کلید های خارجی در سیستم هایی است که پایگاه داده رابطه ای دارند


-----------------------------------------------------------------------







-- Polymorphic Association Alternative Implementation

-- ما میتونیم در ستون در جدول لایک ها ارتباطی با کامنت ها برقرا کنیم و حالا اگر کاربر نظری داشت ان را درون جدول درج کرده
-- و بتونیم توسط کلید خارجی به کامنت بهش دسترسی داشته باشیم

-- Table likes {
--     id SERIAL [pk,imcrement]
--     post_id INTEGER [ref: > posts.id]
--     user_id INTEGER [ref: > users.id]
--     comment_id INTEGER [ref: > comments.id]
-- }

-- باید به نوعی سیاست چک را اعمال کنیم برای برسی ستون های درون جدول

-- ADD CHECK of
-- (
--     COALESCE((post_id)::BOOLEAN::INTEGER,0)
--     +
--     COALESCE((comment_id)::BOOLEAN::INTEGER,0)

-- ) = 1;

--  استفاده کرده ایم COALESCE  در واقع ما اینجا از سیاست 

--  COALESCE : 
--             اگر مقدار اول نال باشه مقدار دوم رو برمیگردونه
--             اما در مثال پایین برسی کردیم اگر مقدار داشت 1 برمیگردونه
--             در غیر اینصورت صفر رو برمیگردونه
-- SELECT COALESCE(NULL::BOOLEAN::INTEGER,0)

-------------------------------------------------------------------


--  The Simplest Alternative

-- خب در این مرحله میتونیم راه حلی ستده تر برای پیاده سازی نطرات و یا کامنت ها داشته باشم ALTER
-- و ان هم اضافه کردن دو جدول برای ذخیره لایک ها و دیگری برای ذخیره کردن کامنت ها خواهد بود

-- Table posts_likes {
--     id INTEGER [pk,increment]
--     user_id INTEGER [ref: > users.id]
--     post_id INTEGER [ref: > posts.id]
-- }

-- Table comments_lies {
--     id INTEGER [pk,increment]
--     user_id INTEGER [ref: > users.id]
--     comment_id INTEGER [ref: > comments.id]
-- }

----------------------------------------------------------------------------------------

--  So Which Approach
درنهایت بهترین سیساتی که میتوانیم از ان برای جدوا های خدومان استفاده کنیم



Table users {
    id SERIAL [pk,increment]
    userName VARCHAR(50)
    created_at TIMESTAMP
    updated_at TIMESTAMP
}


Table posts {
    id SERIAL [pk,increment]
    url VARCHAR(200)
    created_at TIMESTAMP
    updated_at TIMESTAMP
    user_id INTEGER [ref: > users.id]
}

Table comments{
    id SERIAL [pk,increment]
    contents VARCHAR(240)
    created_at TIMESTAMP
    updated_at TIMESTAMP
    user_id INTEGER [ref: > users.id]
    post_id INTEGER [ref: > posts.id]
}

Table likes {
    id SERIAL [pk,imcrement]
    user_id INTEGER [ref: > users.id]
    post_id INTEGER [ref: > posts.id]
    comment_id INTEGER [ref: > comments.id]
    created_at TIMESTAMP
}