"use strict";
const { Model } = require("sequelize");
const bcrypt = require("bcrypt");
// const UserService = require("../services/UserService");

module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
      User.hasOne(models.refresh_tokens);
      models.refresh_tokens.belongsTo(User);
      User.belongsToMany(models.users, {
        as: "follower",
        through: "followers",
        foreignKey: "followingId",
      });
      User.belongsToMany(models.users, {
        as: "following",
        through: "followers",
        foreignKey: "followerId",
      });
    }
    async validatePassword(password) {}
    static async encryptPassword(password) {
      const saltRounds = 10;
      const salt = await bcrypt.genSalt(saltRounds);
      const hash = await bcrypt.hash(password, salt);
      return hash;
    }
  }

  User.init(
    {
      //initialize model field
      id: {
        allowNull: true,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      email: {
        type: DataTypes.STRING(255),
        required: true,
        unique: true,
        allowNull: false,
      },
      phone: {
        type: DataTypes.STRING(20),
        allowNull: true,
        unique: true,
      },
      username: {
        type: DataTypes.STRING(255),
        required: true,
        unique: true,
      },
      password: {
        type: DataTypes.STRING(20),
        required: true,
      },
      role: {
        type: DataTypes.STRING(32),
        defaultValue: "user",
        allowNull: false,
      },
    },
    {
      sequelize,
      timestamps: true,
      modelName: "users",
      tableName: "users",
      defaultScope: {
        raw: true,
      },
    }
  );
  //Sequelize Hooks
  User.beforeCreate(async (user, options) => {
    const hashPassword = await User.encryptPassword(user.password);
    user.password = hashPassword;
  });
  return User;
};
