import { QueryResult } from 'pg';
import { AppError } from '../class/appError.class';
import { UsersType } from '../models';
import {
    AddUserRepo,
    GetUserFindByIdRepo,
    GetUsersAllRepo,
    RemoveUserRepo,
    UpdateUserRepo,
} from '../repositories/socialNetWorkUser.repositories';

export const GetUsersAllService = async (): Promise<UsersType[]> => {
    const result = await GetUsersAllRepo();

    return result;
};

export const getUserFindByIdService = async (
    id: number,
): Promise<UsersType> => {
    const user = await GetUserFindByIdRepo(id);
    if (!user) {
        throw new AppError({
            message: 'Invalid User In Files',
            status_code: 404,
        });
    }

    return user;
};

export const AddUserService = async (
    data: Omit<UsersType, 'id'>,
): Promise<Pick<UsersType, 'id' | 'created_at'>> => {
    const user = await AddUserRepo(data);

    return user;
};

export const UpdateUserService = async (
    data: UsersType,
): Promise<Pick<UsersType, 'id' | 'updated_at'>> => {
    const user = await UpdateUserRepo(data);

    return user;
};

export const RemoveUserService = async (
    id: number,
): Promise<Pick<UsersType, 'id'>> => {
    const user = await RemoveUserRepo(id);

    return user;
};
