const express = require("express");
const app = express();
const path = require("path");
require("dotenv").config({ path: path.resolve(__dirname, "./configs/.env") });
const PORT = process.env.PORT || 8080;
const morganMiddleware = require("./middlewares/morganMiddleware");
const socket = require("socket.io");
app.use(express.json());
app.use(morganMiddleware);

app.use("/", require("./routes"));
app.use(express.static(path.join(__dirname, "./views/public")));

app.get("/api/status", (req, res) => {
  res.status(200).send({
    status: "UP",
    message: "The API is up and running!",
  });
});

// app.get("/admin", (req, res) => {
//   res.sendFile(path.join(__dirname, "./views/index.html"));
// });

app.get("/*", (req, res) => {
  res.sendFile(path.join(__dirname, "./views/public/", "index.html"));
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
