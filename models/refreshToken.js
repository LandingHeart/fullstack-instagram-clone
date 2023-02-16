"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class RefreshToken extends Model {
    static associate(models) {}
  }
  RefreshToken.init(
    {
      token: {
        type: DataTypes.STRING(1024),
        required: true,
        allowNull: false,
        primaryKey: true,
      },
    },
    {
      sequelize,
      modelName: "refreshTokens",
      tableName: "refreshTokens",
    }
  );

  return RefreshToken;
};
