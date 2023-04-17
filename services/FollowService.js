const Follow = require("../models/index").followers;

module.exports = class FollowService {
  static async createFollow(followerId, followingId) {
    try {
      const follow = await Follow.create({
        followerId: followerId,
        followingId: followingId,
      });
      return follow;
    } catch (err) {
      console.log("Error occured when follow user");
      return err;
    }
  }
};
