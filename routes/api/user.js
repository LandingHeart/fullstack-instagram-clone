const express = require("express");
const router = express.Router();

const userController = require("../../controllers/user");

router.get("/user", userController.apiGetAlluser);
router.get("/user=:id", userController.apiGetOneuser);

router.post("/user", userController.apiCreateNewUser);
router.post("/user/login", userController.apiLoginUser);

router.patch("/user/updatePassword", userController.apiUpdateUserPassword);
router.patch("/user/updatePhone", userController.apiUpdateUserPhone);

module.exports = router;
