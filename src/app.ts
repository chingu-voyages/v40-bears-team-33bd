import express, { NextFunction, Request, Response } from 'express'
import cors from 'cors'
import passport from 'passport'
import routes from './routes'
import morgan from './middlewares/logger.middleware'
import ExpressError from './utils/ExpressError'
import users from './routes/user'

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
app.use('/api', users);

// handle not found routes
app.use((req, res, next) => {
  const err = new ExpressError(`Endpoint: ${req.path} not found`, 404)
  return next(err)
})

// catch all error handler
app.use((err: ExpressError, req: Request, res: Response, next: NextFunction) => {
  const statusCode = err.statusCode || 500
  const message = err.message || 'Something went wrong'

  // tests will error on purpose, don't log during tests
  if (process.env.NODE_ENV !== 'test') {
    console.error(err.stack)
  }

  return res.status(statusCode).json({ error: { statusCode, message } })
})

export default app
