"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.addConstraint("posts", {
      fields: ["userId"],
      type: "foreign key",
      name: "post_user_association",
      references: {
        table: "users",
        field: "id",
      },
      onDelete: "cascade",
    });
  },

  async down(queryInterface, Sequelize) {
    queryInterface.removeConstraint("posts", "post_user_association");
  },
};
