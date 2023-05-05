const RefreshToken = require("../models/index").refresh_tokens;
const jwt = require("jsonwebtoken");
const { where } = require("sequelize");
require("dotenv").config();
module.exports = class AuthService {
  //checking
  static authenticateAccessToken(token) {
    try {
      jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, data) => {
        if (err) {
          throw err;
        }
        console.log(`authorized AccessToken with data: ${data}`);
        return data;
      });
    } catch (error) {
      return error;
    }
  }
  static authenticateRefreshToken(token) {
    try {
      jwt.verify(token, process.env.REFRESH_TOKEN_SECRET, (err, data) => {
        if (err) {
          throw err;
        }
        console.log(`authorized RefreshToken with data: ${data}`);
        return data;
      });
    } catch (error) {
      return error;
    }
  }
  static async findRefreshToken(token) {
    const found = await RefreshToken.findByPk(token);
    return found != null;
  }
  static generateAccessToken(user) {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, {
      expiresIn: "10m",
    });
  }
  static async generateRefreshToken(user) {
    try {
      //check if user already logged in
      const refreshToken = await this.findTokenByUserId(user.id);
      //if null: not logged in, generate a new refreshtoken 
      if (refreshToken == null) {
        const token = jwt.sign(user, process.env.REFRESH_TOKEN_SECRET);
        await RefreshToken.create({ refreshToken: token, userId: user.id });
        return token;
      } else { // if not null: return the refresh token directly
        return refreshToken;
      }
    } catch (error) {
      console.log(error);
      return error;
    }
  }
  //delete refresh token
  static async deleteToken(token) {
    try {
      const tokenFromDB = await RefreshToken.findByPk(token);
      if (tokenFromDB == null) {
        let error = Error();
        error.status = 400;
        error.message = "token not found";
        throw error;
      }
      await tokenFromDB.destroy();
      return;
    } catch (error) {
      return error;
    }
  }

  //find token in the database if exist otherwise return null
  static async findTokenByUserId(userId) {
    const token = await RefreshToken.findOne({ where: { userId: userId } });
    return token == null ? null : token.dataValues.refreshToken;
  }
};
