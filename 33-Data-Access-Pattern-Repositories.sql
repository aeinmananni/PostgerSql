



SELECT 
    id,
    first_name,
    last_name,
    user_name,
    password
FROM
    instagram.users;


    INSERT INTO instagram.users (
    id,
    first_name,
    last_name,
    user_name,
    password
) VALUES
(
    '1',
    'Ali',
    'Ahmadi',
    'ali_ahmadi',
    'hashed_password_1'
),
(
    '2',
    'Sara',
    'Mohammadi',
    'sara_m',
    'hashed_password_2'
),
(
    '3',
    'Reza',
    'Karimi',
    'reza_k',
    'hashed_password_3'
),
(
    '4',
    'Negin',
    'Hosseini',
    'negin_h',
    'hashed_password_4'
),
(
    '5',
    'Amir',
    'Jafari',
    'amir_j',
    'hashed_password_5'
);



PREPARE GetUserFindById(INTEGER) AS 
    SELECT 
    id,
    first_name,
    last_name,
    user_name,
    password
FROM
    instagram.users
WHERE id = $1

EXECUTE GetUserFindById(2)



SELECT * FROM instagram.users


       INSERT INTO instagram.users(first_name,last_name,user_name,password)
            VALUES ('rty','yyy','222','333') RETURNING id , created_at ;





             UPDATE
                instagram.users
            SET
                first_name = 'eeee',
                last_name = 'eeee',
                user_name = 'user-eee',
                password = '7654'
            WHERE
                id = 4 RETURNING id , updated_at ;