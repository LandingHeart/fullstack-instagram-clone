const Post = require("../models/index").posts;
const { Op } = require("sequelize");

module.exports = class PostService {
  static async findAll() {
    try {
      const allPost = await Post.findAll();
      return allPost;
    } catch (error) {
      console.log(`could not find all post${error}`);
    }
  }

  static async searchPostWithTitle(title) {
    try {
      const post = await Post.findAll({
        where: {
          title: {
            [Op.like]: "%" + title + "%",
          },
        },
      });
      return post;
    } catch (error) {
      console.log(`could not find all post${error} with title ${title}`);
    }
  }

  static async createPost(body) {
    try {
      const post = await Post.create(body);
      return post;
    } catch (error) {
      console.log(`could not create post`);
    }
  }
};
