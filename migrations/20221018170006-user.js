module.exports = {
  async up(queryInterface, Sequelize) {},

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("users");
  },
};
