"use strict";
const { Model } = require("sequelize");
const { findAll } = require("../services/UserService");
module.exports = (sequelize, DataTypes) => {
  class Post extends Model {
    static associate(models) {
      Post.belongsTo(models.users, {
        foreignKey: "id",
        onDelete: "CASCADE",
      });
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
      modelName: "Posts",
    }
    
  );
  const allPost = Post.findAll();
  console.log(allPost);
  return Post;
};
// async function findAll() {
//   try {
//     console.log(Post);
//     const allPost = await Post.findAll();
//     return allPost;
//   } catch (error) {
//     console.log(`could not find all post${error}`);
//   }
// }
// findAll()

