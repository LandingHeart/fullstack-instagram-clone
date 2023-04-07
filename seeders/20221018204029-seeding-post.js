// const posts = require("./posts.json");
const { faker } = require("@faker-js/faker");
// const comments = require("./comments.json");
const User = require("../models/index").users

const users = [];

async function createUser() {
  for (let i = 0; i < 1000; i++) {
    const user = {
      email: faker.internet.email(),
      phone: faker.phone.number('###-###-####'),
      username: faker.internet.userName(),
      password: await User.encryptPassword(faker.internet.password()),
      role: "user",
      last_edit_date: faker.date.between('2020-01-01T00:00:00.000Z', '2023-01-01T00:00:00.000Z'),
      updatedAt: faker.date.between('2020-01-01T00:00:00.000Z', '2023-01-01T00:00:00.000Z'),
      createdAt: faker.date.between('2018-01-01T00:00:00.000Z', '2019-12-31T00:00:00.000Z'),
    };
    users.push(user);
  }
}

module.exports = {
  async up(queryInterface, Sequelize) {
    await createUser();
    await queryInterface.bulkInsert("users", users);
    // await queryInterface.bulkInsert("posts", posts);
    // await queryInterface.bulkInsert("comments", comments);
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("users", null);
    // await queryInterface.bulkDelete("posts", null);
    // await queryInterface.bulkDelete("comment", null);
  },
};
