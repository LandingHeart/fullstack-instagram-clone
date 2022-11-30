"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn("Users", "userId", {
      type: Sequelize.INTEGER,
      references: {
        model: "Users",
        key: "id",
      },
      OnDelete: "CASCADE",
    });
  },
  // async up(queryInterface, Sequelize) {
  //   queryInterface.createTable("post", {
  //     id: {
  //       allowNull: false,
  //       autoIncrement: true,
  //       primaryKey: true,
  //       type: Sequelize.INTEGER
  //     },
  //     title: {
  //       type: Sequelize.DataTypes.STRING(255),
  //       required: true,
  //       allowNull: false
  //     },
  //     postImgUrl: {
  //       type: Sequelize.DataTypes.STRING,
  //       required: true,
  //       allowNull: false
  //     },
  //     description: {
  //       type: Sequelize.DataTypes.STRING(255),
  //       required: true,
  //       allowNull: false
  //     },
  //     last_edit_date: Sequelize.DataTypes.DATE,
  //     updatedAt: Sequelize.DataTypes.DATE,
  //     createdAt: Sequelize.DataTypes.DATE
  //   });
  // },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("post");
  },
};
