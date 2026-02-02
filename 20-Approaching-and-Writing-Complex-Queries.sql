--  Adding Some Data



INSERT INTO instagram.users(username,bio,avatar,phone,email,password,status)
VALUES 
        ('USER1','this bio created with user1','user1.jpg','09125431112','user1@gmail.com','1234A1234a','already free'),
        ('USER2','this bio created with user2','user2.jpg','09136541243','user2@gmail.com','1234B1234b','already free'),
        ('USER3','this bio created with user3','user3.jpg','09874321243','user3@gmail.com','1234C1234c','already free'),
        ('USER4','this bio created with user4','user4.jpg','09541235465','user4@gmail.com','1234D1234d','already free'),
        ('USER5','this bio created with user5','user5.jpg','09234568787','user5@gmail.com','1234E1234e','already free'),
        ('USER6','this bio created with user6','user6.jpg','09016542387','user6@gmail.com','1234F1234f','already free'),
        ('USER7','this bio created with user7','user7.jpg','09661548765','user7@gmail.com','1234G1234g','already free'),
        ('USER8','this bio created with user8','user8.jpg','09448770000','user8@gmail.com','1234H1234h','already free'),
        ('USER9','this bio created with user9','user9.jpg','09651112312','user9@gmail.com','1234I1234i','already free'),
        ('USER10','this bio created with user10','user10.jpg','09112345430','user100@gmail.com','1234K1234k','already free')


SELECT
        *
FROM
    instagram.users;

TRUNCATE TABLE instagram.users CASCADE;
--------------------------------------------------------------------------------------------------


INSERT INTO instagram.posts(url,caption,lat,lng,user_id)
VALUES
        ('POST2.jpg','this cation created for post2',31.43222,56.123222,31),
        ('POST3.jpg','this cation created for post3',30.22321,56.322333,35),
        ('POST4.jpg','this cation created for post4',34.4234,67.21223,33),
        ('POST5.jpg','this cation created for post5',31.43222,56.123222,34),
        ('POST6.jpg','this cation created for post6',31.43222,56.123222,35),
        ('POST7.jpg','this cation created for post7',31.43222,56.123222,37),
        ('POST8.jpg','this cation created for post8',31.43222,56.123222,39),
        ('POST9.jpg','this cation created for post9',31.43222,56.123222,33),
        ('POST10.jpg','this cation created for post10',31.43222,56.123222,40),
        ('POST11.jpg','this cation created for post11',31.43222,56.123222,32);

TRUNCATE TABLE instagram.posts CASCADE;

SELECT
    *
FROM
instagram.posts;

------------------------------------------------------------


INSERT INTO instagram.comments(contents,user_id,post_id)
VALUES
        ('This is Good post And Funny1',32,35),
        ('This is Good post And Funny2',33,39),
        ('This is Good post And Funny3',34,36),
        ('This is Good post And Funny4',31,36),
        ('This is Good post And Funny5',36,38),
        ('This is Good post And Funny6',40,33),
        ('This is Good post And Funny7',39,37),
        ('This is Good post And Funny8',35,35),
        ('This is Good post And Funny9',38,32),
        ('This is Good post And Funny10',31,37),
        ('This is Good post And Funny11',38,41),
        ('This is Good post And Funny12',32,38),
        ('This is Good post And Funny13',33,38),
        ('This is Good post And Funny14',40,41);

TRUNCATE TABLE instagram.comments  CASCADE
SELECT  
        *       
FROM 
        instagram.comments;

--------------------------------------------------------------------------

TRUNCATE TABLE instagram.likes

INSERT INTO instagram.likes(user_id,post_id,comment_id)
VALUES
        (33,null,44),
        (35,null,50),
        (36,34,null),
        (38,34,null),
        (38,null,46),
        (40,null,51),
        (32,37,null)

SELECT * FROM instagram.likes

---------------------------------------------------------

--  Highest User ID's Exercise
-- خب حالا فرض کنیم میخوایم ایدی های اخر جدول کاربران رو دربالاترین سطح قرار بدیم

SELECT * FROM instagram.users
ORDER BY id DESC
LIMIT 3

------------------------------------------------------------------------
--  Solving for Posts by User
-- خب برای مثال میخوام اول بین جدول کاربران و پست ها ارتباط برقرا کنم و پست های مربوط به 
-- یک کار بر با ایدی خاص رو ببینم

SELECT
        *
FROM
        instagram.posts P
INNER JOIN 
        instagram.users U
ON P.user_id = U.id
WHERE
        P.user_id = 33;
-------------------------------------------------------------
-- Likes Per User
-- خب حالا میتونیم با گروه بندی که انجام میدیم متوجه بشیم 
-- کدوم یوزر چند لایک میتونسته داشته باشه رو دریفات کنیم

SELECT
        U.username,COUNT(*)
FROM
        instagram.users U
JOIN instagram.likes L ON  U.id = L.user_id
GROUP BY U.username