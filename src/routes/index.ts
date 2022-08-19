import express from 'express'
import { PrismaClient } from '@prisma/client'

const routes = express.Router()
const prisma = new PrismaClient()

routes.get('/', async(req: express.Request, res: express.Response) => {
  const user = await prisma.post.findMany()
  res.json(user)
})

routes.post('/', async(req: express.Request, res: express.Response) => {
  const data = req.body
  const user = await prisma.post.create({
    data: {
      title: data.title,
      content: data.content,
      author: data.author,
    },
  })
    res.json(user)
})

routes.patch('/:id', async(req: express.Request, res: express.Response) => {
  const data = req.body
  const user = await prisma.post.update({
    where: {
      id: +req.params.id
  },
  data: {
      title: data.title,
      content: data.content,
      author: data.author
  }
  })
   res.json(user)
})

routes.delete('/:id', async(req: express.Request, res: express.Response) => {
  const user = await prisma.post.delete({
    where: {
      id: +req.params.id
    },
    select: {
      title: true
    }
  })
  res.json(user)
})

export default routes
