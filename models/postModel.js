"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    static associate(models) {
      Post.belongsTo(models.users);
      models.users.hasMany(Post);
    }
  }
  Post.init(
    {
      id: {
        allowNull: true,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      title: {
        type: DataTypes.STRING(255),
        required: true,
        allowNull: false,
      },
      likes: {
        type: DataTypes.INTEGER,
        defaultValue: 0,
        allowNull: false,
      },
      dislikes: {
        type: DataTypes.INTEGER,
        defaultValue: 0,
        allowNull: false,
      },
      postImgUrl: {
        type: DataTypes.STRING,
        required: true,
        allowNull: false,
      },
      width: {
        type: DataTypes.INTEGER,
        required: true,
        allowNull: false,
      },
      height: {
        type: DataTypes.INTEGER,
        required: true,
        allowNull: false,
      },
      aspectRatio: {
        type: DataTypes.DOUBLE,
        required: true,
        allowNull: false,
      },
      description: {
        type: DataTypes.STRING(255),
        required: true,
        allowNull: false,
      },
      //foreign key
      userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      sequelize,
      timestamps: true,
      modelName: "posts",
      tableName: "posts",
    }
  );

  return Post;
};
