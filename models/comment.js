"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Comment extends Model {
    static associate(models) {
      //post-comment one-to-many
      Comment.belongsTo(models.posts);
      models.posts.hasMany(Comment);

      //user-comment one-to-many
      Comment.belongsTo(models.users);
      models.users.hasMany(Comment);
    }
  }
  Comment.init(
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      userComment: {
        type: DataTypes.STRING,
        required: true,
        allowNull: false,
      },
      //foreign key
      postId: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
    },
    {
      sequelize,
      modelName: "comments",
      tableName: "comments",
    }
  );

  return Comment;
};
