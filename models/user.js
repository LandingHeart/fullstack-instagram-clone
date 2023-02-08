"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {}
    async validatePassword(password) {}
  }

  User.init(
    {
      //initialize model field
      id: {
        allowNull: true,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
        noUpdate: true,
      },
      email: {
        type: DataTypes.STRING(255),
        required: true,
        unique: true,
        allowNull: false,
        noUpdate: true,
      },
      phone: {
        type: DataTypes.INTEGER,
        allowNull: true,
        unique: true,
      },
      username: {
        type: DataTypes.STRING(255),
        required: true,
        unique: true,
        noUpdate: true,
      },
      password: {
        type: DataTypes.STRING(20),
        required: true,
      },
      last_edit_date: DataTypes.DATE,
    },
    {
      sequelize,
      modelName: "users",
      tableName: "users",
    }
  );

  return User;
};
