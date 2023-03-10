'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    queryInterface.addConstraint("comments", {
      fields: ["userId"],
      type: "foreign key",
      name: "comment_user_association",
      references: {
        table: "users",
        field: "id",
      },
      onDelete: "cascade",
    });
  },

  async down (queryInterface, Sequelize) {
    queryInterface.removeConstraint("comments", "comment_user_association");
  }
};
