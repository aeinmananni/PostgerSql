--Common Table Expressions


SELECT * FROM instagram.users
SELECT * FROM  instagram.posts
SELECT * FROM instagram.photo_tags
SELECT * FROM instagram.caption_tags
INSERT INTO instagram.caption_tags(user_id,post_id)
VALUES
        (31,34),
        (33,32),
        (35,38),
        (37,34),
        (40,41),
        (34,35),
        (37,36),
        (32,39)

INSERT INTO instagram.photo_tags(user_id,post_id,x,y)
VALUES
        (33,32,213,222),
        (32,36,432,223),
        (37,38,123,112),
        (40,41,432,321),
        (37,33,877,311),
        (35,39,887,900),
        (34,33,223,314),
        (38,40,223,123),
        (39,35,115,222),
        (33,37,444,655)



SELECT
    instagram.users.username , Tags.created_at
FROM
    instagram.users
JOIN (
        SELECT user_id, created_at
        FROM
            instagram.caption_tags

            UNION ALL
            SELECT
                    user_id , created_at FROM instagram.photo_tags
            
) AS Tags ON Tags.user_id = instagram.users.id;


-- مدل دیگه ای که میتونیم خیلی خواناتر یک کوئری رو اجرا کنیم

WITH Tags AS (
     SELECT user_id, created_at
        FROM
            instagram.caption_tags

            UNION ALL
            SELECT
                    user_id , created_at FROM instagram.photo_tags
)
SELECT username,Tags.created_at
FROM
    instagram.users U JOIN Tags ON Tags.user_id = U.id;
   




SELECT * FROM Tags