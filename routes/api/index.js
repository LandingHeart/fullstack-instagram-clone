const express = require("express");
const router = express.Router();

const postController = require("../../controllers/post");
const userController = require("../../controllers/user");
const AuthController = require("../../controllers/auth");

//Post route
router.post("/post", postController.apiCreatePost);

router.get("/post", postController.apiGetAllpost);
router.get("/post/:title", postController.apiSearchAllpost);
router.delete("/post=:postId", postController.deletePost);

//User route
router.get("/user", userController.apiGetAlluser);
router.get("/user=:id", userController.apiGetOneuser);

router.post("/user/register", userController.apiCreateNewUser);

//Follower route
router.post("/user/follow", userController.apiFollowUser);

//Auth
router.post("/user/login", userController.apiLoginUser);
router.post("/user/token", AuthController.renewAccessToken);
router.delete("/user/logout", AuthController.deleteToken);

router.patch("/user/updatePassword", userController.apiUpdateUserPassword);
router.patch("/user/updatePhone",AuthController.authenticateToken,userController.apiUpdateUserPhone);


module.exports = router;
