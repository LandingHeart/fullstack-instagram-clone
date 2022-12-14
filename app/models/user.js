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
      email: {
        type: DataTypes.STRING(255),
        required: true,
        unique: true,
        allowNull: false,
      },
      userame: { type: DataTypes.STRING(255), required: true },
      password: { type: DataTypes.STRING(20), required: true },
      last_edit_date: DataTypes.DATE,
    },
    {
      sequelize,
      modelName: "users",
    }
  );

  return User;
};
