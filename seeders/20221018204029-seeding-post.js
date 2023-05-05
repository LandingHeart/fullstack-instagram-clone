const { faker } = require("@faker-js/faker");
const User = require("../models/index").users;
const { defaultStorage } = require("../config/firebase");
const { uploadBytes, ref, getDownloadURL } = require("firebase/storage");
const fetch = require("node-fetch");

//initial sets to avoid insert duplicate user values
const usernameSet = new Set();
const phoneSet = new Set();
const emailSet = new Set();

//initial actual data array to be generated to database
const users = [];
const comments = [];
const posts = [];
const imageUrls = [];

async function createUser() {
  for (let i = 1; i <= 500; i++) {
    //preprocess attributes since it might generate duplicate username, phone, email
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

//create post for each user
function createPost() {
  const aspectRatios = [
    [1280, 720],
    [500, 500],
    [800, 600],
  ];
  for (let userId = 1; userId <= users.length; userId++) {
    //generate 0-3 post for each user
    const numberOfPost = faker.datatype.number({ min: 0, max: 3 });
    for (let i = 0; i < numberOfPost; i++) {
      const aspectRatio = faker.helpers.arrayElement(aspectRatios);
      const width = aspectRatio[0];
      const height = aspectRatio[1];
      imageUrls.push(faker.image.nature(width, height, true));
      posts.push({
        title: faker.lorem.sentence(3),
        likes: faker.datatype.number({ min: 0, max: 100000 }),
        dislikes: faker.datatype.number({ min: 0, max: 100 }),
        width: width,
        height: height,
        aspectRatio: width / height,
        description: faker.lorem.sentence(5),
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

//create 0-3 comments for each  based on the size of posts
function createComment() {
  for (let postId = 1; postId <= posts.length; postId++) {
    //random from 0-3 to generate individual comments
    const numberOfComment = faker.datatype.number({ min: 0, max: 3 });
    for (let i = 0; i < numberOfComment; i++) {
      comments.push({
        userComment: faker.lorem.sentence(
          faker.datatype.number({ min: 5, max: 12 })
        ),
        likes: faker.datatype.number({ min: 0, max: 100 }),
        dislikes: faker.datatype.number({ min: 0, max: 10 }),
        // deletedAt: faker.date.between(
        //   "2020-01-01T00:00:00.000Z",
        //   "2023-01-01T00:00:00.000Z"
        // ),
        updatedAt: faker.date.between(
          "2020-01-01T00:00:00.000Z",
          "2023-01-01T00:00:00.000Z"
        ),
        createdAt: faker.date.between(
          "2018-01-01T00:00:00.000Z",
          "2019-12-31T00:00:00.000Z"
        ),
        postId: postId,
        //assuming we successfully created 500 users
        userId: faker.datatype.number({ min: 1, max: 500 }),
      });
    }
  }
}

//upload images from array imageUrls
async function uploadImages(imageUrls) {
  const metadata = {
    contentType: "image/jpeg",
  };
  for (let i = 0; i < imageUrls.length; i++) {
    const fileName = generateFileName("jpg");
    const storageRef = ref(defaultStorage, "postImages/" + fileName);
    try {
      const response = await fetch(imageUrls[i]);
      const arrayBuffer = await response.arrayBuffer();
      const snapshot = await uploadBytes(storageRef, arrayBuffer, metadata);
      const url = await getDownloadURL(snapshot.ref);
      imageUrls[i] = url;
    } catch (err) {
      console.log(err);
    }
  }
}

//set post.postImgUrl to actual download url
function setPostImageUrl(posts, imageUrls) {
  if (posts.length != imageUrls.length) {
    console.log("urls size not matching with post size");
    return;
  }
  for (let i = 0; i < posts.length; i++) {
    posts[i].postImgUrl = imageUrls[i];
  }
}

//generate random file name with given extension name
function generateFileName(extension) {
  const timestamp = new Date().getTime(); // current timestamp
  const randomString = Math.random().toString(36).substring(2, 8); // random string
  const fileName = `${timestamp}_${randomString}.${extension}`; // combine timestamp and random string
  return fileName;
}

module.exports = {
  async up(queryInterface, Sequelize) {
    await createUser();
    await queryInterface.bulkInsert("users", users);
    createPost();
    await uploadImages(imageUrls);
    if (posts.length != 0) {
      setPostImageUrl(posts, imageUrls);
      await queryInterface.bulkInsert("posts", posts);
    }
    createComment();
    if (comments.length != 0) {
      await queryInterface.bulkInsert("comments", comments);
    }
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete("users", null);
    await queryInterface.bulkDelete("posts", null);
    await queryInterface.bulkDelete("comment", null);
  },
};
