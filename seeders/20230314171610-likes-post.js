"use strict";
const Post = require("../models/index").posts;
const postValue = require("./posts.json");

module.exports = {
  async up(queryInterface, Sequelize) {
    await Post.bulkCreate(postValue);
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("posts", null);
  },
};
