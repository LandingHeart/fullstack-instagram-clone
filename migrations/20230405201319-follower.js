"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable("followers", {
      followerId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: "users",
          key: "id",
        },
        onUpdate: "CASCADE",
        onDelete: "CASCADE",
      },
      followingId: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: "users",
          key: "id",
        },
        onUpdate: "CASCADE",
        onDelete: "CASCADE",
      },
    });
    // Make unique pairs
    await queryInterface.addConstraint("followers", {
      fields: ["followerId", "followingId"],
      type: "unique",
      name: "unique_follower_following",
    });
    // User not following self
    await queryInterface.addConstraint("followers", {
      fields: ["followerId"],
      type: "check",
      where: {
        followerId: {
          [Sequelize.Op.ne]: Sequelize.col("followingId"),
        },
      },
      name: "followers_not_equal_following",
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable("followers");
    await queryInterface.removeConstraint(
      "followers",
      "unique_follower_following"
    );
    await queryInterface.removeConstraint(
      "followers",
      "followers_not_equal_following"
    );
  },
};
