const User = require("../models/index").users;
const { Op } = require("sequelize");
const bcrypt = require("bcrypt");

module.exports = class UserService {
  //Read
  static async findAll() {
    try {
      const allUser = await User.findAll();
      return allUser;
    } catch (error) {
      console.log(`could not find all user${error}`);
      return error;
    }
  }

  static async findOne(id) {
    const user = await User.findByPk(id);
    return user;
  }
  //Login
  static async login(body) {
    const usernameOrEmail = body.usernameOrEmail;
    const password = body.password;
    try {
      let user;
      if (usernameOrEmail.includes("@") && usernameOrEmail.includes(".com")) {
        user = await User.findOne({ where: { email: usernameOrEmail } });
      } else {
        user = await User.findOne({ where: { username: usernameOrEmail } });
      }
      if (!user) {
        var err = Error(`user not found`);
        err.status = 401;
        throw err;
      }
      if (await bcrypt.compare(password, user.password)) {
        return user;
      } else {
        var err = Error(`incorrect password`);
        err.status = 403;
        throw err;
      }
    } catch (error) {
      console.log(`could not login user`);
      return error;
    }
  }
  //Create
  static async createUser(body) {
    try {
      const user = await User.create(body);
      // console.log(user);
      return user;
    } catch (error) {
      console.log(error);
      return error;
    }
  }
  //Update
  static async updateUser(content) {
    try {
      const user = await User.findByPk(content.id);
      if (user != null) {
        user.set(content);
        await user.save();
        return user.dataValues;
      } else {
        console.log("user not found");
        throw Error("user not found");
      }
    } catch (error) {
      console.log(`could not update user`);
    }
  }
};
