import express from 'express';
import { PrismaClient } from '@prisma/client';

const routes = express.Router();
const prisma = new PrismaClient();

routes.get('/', async(req: express.Request, res: express.Response) => {
    const users = await prisma.user.findMany({
        orderBy: {
          email: 'asc',
        },
      })
    res.json(users);
  })

export default routes;