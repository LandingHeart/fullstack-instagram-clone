const Follow = require("../models/index").followers;

module.exports = class FollowService {
  static async findPair(followerId, followingId) {
    const follow = await Follow.findOne({
      where: {
        followerId: followerId,
        followingId: followingId,
      },
    });
    return follow;
  }
};
