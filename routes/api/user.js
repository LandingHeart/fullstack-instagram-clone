const express = require("express");
const router = express.Router();

const userController = require("../../controllers/user");
const AuthController = require("../../controllers/auth");

router.get("/user", userController.apiGetAlluser);
router.get("/user=:id", userController.apiGetOneuser);

router.post("/user/register", userController.apiCreateNewUser);
router.post("/user/login", userController.apiLoginUser);

router.patch("/user/updatePassword", userController.apiUpdateUserPassword);
router.patch("/user/updatePhone",AuthController.authenticateToken ,userController.apiUpdateUserPhone);

module.exports = router;
