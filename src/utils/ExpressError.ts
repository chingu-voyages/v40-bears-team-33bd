// similar to a regular JS error, but with an extra spot for storing the HTTP status code
class ExpressError extends Error {
  message: string
  statusCode: number

  constructor(message: string, statusCode = 500) {
    super()
    this.message = message
    this.statusCode = statusCode
  }
}

export default ExpressError
