-- Additional Features Around Posts

-- خب حالا میخوایم به صورتی ببنیم چطوری میتونیم یک بخش رو مجدد در داخل اس کیو ال خودمون مدل کنیم
-- پس در ادامه مباحث در بخش های قبلی تا به اینجا موفق شدیم چیزی شبیه به این رو مدل سازی کنیم
-- خب همینطور که به یکی از پست های ایستاگرام نگاه کنیم متوجه میشیم باید خیلی از موارد دیگه ای
-- رو داخل یک پست به هم مرتبط کنیم
-- خب در ادامه یکی از قابلیت هایی که نیاز داریم ان را اضافه کنیم کپشن خواهدبود

-- خب ما اصلا برای اینکه بخوایم یک پس ایجاد کنیم باید ابنتدا
-- تصیری براش اپلود کنیم
-- متنرو براش تنظیم کنیم

-- و همینطور گزینه های دیگه ای برای مثال تگ کردن افرادی خاص
-- و یا ادد کردن موقعیت مکانی خواهد بود
-- درواقع با فعال کردن این گزینه اینستاگرام میتونه به موقعیت مکانی و اطلاعات ما دسترسی داشته باشه

-----------------------------------------------------------------------------

--  Adding Captions and Locations

-- خب حالا میخواهیم سه ستون به جدول خدومان اضافه کنیم
-- خب ما این سه یتون رو به جدول پست اضافه میکنیم

--     caption VARCHAR(300)
--     lat REAL
--     lng REAL

--------------------------------------------------------------------------

--  Photo Mentions vs Caption Mentions
-- خب حالا در این بخش میخوایم برچسب هارو اضافه کنیم
-- خب برای اینکه بخواهیم دقت ان را بالاببریم میتوانیم جدولی برای تگ ها ایجاد نماییم
-- و اینکه ما باید درظر داشته باشیم هر تگ در چه موقعیتی از مختصات صفحه قرار گرفته است
-- پس ما باید مختصات صفحه رو هم ذخیره کنیم تا زمانی که پست ایجاد شد با زدن کاربر روی صفحه
-- تگ ها توی موقعیت خودشون نمایش داده بشن





---------------------------------------------------------------

 
-- Considerations on Photo Tags vs Caption Tags
-- در این بخش ما میخوایم کاربر هایی که توی یک کپشن ذکر شده هستند را دریافت کنیم
-- که بتونیم یا اون هارو ذخیره کنیم
-- یا اون هارو به نوعی داخل پایگاه داده مدل کنیم
-- و در اینده بتونیم اون هارو نمایش بدیم
-- خب پس با این رویکرد ما یا میتونیم کاربر هارو توی عکس تگ کنیم یا یتونیم اون هارو
-- داخل کپشن تگ کنیم و بعد بتونیم به اطلاعات اون ها دسترسی داشته باشم
-- و درواقع ما با اینکار درحال جلب توجه کاربران دیگه به این تگ ها هستیم
-- پس در این مرحله جدول جدایی رو برای تگ هاای که برای عسک ها و یا تگ هایی که برای پست ها ایجاد کردیم را میسازیم





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
    caption VARCHAR(300)
    lat REAL
    lng REAL

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

Table photo_tags {
    id SERIAL [pk,increment]
    user_id INTEGER [ref: > users.id]
    post_id INTEGER [ref: > posts.id]
    x INTEGER
    y INTEGER
    created_at TIMESTAMP
    updated_at TIMESTAMP
}
Table caption_tags {
    id SERIAL [pk,increment]
    user_id INTEGER [ref: > users.id]
    post_id INTEGER [ref: > posts.id]
    created_at TIMESTAMP
    updated_at TIMESTAMP
}