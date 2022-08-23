import express, { NextFunction, Request, Response } from 'express'
import cors from 'cors'
import passport from 'passport'

import config from './config'
import routes from './routes'

import morgan from './middlewares/logger.middleware'
import Logger from './utils/logger.utils'
import ExpressError from './utils/ExpressError'

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

const server = app.listen(config.appPort, () => {
  Logger.debug(`Server is up and running @ http://localhost:${config.appPort}`)
})

export default server
