const posts = require("./posts.json");
const users = require("./users.json");
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert("users", users);
    await queryInterface.bulkInsert("posts", posts);
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable("users");
    await queryInterface.dropTable("posts");
  },
};
