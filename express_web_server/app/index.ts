import compression from 'compression';
import cors from 'cors';
import express from 'express';
import SOCIAL_NETWORK from '../routes/socialNetWorks.route';
import SOCIAL_NETWORK_USERS from '../routes/socialNetWorks.Users.route';
const app = express();
const appRouter = express.Router();
app.use(express.json());
app.use(compression());
app.use(cors());
app.use(express.urlencoded({ extended: true }));

// -----------------------------App Router---------------------------------------
app.use('/api', appRouter);
appRouter.use('/posts', express.static('upload'), SOCIAL_NETWORK);
appRouter.use('/users', SOCIAL_NETWORK_USERS);

export default app;
