const { Sequelize } = require("sequelize");
require("dotenv").config;
const sequelize = new Sequelize(
  process.env.DATABASE_URL || "databaseName",
  process.env.PG_USER,
  process.env.PG_PASSWORD,
  {
    host: "localhost",
    dialect: "postgres",
    dialectOptions: {
      ssl: process.env.DATABASE_URL ? true : false
    }
  }
);

module.exports = sequelize;
