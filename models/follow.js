"use strict";
const { Model } = require("sequelize");

module.exports = (sequelize, DataTypes) => {
  class Followers extends Model {
    static associate(models) {
      Followers.belongsTo(models.users, {
        foreignKey: "followerId",
        as: "follower",
      });
      Followers.belongsTo(models.users, {
        foreignKey: "followingId",
        as: "following",
      });
    }
  }
  Followers.init(
    {
      followerId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "users",
          key: "id",
        },
      },
      followingId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "users",
          key: "id",
        },
      },
    },
    {
      sequelize,
      modelName: "followers",
      tableName: "followers",
      timestamps: false,
      validate: {
        userShouldNotFollowSelf() {
          if (this.followerId === this.followingId) {
            throw Error("User should not follow self");
          }
        },
      },
    }
  );
  return Followers;
};
