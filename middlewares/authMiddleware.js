const jwt = require("jsonwebtoken");
const User = require("../models/index").users; // assuming you have a User model defined with Sequelize

const authMiddleware = async (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (token === undefined) {
    return res.redirect("/register");
  } else {
    next();
  }
};

module.exports = authMiddleware;
