// const posts = require("./posts.json");
const { faker } = require("@faker-js/faker");
// const comments = require("./comments.json");
const User = require("../models/index").users;
const { postStorage } = require("../config/firebase");
const { uploadBytes, ref } = require("firebase/storage");
const fetch = require("node-fetch");

const storageRef = ref(postStorage, 'test1');
fetch("https://loremflickr.com/500/500/nature?lock=93334")
  .then((response) =>
    response.arrayBuffer()
  )
  .then((arrayBuffer) => {;
    uploadBytes(storageRef, arrayBuffer)
      .then((snapshot) => {
        console.log("uploaded");
      })
      .catch((err) => {
        console.log(err);
      });
  })
  .catch((err) => {
    console.log(err);
  });

const usernameSet = new Set();
const phoneSet = new Set();
const emailSet = new Set();

const users = [];
const posts = [];
const comments = [];

async function createUser() {
  for (let i = 1; i <= 1000; i++) {
    let email = faker.internet.email();
    let phone = faker.phone.number("###-###-####");
    let username = faker.internet.userName();
    while (emailSet.has(email)) {
      email = faker.internet.email();
    }
    emailSet.add(email);
    while (phoneSet.has(phone)) {
      phone = faker.phone.number("###-###-####");
    }
    phoneSet.add(phone);
    while (usernameSet.has(username)) {
      username = faker.internet.userName();
    }
    usernameSet.add(username);
    const user = {
      email: email,
      phone: phone,
      username: username,
      password: await User.encryptPassword(faker.internet.password()),
      role: "user",
      updatedAt: faker.date.between(
        "2020-01-01T00:00:00.000Z",
        "2023-01-01T00:00:00.000Z"
      ),
      createdAt: faker.date.between(
        "2018-01-01T00:00:00.000Z",
        "2019-12-31T00:00:00.000Z"
      ),
    };
    users.push(user);
  }
}

function createPost() {
  const aspectRatios = [
    [1280, 720],
    [500, 500],
    [800, 600],
  ];
  for (let userId = 1; userId <= 1000; userId++) {
    //generate 0-3 post for each user
    const numberOfPost = faker.datatype.number({ min: 0, max: 3 });
    for (let i = 0; i < numberOfPost; i++) {
      const aspectRatio = faker.helpers.arrayElement(aspectRatios);
      const width = aspectRatio[0];
      const height = aspectRatio[1];

      posts.push({
        title: faker.lorem.sentence(3),
        likes: faker.datatype.number({ min: 0, max: 100000 }),
        dislikes: faker.datatype.number({ min: 0, max: 100 }),
        postImgUrl: faker.image.nature(width, height, true),
        width: width,
        height: height,
        aspectRatio: width / height,
        description: faker.lorem.sentence(5),
        last_edit_date: faker.date.between(
          "2020-01-01T00:00:00.000Z",
          "2023-01-01T00:00:00.000Z"
        ),
        updatedAt: faker.date.between(
          "2020-01-01T00:00:00.000Z",
          "2023-01-01T00:00:00.000Z"
        ),
        createdAt: faker.date.between(
          "2018-01-01T00:00:00.000Z",
          "2019-12-31T00:00:00.000Z"
        ),
        userId: userId,
      });
    }
  }
}

function createComment() {
  for (let postId = 1; postId <= 1000; postId++) {
    //generate 0-3 comments for each post
    const numberOfComment = faker.datatype.number({ min: 0, max: 3 });
    for (let i = 0; i < numberOfComment; i++) {
      comments.push({
        userComment: faker.lorem.sentence(
          faker.datatype.number({ min: 5, max: 12 })
        ),
        likes: faker.datatype.number({ min: 0, max: 100 }),
        dislikes: faker.datatype.number({ min: 0, max: 10 }),
        deletedAt: faker.date.between(
          "2020-01-01T00:00:00.000Z",
          "2023-01-01T00:00:00.000Z"
        ),
        updatedAt: faker.date.between(
          "2020-01-01T00:00:00.000Z",
          "2023-01-01T00:00:00.000Z"
        ),
        createdAt: faker.date.between(
          "2018-01-01T00:00:00.000Z",
          "2019-12-31T00:00:00.000Z"
        ),
        postId: postId,
        //assuming we successfully created 1000 users
        userId: faker.datatype.number({ min: 1, max: 1000 }),
      });
    }
  }
}
module.exports = {
  async up(queryInterface, Sequelize) {
    await createUser();
    await queryInterface.bulkInsert("users", users);
    createPost();
    await queryInterface.bulkInsert("posts", posts);
    createComment();
    await queryInterface.bulkInsert("comments", comments);
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("users", null);
    // await queryInterface.bulkDelete("posts", null);
    // await queryInterface.bulkDelete("comment", null);
  },
};
