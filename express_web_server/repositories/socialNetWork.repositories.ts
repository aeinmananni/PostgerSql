import { pool } from "../database";
import { PostsType } from "../models";

export const GetsocialnetworksRepo = async (): Promise<PostsType[]> => {
  const result = await pool.query<PostsType>("SELECT * FROM instagram.posts");

  return result.rows;
};

export const AddsocialnetworksRepo = async ({
  url,
  lng,
  lat,
}: Omit<PostsType, "id">) => {
  const result = await pool.query<Omit<PostsType, "id">>(
    `INSERT INTO instagram.posts(url,lat,lng,loc) VALUES($1,$2,$3,$4);`,
    [url, lat, lng, `(${lng},${lat})`],
  );

  return result.oid;
};
