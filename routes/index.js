const express = require("express");
var router = express.Router();
const authMiddleware = require("../middlewares/authMiddleware");

router.use("/api", authMiddleware, require("./api"));

module.exports = router;
