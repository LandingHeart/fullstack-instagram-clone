const Post = require("../models/index").post;

module.exports = class PostService {
  static async findAll() {
    try {
      const allPost = await Post.findAll();
      return allPost;
    } catch (error) {
      console.log(`could not find all post${error}`);
    }
  }
};
