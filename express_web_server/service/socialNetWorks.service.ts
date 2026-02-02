import { PostsType } from '../models';
import {
    GetsocialnetworksRepo,
    AddsocialnetworksRepo,
} from '../repositories/socialNetWork.repositories';

export const GetsocialnetworksService = async () => {
    const result: PostsType[] = await GetsocialnetworksRepo();
    if (!result) {
        throw new Error('Invalid Query!');
    }

    return result;
};

export const AddsocialnetworksService = async (data: Omit<PostsType, 'id'>) => {
    const result = await AddsocialnetworksRepo({
        url: 'URL',
        lng: data.lng,
        lat: data.lat,
    });

    return result;
};
