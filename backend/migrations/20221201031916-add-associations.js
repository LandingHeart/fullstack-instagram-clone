"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn("Posts", "userId", {
      type: Sequelize.INTEGER,
      references: {
        model: "Users",
        key: "id",
      },
      OnDelete: "CASCADE",
    });
    await queryInterface.addColumn("Users", "PostId", {
      type: Sequelize.INTEGER,
      references: {
        model: "Posts",
        key: "id",
      },
      OnDelete: "CASCADE",
    });
  },
  async down(queryInterface, Sequelize) {},
};
