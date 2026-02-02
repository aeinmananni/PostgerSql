--Recursive CTE's


WITH RECURSIVE countdown(val) AS (
    SELECT 10 AS val
    UNION
    SELECT val - 1 FROM countdown WHERE val > 1
)
SELECT
        * FROM countdown;

----------------------------------------------

--Recursive CTE's Step by Step
-- Writing the Query


WITH RECURSIVE suggestions(leader_id,follower_id,depth) AS (
    SELECT
            leader_id,follower_id , 1 AS depth
    FROM instagram.followers
    WHERE 
         follower_id = 1
    UNION
        SELECT
                instagram.followers.leader_id ,instagram.followers.follower_id,depth + 1
                FROM
                    instagram.followers
                JOIN suggestions ON suggestions.leader_id = instagram.followers.follower_id 
                WHERE
                    depth < 3
)
SELECT DISTINCT U.id ,U.username
FROM
    suggestions
JOIN instagram.users AS U ON U.id = suggestions.leader_id
WHERE
     depth > 1
LIMIT 30;