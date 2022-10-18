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
      const { Op } = require("sequelize");
      const query = req.params.query;
      console.log(query);
      const post = await PostService.findAll({
        where: {
          title: {
            [Op.like]: "%" + query,
          },
        },
      });
      res.send(post);
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
};
