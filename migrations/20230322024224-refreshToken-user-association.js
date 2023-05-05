"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    // queryInterface.addConstraint("refreshTokens", {
    queryInterface.addConstraint("refresh_tokens", {
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
      // "refreshTokens",
      "refresh_tokens",
      "refreshToken_user_association"
    );
  },
};
