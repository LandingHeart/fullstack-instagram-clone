module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.createTable("refreshTokens", {
      refreshToken: {
        type: Sequelize.DataTypes.STRING(1024),
        required: true,
        allowNull: false,
        primaryKey: true,
      },
      last_edit_date: Sequelize.DataTypes.DATE,
      updatedAt: Sequelize.DataTypes.DATE,
      createdAt: Sequelize.DataTypes.DATE,
    });
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("refreshTokens");
  },
};
