const { User } = require("../models/user");
const { Op } = require("sequelize");

module.exports = class UserService {
  static async findAll() {
    try {
      const allUser = await User.findAll();
      return allUser;
    } catch (error) {
      console.log(`could not find all user${error}`);
    }
  }
};
