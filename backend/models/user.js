"use strict";
const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
      // define association/relation here, one to many, many to many
      User.hasMany(models.Post, {
        foreignKey: "userId",
        as: "posts"
      });
    }
    async validatePassword(password) {}
  }

  User.init(
    {
      //initialize model field
      email: {
        type: DataTypes.STRING(255),
        required: true,
        unique: true,
        allowNull: false
      },
      password: { type: DataTypes.STRING(20), required: true },
      userame: { type: DataTypes.STRING(255), required: true }
    },
    {
      freezeTableName: true,
      sequelize,
      modelName: "user"
    }
  );

  return User;
};
