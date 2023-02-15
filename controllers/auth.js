const AuthService = require("../services/AuthService");

module.exports = class Auth {
  //Generate token
  static authenticateToken(req, res, next) {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
      res.status(401).json({ error: "Authorization token required" });
    const data = AuthService.authenticateAccessToken(token);
    if (data instanceof Error) {
      res.status(403).json({ error: "Invalid Token" });
    } else {
      next();
    }
  }
  static async renewAccessToken(req, res, next) {
    try {
      const refreshToken = req.body.token;
      if (refreshToken == null)
        res.status(401).json({ error: "Authorization token required" });
      if (await AuthService.findRefreshToken(refreshToken)) {
        const data = AuthService.authenticateRefreshToken(refreshToken);
        if (data instanceof Error) {
          res.status(403).json({ error: "Invalid Token" });
        } else {
          const newAccessToken = AuthService.generateAccessToken(req.body.user);
          res.status(200).json({ accessToken: newAccessToken });
        }
      } else {
        res.status(403).json({ error: "Invalid Token" });
      }
    } catch (error) {
      res.status(500).json({ error: "unknown error" });
    }
  }
  static async deleteToken(req, res, next) {
    try {
      const result = await AuthService.deleteToken(req.body.token);
      if (result instanceof Error) {
        return res.status(result.status).json(result);
      }
      return res.status(204).send();
    } catch (error) {
      return res.status(500).json({ error: "unknown error" });
    }
  }
};
