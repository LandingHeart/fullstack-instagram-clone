const User = require("../models/index").users;
const { Op } = require("sequelize");

module.exports = class UserService {
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
    try {
      const user = await User.findByPk(id);
      return user != null ? user : null;
    } catch (error) {
      console.log(`could not find one user and an error was occured`);
      return error;
    }
  }

  static async createUser(body) {
    try {
      const user = await User.create(body);
      return user;
    } catch (error) {
      console.log(`could not create user with email ${body.email}`);
      console.log(error);
      return error;
    }
  }

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
      // Two types of error:
      // (1) user not found
      // (2)try to update a attribute that results confliction of unique property
      console.log(`could not update user`);
      return null;
      // if (error.message == "user not found") {
      //   return error;
      // } else if (error.message == "Validation error") {
      //   return Error("Attribute confliction");
      // } else {
      //   return error;
      // }
    }
  }
};
