module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.createTable("user", {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      email: {
        type: Sequelize.DataTypes.STRING(255),
        required: true,
        allowNull: false
      },
      username: {
        type: Sequelize.DataTypes.STRING(255),
        required: true,
        allowNull: false
      },
      password: {
        type: Sequelize.DataTypes.STRING,
        required: true,
        allowNull: false
      },
      last_edit_date: Sequelize.DataTypes.DATE,
      updatedAt: Sequelize.DataTypes.DATE,
      createdAt: Sequelize.DataTypes.DATE
    });
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("post");
  }
};
