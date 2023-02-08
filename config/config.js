// {
//   "development": {
//     "username": "postgres",
//     "password": "admin",
//     "database": "insdb",
//     "host": "localhost",
//     "dialect": "postgres"
//   },
//   "test": {
//     "username": "postgres",
//     "password": "admin",
//     "database": "insdb",
//     "host": "127.0.0.1",
//     "dialect": "postgres"
//   },
//   "production": {
//     "use_env_variable": "DATABASE_URL",
//     "dialect": "postgres",
//     "dialectOptions": {
//       "ssl": {
//         "require": true,
//         "rejectUnauthorized": false
//       }
//     }
//   }
// }

require("dotenv").config();
module.exports = {
  development: {
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    host: "127.0.0.1",
    dialect: "postgres",
    logging: false,
    dialectOptions: {
      bigNumberStrings: true,
    },
  },
  test: {
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    host: "127.0.0.1",
    port: 3306,
    dialect: "postgres",
    dialectOptions: {
      bigNumberStrings: true,
    },
  },
  production: {
    dialect: "postgres",
    database: process.env.DATABASE_URL,
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false,
      },
    },
  },
};
