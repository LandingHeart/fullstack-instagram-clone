"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.addConstraint("refreshTokens", {
      fields: ["userId"],
      type: "foreign key",
      name: "refreshToken_user_association",
      references: {
        table: "users",
        field: "id",
      },
      onDelete: "cascade",
    });
  },

  async down(queryInterface, Sequelize) {
    queryInterface.removeConstraint(
      "refreshTokens",
      "refreshToken_user_association"
    );
  },
};
