import { QueryResult } from 'pg';
import { pool } from '../database';
import { UsersType } from '../models';

export const GetUsersAllRepo = async (): Promise<UsersType[]> => {
    const Users = await pool.query<UsersType>(`SELECT
    id,
    first_name,
    last_name,
    user_name,
    password,
    created_at,
    updated_at
FROM
    instagram.users
ORDER BY id;
`);

    return Users.rows;
};

export const GetUserFindByIdRepo = async (id: number): Promise<UsersType> => {
    const { rows } = await pool.query<UsersType>(
        `
SELECT
    id,
    first_name,
    last_name,
    user_name,
    password,
    created_at,
    updated_at
FROM
    instagram.users
WHERE id = $1

`,
        [id],
    );

    return rows[0];
};

export const AddUserRepo = async ({
    first_name,
    last_name,
    user_name,
    password,
}: Omit<UsersType, 'id'>): Promise<Pick<UsersType, 'id' | 'created_at'>> => {
    const user = await pool.query<Pick<UsersType, 'id' | 'created_at'>>(
        `

       INSERT INTO instagram.users(first_name,last_name,user_name,password)
            VALUES ($1,$2,$3,$4) RETURNING id , created_at ;
        `,
        [first_name, last_name, user_name, password],
    );

    return user.rows[0];
};

export const UpdateUserRepo = async ({
    id,
    first_name,
    last_name,
    user_name,
    password,
}: UsersType): Promise<Pick<UsersType, 'id' | 'updated_at'>> => {
    const user = await pool.query(
        `
            UPDATE
                instagram.users
            SET
                first_name = $2,
                last_name = $3,
                user_name = $4,
                password = $5
            WHERE
                id = $1 RETURNING id , created_at ;


        `,
        [id, first_name, last_name, user_name, password],
    );

    return user.rows[0];
};

export const RemoveUserRepo = async (
    id: number,
): Promise<Pick<UsersType, 'id'>> => {
    const user = await pool.query<Pick<UsersType, 'id'>>(
        `
        DELETE
            FROM instagram.users
        WHERE id = $1 RETURNING id ;

        `,
        [id],
    );

    return user.rows[0];
};
