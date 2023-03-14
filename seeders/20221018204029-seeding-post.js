const posts = require("./posts.json");
const users = require("./users.json");
const comments = require("./comments.json");
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert("users", users);
    await queryInterface.bulkInsert("posts", posts);
    await queryInterface.bulkInsert("comments", comments);
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("users", null);
    await queryInterface.bulkDelete("posts", null);
    await queryInterface.bulkDelete("comment", null);
  },
};
