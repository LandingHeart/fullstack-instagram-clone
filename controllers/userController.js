const UserService = require("../services/userService");
const AuthService = require("../services/authService");
// const FollowService = require("../services/FollowService");
const FollowFindPair = require("../services/followFindPair");

module.exports = class User {
  //Read
  static async apiGetAlluser(req, res, next) {
    try {
      const user = await UserService.findAll;
    } catch (error) {
      return res.status(500).json({ error: error });
    }
  }

  static async apiGetOneuser(req, res, next) {
    try {
      const user = await UserService.findOne(req.params.id);
      if (user != null) {
        return res.send(user);
      } else {
        return res.status(404).json({ error: "user not found" });
      }
    } catch (error) {
      return res.status(500).json({ error: error });
    }
  }
  //Login
  static async apiLoginUser(req, res, next) {
    try {
      if (!req.body.usernameOrEmail || !req.body.password) {
        let err = Error("required request info not provided");
        err.status = 400;
        throw err;
      }
      let user = await UserService.login(req.body);
      if (user instanceof Error) {
        throw user;
      } else {
        await User.appendTokens(user);
        return res.status(200).json(user);
      }
    } catch (error) {
      return res.status(error.status || 500).json({ error: error.message });
    }
  }
  //Create
  static async apiCreateNewUser(req, res, next) {
    const body = req.body;
    if (body.email == null || body.password == null || body.username == null) {
      return res.status(400).json({ error: "Incomplete infomation provided" });
    }
    try {
      let user = await UserService.createUser(body);
      if (user.errors != null) {
        throw Error("user already exist");
      }
      await User.appendTokens(user);
      return res.status(201).json(user);
    } catch (error) {
      if (error.message == "user already exist") {
        return res.status(409).json({ error: error.message });
      }
      return res.status(500).json({ error: error.message });
    }
  }
  //append Tokens
  static async appendTokens(user) {
    const accessToken = AuthService.generateAccessToken({
      email: user.email,
      password: user.password,
    });
    const refreshToken = await AuthService.generateRefreshToken({
      email: user.email,
      password: user.password,
      id: user.id,
    });
    if (!user.dataValues) {
      user.accessToken = accessToken;
      user.refreshToken = refreshToken;
    } else {
      user.dataValues.accessToken = accessToken;
      user.dataValues.refreshToken = refreshToken;
    }
  }
  //Update
  static async apiUpdateUserPassword(req, res, next) {
    try {
      const { id, password } = req.body;
      if (!id) {
        return res.status(401);
      }
      const user = await UserService.updateUser({ id, password });
      if (user == null) {
        return res.status(501).json({ error: "unknown error" });
      }
      res.status(206).json(user);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  //Update Phone Number
  static async apiUpdateUserPhone(req, res, next) {
    try {
      const { id, phone } = req.body;
      if (!id || !phone) {
        return res
          .status(401)
          .json({ error: "Incomplete infomation provided" });
      }
      const user = await UserService.updateUser(id, { phone: phone });
      if (user instanceof Error) {
        throw user;
      }
      return res.status(206).send();
    } catch (err) {
      return res.status(err.status || 500).json({ error: err.message });
    }
  }
  //Delete
  static async apiDeleteuser(req, res, next) {
    try {
    } catch (error) {
      return res.status(500).json({ error: error });
    }
  }
  //Followe user
  static async apiFollowUser(req, res, next) {
    try {
      const followerId = req.body.followerId;
      const followingId = req.body.followingId;
      if (!followerId || !followingId) {
        let err = Error("required request info not provided");
        err.status = 400;
        throw err;
      }
      if (followerId === followingId) {
        return res.status(400).json({ error: "user should not follow self" });
      }
      const follower = await UserService.findOne(followerId);
      const following = await UserService.findOne(followingId);
      if (!follower || !following) {
        let err = Error("user not found");
        err.status = 404;
        throw err;
      }
      const existPair = await FollowFindPair.findPair(followerId, followingId);
      if (!existPair) {
        const follow = await FollowService.createFollow(
          followerId,
          followingId
        );
        return res.status(201).json(follow);
      } else {
        let err = Error("relation exist");
        err.status = 409;
        throw err;
      }
    } catch (err) {
      console.log(err.message);
      return res.status(err.status || 500).json({ error: err.message });
    }
  }
};
