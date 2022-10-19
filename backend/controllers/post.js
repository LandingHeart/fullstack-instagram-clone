const PostService = require("../services/PostService");

module.exports = class Post {
  static async apiGetAllpost(req, res, next) {
    try {
      const post = await PostService.findAll();
      res.send(post);
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
  static async apiSearchAllpost(req, res, next) {
    try {
      const post = await PostService.searchPostWithTitle(req.params.title);
      res.send(post)
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
};
