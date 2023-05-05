module.exports = {
  async up(queryInterface, Sequelize) {
    queryInterface.createTable("posts", {
      id: {
        allowNull: true,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
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
      width: {
        type: Sequelize.DataTypes.INTEGER,
        required: true,
        allowNull: false,
      },
      height: {
        type: Sequelize.DataTypes.INTEGER,
        required: true,
        allowNull: false,
      },
      aspectRatio: {
        type: Sequelize.DataTypes.DOUBLE,
        required: true,
        allowNull: false,
      },
      description: {
        type: Sequelize.DataTypes.STRING(255),
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
      // last_edit_date: Sequelize.DataTypes.DATE,
      deletedAt: {
        type: Sequelize.DataTypes.DATE,
        required: false,
        allowNull: true,
      },
      updatedAt: Sequelize.DataTypes.DATE,
      createdAt: Sequelize.DataTypes.DATE,
      //foreign key
      userId: {
        type: Sequelize.DataTypes.INTEGER,
        allowNull: false,
      },
    });
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable("posts");
  },
};
