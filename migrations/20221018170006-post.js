module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.createTable("posts", {
      id: {
        allowNull: true,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
        noUpdate: true,
      },
      title: {
        type: Sequelize.DataTypes.STRING(255),
        required: true,
        allowNull: false,
      },
      postImgUrl: {
        type: Sequelize.DataTypes.STRING,
        required: true,
        allowNull: false,
      },
      description: {
        type: Sequelize.DataTypes.STRING(255),
        required: true,
        allowNull: false,
      },
      last_edit_date: Sequelize.DataTypes.DATE,
      updatedAt: Sequelize.DataTypes.DATE,
      createdAt: Sequelize.DataTypes.DATE,
    });
  },

  async down(queryInterface, Sequelize) {
    queryInterface.dropTable("post");
  },
};
