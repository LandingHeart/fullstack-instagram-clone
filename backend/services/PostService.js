const Post = require("../models/index").post;

module.exports = class PostService {
  static async findAll() {
    try {
      // const allPost = await Post.findAll();
      console.log(Post);
      // return allPost;
    } catch (error) {
      console.log(`could not find all post${error}`);
    }
  }
};
