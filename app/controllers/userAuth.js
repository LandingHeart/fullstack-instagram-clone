const User = require("../models/index").users;
const bcrypt = require("bcryptjs");

module.exports = class UserAuth {
  static async apiAuthLogin(req, res) {}
  static async apiAuthRegistration(req, res) {
    try {
      const { email, password } = req.body;

      if (!(email && password)) {
        res.status(400).send("All input is required");
      }

      const oldUser = await User.findOne({ email });

      if (oldUser) {
        return res.status(409).send("User Already Exist. Please Login");
      }

      //Encrypt user password
      encryptedPassword = await bcrypt.hash(password, 10);

      // Create user in our database
      const user = await User.create({
        email: email.toLowerCase(), // sanitize: convert email to lowercase
        password: encryptedPassword,
      });

      // Create token
      const token = jwt.sign(
        { user_id: user._id, email },
        process.env.TOKEN_KEY,
        {
          expiresIn: "2h",
        }
      );
      // save user token
      user.token = token;

      // return new user
      res.status(201).json(user);
    } catch (err) {
      console.log(err);
    }
  }
};
