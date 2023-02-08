const UserService = require("../services/UserService");

module.exports = class User {
  //Read
  static async apiGetAlluser(req, res, next) {
    try {
      const user = await UserService.findAll;
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }

  static async apiGetOneuser(req, res, next) {
    try {
      const user = await UserService.findOne(req.params.id);
      if (user != null) {
        res.send(user);
      } else {
        res.status(404).json({ error: "user not found" });
      }
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
  //Create
  static async apiCreateNewUser(req, res, next) {
    const body = req.body;
    try {
      const user = await UserService.createUser(body);
      if (user.errors != null) {
        throw Error("user exist");
      }
      res.status(201).json(user);
    } catch (error) {
      if (error.message == "user exist") {
        res.status(409).json({ error: error.message });
        return;
      }
      res.status(500).json({ error: error.message });
    }
  }
  //Update
  static async apiUpdateOneuser(req, res, next) {
    try {
      const user = await UserService.updateUser(req);
      if (user.id != null) {
        res.send(user);
      } else {
        const error = user;
        if (error.message == "user not found") {
          res.status(404).json({ error: "user not found" });
        } else if (error.message == "Attribute confliction") {
          res.status(409).json({ error: "Attribute confliction" });
        } else {
          throw Error("unkown error")
        }
      }
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  //Delete
  static async apiDeleteuser(req, res, next) {
    try {
    } catch (error) {
      res.status(500).json({ error: error });
    }
  }
};
