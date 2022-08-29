import express from 'express';
import { PrismaClient } from '@prisma/client';

const users = express.Router();
const prisma = new PrismaClient();

users.get('/', async(req: express.Request, res: express.Response) => {
    const users = await prisma.user.findMany({
        orderBy: {
          email: 'asc',
        },
      })
    res.json(users);
  })

export default users;
