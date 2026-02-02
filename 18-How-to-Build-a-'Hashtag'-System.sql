

--  Designing a Hashtag System


-- خب در این بخش میخوایم راجع به مدل سازی هشتگ توی دیتابیس کاری انجام بدیم
-- هشتگ ها میتونن در جاهای مختلفی قرار داده بشن
-- یعنی میتونن داخل یک کپشن باشن یا حتی میتونن توی بخش معرفی پیج شخصی یا بیزینسی قرار بگیرن
-- درواقع ما با هشتگ زدن روی اسامی با برخی از تفکرات به نوعی داریم برای اون ها نوعی اعلان تنظیم میکنیم
-- و کاربران باید نوعی اعلان نسبت به هشتگ شدن خودشون دریافت کنند






--  Tables for Hashtags
-- خب حالا میخوایم بدونیم چطوری میتونیم نوع هشتگ رو با پست ها مدل کنیم
-- پس ما میتونیم در این قسمت اسکیمای هشتگ هارو ایجاد کنیم

-- Table hashtags {
--     id SERIAL [pk,increment]
--     title VARCHAR(20),
--     created_at TIMESTAMP
-- }

-- Table hashtags_posts{
--     id SERIAL [pk,increment]
--     hashtag_id INTEGER [ref: > hashtags.id]
--     post_id INTEGER [ref: > posts.id]
-- }






--  A Few More User Columns

-- خب توی این بخش میخوایم تجدید نظری انجام بدیم و دو ستون به جدول کاربران اضافه کنیم 
-- بنابراین با اطلاعاتی که از پیج شخصی یک کاربر اینستاگرام بدست اوردیم باید همیچن ستون هایی
-- رو هم به جدول اضافه کنیم
-- Table users {
--     id SERIAL [pk,increment]
--     userName VARCHAR(50)
--     bio VARCHAR(400)
--     avatar VARCHAR(200)
--     phone VARCHAR(25)
--     email VARCHAR(40)
--     password VARCHAR(50)
--     status VARCHAR(50)
--     created_at TIMESTAMP
--     updated_at TIMESTAMP
-- }






-- Why No Number of Followers or Posts
-- خب حالا میخواهیم تعداد فالو کننده هارو هم تنظیم کنیم
-- Table followers{
--     id SERIAL [pk,increment]
--     leader_id INTEGER [ref: > users.id]
--     follower_id INTEGER [ref: > users.id]
-- }







Table users {
    id SERIAL [pk,increment]
    userName VARCHAR(50)
    bio VARCHAR(400)
    avatar VARCHAR(200)
    phone VARCHAR(25)
    email VARCHAR(40)
    password VARCHAR(50)
    status VARCHAR(50)
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

Table hashtags {
    id SERIAL [pk,increment]
    title VARCHAR(20),
    created_at TIMESTAMP
}

Table hashtags_posts{
    id SERIAL [pk,increment]
    hashtag_id INTEGER [ref: > hashtags.id]
    post_id INTEGER [ref: > posts.id]
}

Table followers{
    id SERIAL [pk,increment]
    leader_id INTEGER [ref: > users.id]
    follower_id INTEGER [ref: > users.id]
}