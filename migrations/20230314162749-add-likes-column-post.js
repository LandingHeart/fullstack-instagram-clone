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
        for(let id = 1; id <= 5; id++) {
          const likes = id + 10000;
          queryInterface.sequelize.query(`UPDATE posts SET likes = ${likes} WHERE id = ${id}`);
        }
        return 
      }),
      queryInterface.addColumn("posts", "dislikes", {
        type: Sequelize.DataTypes.INTEGER,
        defaultValue: 0,
        allowNull: false,
      }).then(() => {
        for(let id = 1; id <= 5; id++) {
          const dislikes = id + 10000;
          queryInterface.sequelize.query(`UPDATE posts SET dislikes = ${dislikes} WHERE id = ${id}`);
        }
        return 
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
