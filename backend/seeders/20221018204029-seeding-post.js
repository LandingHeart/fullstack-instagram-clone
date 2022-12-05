const posts = require("./posts.json");
module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.bulkInsert("Posts", posts);
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("Posts");
  }
};
