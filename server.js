const express = require("express");
const app = express();
const path = require("path");
require("dotenv").config({ path: path.resolve(__dirname, "./configs/.env") });
const PORT = process.env.PORT || 8080;
const morganMiddleware = require("./middlewares/morgan.middleware");
const socket = require("socket.io");
const DIST_DIR = path.join(__dirname, "views/dist");
const HTML_FILE = path.join(DIST_DIR, "index.html");

app.use(express.static(DIST_DIR));

app.use(express.json());
app.use(morganMiddleware);
app.use(require("./routes"));

// app.get("/", (req, res) => {
//   res.send("hello world");
// });

// app.get("/api/post", postController.apiGetAllpost);

app.get("/api/status", (req, res) => {
  res.status(200).send({
    status: "UP",
    message: "The API is up and running!",
  });
});

app.use("*", (req, res) => {
  res.sendFile(HTML_FILE);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
