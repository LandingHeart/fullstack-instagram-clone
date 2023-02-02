const { json } = require("sequelize");
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

  static async apiCreateNewUser(req, res, next) {
    const body = req.body;
    try {
      const user = await UserService.createUser(body);
      if (user.errors != null) {
        throw Error("user exist")
      }
      res.send(user);
    } catch (error) {
      if (error.message == "user exist") {
        res.status(409).json({ error: error.message})
        return
      }
      res.status(500).json({ error: error.message})
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
