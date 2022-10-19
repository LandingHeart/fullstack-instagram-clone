"use strict";
const { Model } = require("sequelize");
const User = require("./index").user;
module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    // Post.belongsTo(User, {
    //   foreignKey: "userId",
    //   onDelete: "CASCADE",
    //   as: "post"
    // });
  }
  Post.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      title: { type: DataTypes.STRING(255), required: true, allowNull: false },
      postImgUrl: {
        type: DataTypes.STRING,
        required: true,
        allowNull: false,
      },
      description: {
        type: DataTypes.STRING(255),
        required: true,
        allowNull: false,
      },
      lastEditDate: {
        type: DataTypes.Date,
        required: true,
        allowNull: false,
      },
      createdAt: {
        type: DataTypes.Date,
        required: true,
        allowNull: false,
      },
      createdAt: {
        type: DataTypes.Date,
        required: true,
        allowNull: false,
      },
    },
    {
      freezeTableName: true,
      sequelize,
      modelName: "post",
    }
  );

  return Post;
};
