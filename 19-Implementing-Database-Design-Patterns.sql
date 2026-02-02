-- Back to Postgres
-- خب حالا که ما اسکیما های خود رو ترکیب کردیم حالا قصد داریم اون رو داخل دیتابیس پیاده سازی کنیم
-- ما پایگاه داده و اسکیمای اینستارگرام خودمون رو از قبل ایجاد کردیم و حالا باید پیاده سازی جدول هارو انجام بدیم


اسکیما هایی که ایجاد کردیم
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




--  Creating Tables with Checks
-- و حالا باید جدول های اون هارو پیاده سازی کنیم

CREATE TABLE instagram.users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    bio VARCHAR(400) ,
    avatar VARCHAR(200),
    phone VARCHAR(25),
    email VARCHAR(40),
    password VARCHAR(50),
    status VARCHAR(15),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CHECK_PHONE_EMAIL CHECK(COALESCE(phone,email) IS NOT NULL)

);

SELECT 
    *
FROM 
    instagram.users


--------------------------------------------------------------------------------------------

--  Posts Creation

-- -90 < lat < 90 مقدار ولید برای عرض جغرافیایی 
-- -180 < lng < 180 مقدار ولید برای طول جغرافیایی


CREATE TABLE instagram.posts(
    id SERIAL PRIMARY KEY,
    url VARCHAR(200) NOT NULL,
    caption VARCHAR(300),
    lat REAL,
    lng REAL, 
    user_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CHECK_LAT CHECK(lat >= -90 AND lat <= 90),
    CONSTRAINT CHECK_LNG CHECK(lat >= -180 AND lat <= 180)
)


SELECT 
    *
FROM
    instagram.posts
----------------------------------------------------------------------------------

--  Comments Creation
-- خب در این بخش میخوایم جدول نظرات رو راه اندازی کنیم


CREATE TABLE instagram.comments(
    id SERIAL PRIMARY KEY,
    contents VARCHAR(240) NOT NULL,
    user_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    post_id INTEGER NOT NULL REFERENCES instagram.posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

SELECT
    *
FROM
    instagram.comments
-------------------------------------------------------------------------------------------

--  Likes Creation
-- ساخت جدول لایک ها


CREATE TABLE instagram.likes(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    post_id INTEGER REFERENCES instagram.posts(id) ON DELETE CASCADE,
    comment_id INTEGER REFERENCES instagram.comments(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CHECK_POSTID_COMMENTID CHECK(
                                            COALESCE((post_id)::BOOLEAN::INTEGER,0)
                                            +
                                            COALESCE((comment_id)::BOOLEAN::INTEGER,0)
                                            = 1
                                            ),
    CONSTRAINT UNIQUE_LIKES UNIQUE(user_id,post_id,comment_id)

);

SELECT
        *
FROM
        instagram.likes

----------------------------------------------------------------------------------
-- Photo Tags and Caption Tags


CREATE TABLE instagram.photo_tags(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    post_id INTEGER NOT NULL REFERENCES instagram.posts(id) ON DELETE CASCADE,
    x INTEGER NOT NULL,
    y INTEGER NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT UNIQUE_USERID_POSTID UNIQUE(user_id,post_id)
);

SELECT 
    *
FROM    
    instagram.photo_tags


---------------------------------------
-- created caption tags table


CREATE TABLE instagram.caption_tags(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    post_id INTEGER NOT NULL REFERENCES instagram.posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT UNIQUE_USERID_POST_ID_CAPTION_TAGS UNIQUE(user_id,post_id)
);

SELECT
        *
FROM 
    instagram.caption_tags

----------------------------------------




--  Creating Hashtags, Hashtag Posts, and Followers


CREATE TABLE instagram.hashtags(
    id SERIAL PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

SELECT
    *
FROM
    instagram.hashtags

-------------------------------------------------

CREATE TABLE instagram.hashtags_posts(
    id SERIAL PRIMARY KEY,
    hashtag_id INTEGER NOT NULL REFERENCES instagram.hashtags(id) ON DELETE CASCADE,
    post_id INTEGER NOT NULL REFERENCES instagram.posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT UNIQUE_HASHTAGID_POSTID_HASHTAGS_POSTS UNIQUE(hashtag_id,post_id)

);

SELECT
    *
FROM
    instagram.hashtags_posts

-------------------------------------------------------------------



CREATE TABLE instagram.followers(
    id SERIAL PRIMARY KEY,
    leader_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    follower_id INTEGER NOT NULL REFERENCES instagram.users(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT UNIQUE_LEADERID_FOLLOWERID_FOLLOWERS UNIQUE(leader_id,follower_id)
);

SELECT
    *
FROM
    instagram.followers