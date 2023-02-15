const express = require("express");
const router = express.Router();

const userController = require("../../controllers/user");
const AuthController = require("../../controllers/auth");

router.get("/user", userController.apiGetAlluser);
router.get("/user=:id", userController.apiGetOneuser);

router.post("/user/register", userController.apiCreateNewUser);

//Auth
router.post("/user/login", userController.apiLoginUser);
router.post("/user/token", AuthController.renewAccessToken);
router.delete("/user/logout", AuthController.deleteToken);

router.patch("/user/updatePassword", userController.apiUpdateUserPassword);
router.patch("/user/updatePhone",AuthController.authenticateToken,userController.apiUpdateUserPhone);

module.exports = router;
