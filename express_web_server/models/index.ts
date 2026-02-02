export type PostsType = {
    id: string;
    url: string;
    lng: string;
    lat: string;
};

export type UsersType = {
    id?: number;
    first_name: string;
    last_name: string;
    user_name: string;
    password: string;
    created_at: string;
    updated_at: string;
};
