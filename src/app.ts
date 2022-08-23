import express from 'express'
import cors from 'cors'
import passport from 'passport'
import routes from './routes'
import morgan from './middlewares/logger.middleware'

const app = express()

app.use(express.json())
app.use(
  express.urlencoded({
    extended: true,
  }),
)
app.use(cors())
app.use(passport.initialize())
app.use(morgan)

app.use('/api', routes)

export default app
