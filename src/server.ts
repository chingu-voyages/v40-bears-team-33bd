import Logger from './utils/logger.utils'
import config from './config'
import app from './app'

const { appPort } = config

app.listen(appPort, () => {
  Logger.debug(`Server is up and running @ http://localhost:${appPort}`)
})
