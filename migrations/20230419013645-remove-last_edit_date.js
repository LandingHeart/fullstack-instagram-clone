"use strict";

module.exports = {
  async up(queryInterface, Sequelize) {
    return queryInterface.sequelize.transaction((t) => {
      return Promise.all([
        queryInterface.removeColumn("users", "last_edit_date", {
          transaction: t,
        }),
        queryInterface.removeColumn("posts", "last_edit_date", {
          transaction: t,
        }),
        queryInterface.removeColumn("refreshTokens", "last_edit_date", {
          transaction: t,
        }),
      ]);
    });
  },

  async down(queryInterface, Sequelize) {},
};
