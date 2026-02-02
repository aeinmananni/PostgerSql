import { Router } from 'express';
import {
    GetsocialnetworksController,
    AddsocialnetworksController,
} from '../controller/socialNetWorks.controller';

const router: Router = Router();

router.get('/GET/All', GetsocialnetworksController);
router.post('/POST/Add', AddsocialnetworksController);

export default router;
