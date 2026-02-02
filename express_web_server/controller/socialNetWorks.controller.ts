import { Request, Response } from 'express';

import { PostsType } from '../models';
import {
    AddsocialnetworksService,
    GetsocialnetworksService,
} from '../service/socialNetWorks.service';

export const GetsocialnetworksController = async (
    req: Request,
    res: Response,
) => {
    const result: PostsType[] = await GetsocialnetworksService();

    return res.status(200).send(
        `
       <table>
          <thead>
              <tr>
                  <th>id</th>
                  <th>url</th>
                  <th>lng</th>
                  <th>lat</th>
              </tr>
          </thead>
          <tbody>
          ${result
              .map(
                  (it, index) =>
                      `
             <tr>
                  <td>${it.id}</td>
                  <td>${it.url}</td>
                  <td>${it.lng}</td>
                  <td>${it.lat}</td>
            </tr>`,
              )
              .join('')}

          </tbody>

       </table/>

       <form method="POST" action="/api/posts/POST/Add">
           <h3>Create posts</h3>
           <div>
                <label>Lng</label>
                <input name="lng"/>
           </div>
           <div>
                <label>lat</label>
                <input name="lat"/>
           </div>
           <button type="submit">Create</button>
       </form>
    `,
    );
};

export const AddsocialnetworksController = async (
    req: Request,
    res: Response,
) => {
    const post = req.body as PostsType;
    await AddsocialnetworksService(post);
    res.redirect('/api/posts/GET/All');
};
