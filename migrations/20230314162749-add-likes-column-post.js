"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    return Promise.all([
      queryInterface.addColumn(
        "posts", // table name
        "likes", // new field name
        {
          type: Sequelize.DataTypes.INTEGER,
          defaultValue: 0,
          allowNull: false,
        }
      ).then(() => {
        return queryInterface.sequelize.query('UPDATE posts set likes = 10000')
      }),
      queryInterface.addColumn("posts", "dislikes", {
        type: Sequelize.DataTypes.INTEGER,
        defaultValue: 0,
        allowNull: false,
      }).then(() => {
        return queryInterface.sequelize.query('UPDATE posts set dislikes = 2')
      }),
    ]);
  },

  async down(queryInterface, Sequelize) {
    return Promise.all([
      queryInterface.removeColumn("posts", "likes"),
      queryInterface.removeColumn("posts", "dislikes"),
    ]);
  },
};
