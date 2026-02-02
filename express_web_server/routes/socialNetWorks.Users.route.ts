import { Router } from 'express';
import {
    GetAllUsersController,
    GetUserFindByIdController,
    AddUserController,
    EditUserController,
    RemoveUserController,
} from '../controller/socialNetWorks.Users.controller';

const router: Router = Router();

router.get('/All', GetAllUsersController);
router.get('/:id', GetUserFindByIdController);
router.post('/ADD', AddUserController);
router.put('/UPDATE', EditUserController);
router.delete('/DELETE/:id', RemoveUserController);

export default router;
