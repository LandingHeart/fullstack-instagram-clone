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
};
