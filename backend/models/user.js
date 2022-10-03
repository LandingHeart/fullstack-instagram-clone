"use strict";
const { Model } = require("sequelize");
const Post = require("./post");

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
      // define association/relation here, one to many, many to many
      // User.hasMany(models.Post, { as: "user_id" });
    }
  }
  User.init(
    {
      //initialize model field
    },
    {
      freezeTableName: true,
      sequelize,
      modelName: "user"
    }
  );
  return User;
};
