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
        throw Error("user exist");
      }
      res.status(201).send(user);
    } catch (error) {
      if (error.message == "user exist") {
        res.status(409).json({ error: error.message });
        return;
      }
      res.status(500).json({ error: error.message });
    }
  }

  static async apiUpdateOneuser(req, res, next) {
    const body = req.body
    try {
      if (body.email != null || body.username != null || body.id != null) {
        throw Error("can not change email or username");
      }
      const user = await UserService.updateUser(req.body, req.params.username);
      res.send(user);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  static async apiDeleteuser(req, res, next) {
    try {
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
};
