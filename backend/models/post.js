"use strict";
const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    static associate(models) {
      // define association/relation here, one to many, many to many
    }
  }
  Post.init(
    {
      user_id: DataTypes.INTEGER,
      title: DataTypes.STRING,
      post_img: DataTypes.STRING,
      description: DataTypes.STRING,
      last_edit_date: DataTypes.STRING
    },
    {
      freezeTableName: true,
      sequelize,
      modelName: "post"
    }
  );
  return Post;
};
