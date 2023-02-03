const express = require("express");
const router = express.Router();

const postController = require("../../controllers/post");

router.get("/post", postController.apiGetAllpost);
router.get("/post/:title", postController.apiSearchAllpost);

router.post("/post", postController.apiCreatePost);

module.exports = router;
