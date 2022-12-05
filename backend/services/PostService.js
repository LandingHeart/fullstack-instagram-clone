const { Post } = require("../models/post");
const { Op } = require("sequelize");

module.exports = class PostService {
  // static async findAll() {
  //   try {
  //     console.log(Post);
  //     const allPost = await Post.findAll();
  //     console.log(Post.findAll());
  //     return allPost;
  //   } catch (error) {
  //     console.log(`could not find all post${error}`);
  //   }
  // }

  static async searchPostWithTitle(title) {
    try {
      const post = await Post.findAll({
        where: {
          title: {
            [Op.like]: "%" + title,
          },
        },
      });
      return post;
    } catch (error) {
      console.log(`could not find all post${error} with title ${title}`);
    }
  }
};
