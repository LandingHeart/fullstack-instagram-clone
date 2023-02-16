const RefreshToken = require("../models/index").refreshTokens;
const jwt = require("jsonwebtoken");
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
    return token != null;
  }
  static generateAccessToken(user) {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, {
      expiresIn: "10m",
    });
  }
  static async generateRefreshToken(user) {
    try {
      const token = jwt.sign(user, process.env.REFRESH_TOKEN_SECRET);
      await RefreshToken.create({ token: token });
      return token;
    } catch (error) {
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
};
