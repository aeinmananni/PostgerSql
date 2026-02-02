import { Pool } from "pg";
import path from "path";
import dotenvSafe from "dotenv-safe";

dotenvSafe.config({
  path: path.resolve(process.cwd(), ".env"),
  example: path.resolve(process.cwd(), ".env.example"),
});

const pool = new Pool({
  host: process.env.DB_HOST!,
  port: Number(process.env.DB_PORT),
  database: process.env.DATABASE_NAME!,
  user: process.env.DB_USER!,
  password: process.env.DB_PASSWORD!,
});

const run = async (): Promise<void> => {
  try {
    await pool.query(`
      UPDATE instagram.posts
      SET loc = POINT(lng, lat)
      WHERE loc IS NULL;
    `);

    console.log("Update Completed");
  } catch (err) {
    if (err instanceof Error) {
      console.error(err.message);
    } else {
      console.error("Unknown error", err);
    }
  } finally {
    await pool.end();
  }
};

run();
