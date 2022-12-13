const express = require("express");
const router = express.Router();

const userController = require("../../controllers/user");

router.get("/user", userController.apiGetAlluser);
router.get("/user=:id", userController.apiGetOneuser);

module.exports = router;
