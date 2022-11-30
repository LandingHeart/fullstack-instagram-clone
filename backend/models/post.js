"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    static associate(models) {
      Post.belongsTo(models.user);
    }
  }
  Post.init(
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        allowNull: false,
        autoIncrement: true,
      },
      title: { type: DataTypes.STRING(255), required: true, allowNull: false },
      postImgUrl: {
        type: DataTypes.STRING,
        required: true,
        allowNull: false
      },
      description: {
        type: DataTypes.STRING(255),
        required: true,
        allowNull: false
      },
      last_edit_date: Date.now()
    },
    {
      freezeTableName: true,
      sequelize,
      modelName: "post"
    }
  );

  return Post;
};
