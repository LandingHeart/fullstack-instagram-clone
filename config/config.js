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
    url: process.env.DATABASE_URL,
    ssl: true,
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false,
      },
    },
  },
};
