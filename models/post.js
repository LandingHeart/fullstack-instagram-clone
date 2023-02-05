"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    static associate(models) {}
  }
  Post.init(
    {
      id: {
        allowNull: true,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
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
      last_edit_date: Date.now(),
    },
    {
      sequelize,
      modelName: "posts",
      tableName: "posts",
    }
  );

  return Post;
};
