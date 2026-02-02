
SELECT username, COUNT(*) AS Tedad FROM instagram.users U
JOIN (
     SELECT user_id FROM instagram.photo_tags
     UNION ALL
     SELECT user_id FROM instagram.caption_tags
) AS Tags ON Tags.user_id = U.id
GROUP BY username
ORDER BY COUNT(*) DESC;

----------------------------------------------------------------------

-- حالا میتونیم باتوجه به مورد ساخته شده توسط ویو ها خیلی بهتر ساب کوئری خودمون رو مدیریت کنیم

CREATE VIEW instagram.tags_views AS (
  SELECT id ,user_id,post_id,created_at, 'photo_tags' AS TYPE FROM instagram.photo_tags
  UNION ALL
    SELECT id ,user_id,post_id,created_at, 'caption_tags' AS TYPE FROM instagram.caption_tags

);


-- ----------------------------------------------------

SELECT * FROM instagram.tags_views
WHERE
     type = 'caption_tags'


     
SELECT username, COUNT(*) AS Tedad FROM instagram.users U
JOIN instagram.tags_views Tags ON Tags.user_id = U.id
GROUP BY username
ORDER BY COUNT(*) DESC;

--------------------------------------------------------------


CREATE VIEW instagram.recent_posts_views AS (
SELECT
        *
    FROM instagram.posts
    ORDER BY created_at DESC 
    LIMIT 5

);

SELECT username 
FROM 
instagram.recent_posts_views RP 
JOIN instagram.users U ON U.id = RP.user_id; 

-- خب حالا اگر میخواهیم در تغییر ویو کاری انجام دهیم


CREATE OR REPLACE VIEW instagram.recent_posts_views AS (
SELECT
        *
    FROM instagram.posts
    ORDER BY created_at DESC 
    LIMIT 10

);

SELECT *
FROM 
instagram.recent_posts_views;

-- همچنین برای پاک کردن ویو ها
DROP VIEW instagram.recent_posts_views