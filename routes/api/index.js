const express = require("express");
const router = express.Router();

const PostController = require("../../controllers/PostController");
const UserController = require("../../controllers/UserController");
const AuthController = require("../../controllers/AuthController");

//Post route
router.post("/post", PostController.apiCreatePost);

router.get("/post", PostController.apiGetAllpost);
router.get("/post/:title", PostController.apiSearchAllpost);
router.delete("/post=:postId", PostController.deletePost);

//User route
router.get("/user", UserController.apiGetAlluser);
router.get("/user=:id", UserController.apiGetOneuser);

router.post("/user/register", UserController.apiCreateNewUser);

//Follower route
router.post("/user/follow", UserController.apiFollowUser);

//Auth
router.post("/user/login", UserController.apiLoginUser);
router.post("/user/token", AuthController.renewAccessToken);
router.delete("/user/logout", AuthController.deleteToken);

router.patch("/user/updatePassword", UserController.apiUpdateUserPassword);
router.patch(
  "/user/updatePhone",
  AuthController.authenticateToken,
  UserController.apiUpdateUserPhone
);

module.exports = router;
