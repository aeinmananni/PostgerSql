import pg from 'pg';
import 'dotenv-safe/config';

export const pool = new pg.Pool({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    database: process.env.DATABASE_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
});
