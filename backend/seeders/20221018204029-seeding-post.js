const posts = require("./posts.json");
module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.bulkInsert("post", posts);
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("post");
  }
};
