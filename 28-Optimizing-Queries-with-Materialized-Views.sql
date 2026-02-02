-- Materialized Views

-- پرس و جویی است  که ما میخواهیم به نوعی بسته بندی یا نوع بسته بندی کنیم
-- اما کوئری در زمان های خاص اجرا میشود
-- خب بنابراین باتوجه به رویکرد جدید ما هر بار نمایی را ذخیره میکنیم و دوباره به ان کوئری بزنیم به ان تنایج مراجعه میکنیم
-- ممکن است ما یک کوئری داشته باشم که یخلی طول بکشه تا اجرا بشه
-- بنابراین ما از این روش میتونیم اجرا کنیم که فقط یکبار کوئری رو اجرا کنیم و فقط بارها و بارها بهش مراجعه کنیم




CREATE MATERIALIZED VIEW instagram.weekly_likes AS (


SELECT
        date_trunc('week', COALESCE(P.created_at,C.created_at)) AS Week
    FROM instagram.likes L LEFT JOIN instagram.posts P 
    ON P.id = L.post_id
    LEFT JOIN instagram.comments C 
    ON
      C.id = L.comment_id
    ORDER BY Week DESC
) WITH DATA;





WITH DATA : به این معنی است که برای اولین بار این نما رو ایجاد میکنه
            میخوایم این کوئری رو یکبار اجرا کنیم و تمام نتایج اون رو 
            نگه داریم



SELECT * FROM instagram.weekly_likes

خب حالا برای مثال تغییری توی یکی از جدول های داخل نما ایجاد کردیم 
پس باید نمای خودمون رو بروز کنیم با استفاده از این دستور میتونیم این عمل رو انجام بدیم

REFRESH MATERIALIZED VIEW instagram.weekly_likes;