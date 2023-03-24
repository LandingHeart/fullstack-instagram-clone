"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    return Promise.all([
      queryInterface.addColumn(
        "users", // table name
        "role", // new field name
        {
          type: Sequelize.DataTypes.STRING(32),
          defaultValue: "user",
          allowNull: false,
        }
      ),
    ]);
  },

  async down(queryInterface, Sequelize) {
    return Promise.all([queryInterface.removeColumn("users", "role")]);
  },
};
