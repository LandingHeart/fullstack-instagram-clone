"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    return Promise.all([
      queryInterface.addColumn(
        // "refreshTokens", // table name
        "refresh_tokens", // table name
        "userId", // new field name
        {
          type: Sequelize.DataTypes.INTEGER,
          allowNull: false,
          unique: true,
        }
      ),
    ]);
  },

  async down(queryInterface, Sequelize) {
    return Promise.all([
      // queryInterface.removeColumn("refreshTokens", "userId"),
      queryInterface.removeColumn("refresh_tokens", "userId"),
    ]);
  },
};
