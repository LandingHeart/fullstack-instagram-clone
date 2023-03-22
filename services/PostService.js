const Post = require("../models/index").posts;
const Comment = require("../models/index").comments;
const { Op } = require("sequelize");

module.exports = class PostService {
  static async findAll() {
    try {
      const allPost = await Post.findAll({
        include: [
          {
            model: Comment,
          },
        ],
      });
      return allPost;
    } catch (error) {
      console.log(`could not find all post${error}`);
    }
  }

  static async searchPostWithTitle(title) {
    try {
      const post = await Post.findAll({
        where: {
          title: {
            [Op.like]: "%" + title + "%",
          },
        },
        include: [
          {
            model: Comment,
          },
        ],
      });
      return post;
    } catch (error) {
      console.log(`could not find all post${error} with title ${title}`);
    }
  }

  static async searchPostWithId(id) {
    try {
      const post = await Post.findOne({
        where: {
          id: {
            [Op.like]: id,
          },
        },
        include: [
          {
            model: Comment,
          },
        ],
      });
      return post;
    } catch (error) {
      console.log(`could not find all post${error} with id `, id);
    }
  }

  static async createPost(body) {
    try {
      const post = await Post.create(body);
      return post;
    } catch (error) {
      console.log(`could not create post`);
    }
  }

  static async deletePost(postId) {
    try {
      const post = await Post.findByPk(postId);
      if (post == null) {
        let error = Error(`post(id=${postId}) does not exist`);
        error.status = 404;
        throw error;
      }
      await post.destroy();
      return;
    } catch (err) {
      console.log(`delete post failed`);
      return err;
    }
  }
};
