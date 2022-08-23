# v40-bears-team-33bd

## installation

1. `yarn`
2. `yarn build` (initiates typescript? i think.)
3. `yarn start` (starts typescript server? i think.)
4. `yarn dev` (starts dev server, nodemon)


### but first!

You'll need to link up a postgres server to your .env file (you'll need to make one.)

The template for your .env file can be found in `./src/config.ts`. This
file references environment variables in .env— if we need to add a new env variable,
declare it in .env and then call it in `config.ts` for use throughout the app.

Routes placed in `routes/index.ts` can be found at `<BASE_URL>/api/`. If we want
to have some routes go somewhere else, such as `<BASE_URL>/auth/` you should create
a new folder and reference that route in `./src/app.ts`.
