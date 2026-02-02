export class AppError extends Error {
    status_code;
    constructor(value: { message: string; status_code: number }) {
        super(value.message);
        this.status_code = value?.status_code || 400;
        Error.captureStackTrace(this, this.constructor);
    }
}
