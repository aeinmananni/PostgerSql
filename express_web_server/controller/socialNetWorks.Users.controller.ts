import { type Request, type Response } from 'express';
import { asyncHandler } from '../utils';
import {
    AddUserService,
    getUserFindByIdService,
    GetUsersAllService,
    RemoveUserService,
    UpdateUserService,
} from '../service/socialNetWorksUsers.service';

export const GetAllUsersController = asyncHandler(
    async (req: Request, res: Response) => {
        const result = await GetUsersAllService();
        return res.status(200).send(result);
    },
);

export const GetUserFindByIdController = asyncHandler(
    async (req: Request, res: Response) => {
        const { id } = req.params;
        const user = await getUserFindByIdService(+id);
        return res.status(200).send(user);
    },
);

export const AddUserController = asyncHandler(
    async (req: Request, res: Response) => {
        const user = await AddUserService(req.body);
        return res.status(200).send(user);
    },
);

export const EditUserController = asyncHandler(
    async (req: Request, res: Response) => {
        const user = await UpdateUserService(req.body);
        return res.status(200).send(user);
    },
);

export const RemoveUserController = asyncHandler(
    async (req: Request, res: Response) => {
        const { id } = req.params;
        const user = await RemoveUserService(+id);
        return res.status(200).send(user);
    },
);
