const express = require("express");
const router = express.Router();

const userController = require("../../controllers/user");
const userAuth = require("../../controllers/userAuth");

router.get("/user", userController.apiGetAlluser);
router.get("/user=:id", userController.apiGetOneuser);

router.post("/login", userAuth.apiAuthLogin);
router.post("/registration", userAuth.apiAuthRegistration);

module.exports = router;
