const UserService = require("../services/UserService");

module.exports = class User {
  static async apiGetAlluser(req, res, next) {
    try {
      const users = await User.findAll();
      res.send(users);
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiGetOneuser(req, res, next) {
    try {
      const { Op } = require("sequelize");
      const id = parseInt(req.params.id)
      const user = User.findAll({
        where: {
          id: {
            [Op.eq]: id,
          },
        },
      });
      res.send(user)
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiCreateNewuser(req, res, next) {
    try {
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiUpdateOneuser(req, res, next) {
    try {
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiDeleteuser(req, res, next) {
    try {
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
};
