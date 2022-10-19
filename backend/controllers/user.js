const UserService = require("../services/UserService");

module.exports = class User {
  static async apiGetAlluser(req, res, next) {
    try {
      const user = await UserService.findAll;
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiGetOneuser(req, res, next) {
    try {
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
