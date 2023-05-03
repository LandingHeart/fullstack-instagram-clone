"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.removeConstraint("users", "users_phone_key");
    await queryInterface.changeColumn("users", "phone", {
      type: Sequelize.DataTypes.STRING(20),
      allowNull: true,
      unique: true,
    });
    await queryInterface.changeColumn("comments", "userComment", {
      type: Sequelize.DataTypes.STRING(1024),
      required: true,
      allowNull: false,
    });
  },
  down: async (queryInterface, Sequelize) => {
  },
};
