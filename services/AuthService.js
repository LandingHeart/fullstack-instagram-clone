const jwt = require("jsonwebtoken");

module.exports = class AuthService {
  static authenticateToken(token) {
    try {
      jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, data) => {
        if (err) {
          console.log(err);
          throw err;
        }
        return data;
      });
    } catch (error) {
      return error;
    }
  }
};
