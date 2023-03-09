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
        type: Sequelize.DataTypes.STRING,
        required: true,
        allowNull: false,
      },
      last_edit_date: Sequelize.DataTypes.DATE,
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
