"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    static associate(models) {}
  }
  Post.init(
    {
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
    }
  );

  return Post;
};
