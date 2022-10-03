const posts = require("./posts.json");
module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.bulkInsert("posts", posts);
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("post");
    queryInterface.dropTable("user");
  }
};
