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
      last_edit_date: Sequelize.DataTypes.DATE,
      updatedAt: Sequelize.DataTypes.DATE,
      createdAt: Sequelize.DataTypes.DATE,
      //foreign key
      userId: {
        type: Sequelize.DataTypes.INTEGER,
      },
    });
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.removeConstraint("posts", "post_user_association");
    queryInterface.dropTable("posts");
  },
};
