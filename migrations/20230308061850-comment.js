"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.createTable("comments", {
      id: {
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      userComment: {
        // type: Sequelize.DataTypes.STRING,
        type: Sequelize.DataTypes.STRING(1024),
        required: true,
        allowNull: false,
      },
      likes: {
        type: Sequelize.DataTypes.INTEGER,
        defaultValue: 0,
        allowNull: false,
      },
      dislikes: {
        type: Sequelize.DataTypes.INTEGER,
        defaultValue: 0,
        allowNull: false,
      },
      deletedAt: {
        type: Sequelize.DataTypes.DATE,
        required: false,
        allowNull: true,
      },
      updatedAt: Sequelize.DataTypes.DATE,
      createdAt: Sequelize.DataTypes.DATE,
      //foreign key
      postId: {
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
      },
      userId: {
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
      },
    });
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("comments");
  },
};
