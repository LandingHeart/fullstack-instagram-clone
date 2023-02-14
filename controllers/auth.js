const AuthService = require("../services/AuthService");

module.exports = class Auth {
  //Generate token
  static authenticateToken(req, res, next) {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
      res.status(401).json({ error: "Authorization token required" });
    const data = AuthService.authenticateToken(token);
    if (data instanceof Error) {
      res.status(403).json({ error: "Invalid Token" });
    } else {
      next();
    }
  }
};
