const Post = require("../models/index").post;
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

  static async searchAllpost(title) {
    try {
      const post = await Post.findAll({
        where: {
          title: {
            [Op.like]: "%" + title,
          },
        },
      });
      res.send(post);
    } catch (error) {
      console.log(`could not find all post${error} with title ${title}`);
    }
  }
};
