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
        type: DataTypes.STRING(1024),
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
      deletedAt: {
        type: DataTypes.DATE,
        allowNull: true,
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
      timestamps: true,
      modelName: "comments",
      tableName: "comments",
    }
  );

  return Comment;
};
