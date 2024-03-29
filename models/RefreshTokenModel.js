"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class RefreshToken extends Model {
    static associate(models) {
      RefreshToken.belongsTo(models.users);
      models.users.hasOne(RefreshToken);
    }
  }
  RefreshToken.init(
    {
      refreshToken: {
        type: DataTypes.STRING(1024),
        required: true,
        allowNull: false,
        primaryKey: true,
      },
      //foreign key
      userId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        unique: true,
      },
    },
    {
      sequelize,
      modelName: "refresh_tokens",
      tableName: "refresh_tokens",
    }
  );

  return RefreshToken;
};
