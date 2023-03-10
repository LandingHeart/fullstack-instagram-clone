'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    queryInterface.addConstraint("comments", {
      fields: ["postId"],
      type: "foreign key",
      name: "comment_post_association",
      references: {
        table: "posts",
        field: "id",
      },
      onDelete: "cascade",
    });
  },

  async down (queryInterface, Sequelize) {
    queryInterface.removeConstraint("comments", "comment_post_association");
  }
};
