const Post = require("../models/user").post;
var posts = require("../seeders/posts.json");
module.exports = class PostService {
  static async findAll() {
    try {
      const allPost = posts;
      // const allPost = await Post.findAll()
      return allPost;
    } catch (error) {
      console.log(`could not find all post${error}`);
    }
  }
};
