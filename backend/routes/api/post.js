const express = require("express");
const router = express.Router();

const postController = require("../../controllers/post");

router.get("/post", postController.apiGetAllpost);
router.get("/post=:query", postController.apiSearchAllpost);

module.exports = router;
