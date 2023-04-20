"use strict";

const path = require("path");
const Sequelize = require("sequelize");
const requireAll = require("require-all");
const env = process.env.NODE_ENV || "development";
const db = {};
const config = require(__dirname + "/../config/config.js")[env];
const models = requireAll({
  dirname: path.join(__dirname, "/"),
  filter: /(.+Model)\.js$/,
  excludeDirs: /^\.(git|svn)$/,
  recursive: true,
});

let sequelize;

if (env === "production") {
  sequelize = new Sequelize(process.env.DATABASE_URL, {
    dialectOptions: {
      ssl: {
        require: true,
        rejectUnauthorized: false,
      },
    },
  });
} else {
  sequelize = new Sequelize(
    config.database,
    config.username,
    config.password,
    config,
    {
      logging: true,
    }
  );
}

Object.keys(models).forEach((modelName) => {
  const model = models[modelName](sequelize, Sequelize.DataTypes);
  db[model.name] = model;
});

Object.keys(db).forEach((modelName) => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
