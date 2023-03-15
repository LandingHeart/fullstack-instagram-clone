const { json } = require("sequelize");
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
      res.send(post);
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiCreatePost(req, res, next) {
    const body = req.body;
    try {
      const post = await PostService.createPost(body);
      res.send(post);
    } catch (error) {
      res.status(500), json({ error: error });
    }
  }

  static async deletePost(req, res, next) {
    try {
      const result = await PostService.deletePost(req.params.postId);
      if (result instanceof Error) {
        throw result;
      }
      return res.status(204).send();
    } catch (error) {
      return res.status(error.status).json({ error: error.message });
    }
  }
};
