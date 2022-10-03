const express = require("express");
const app = express();
const path = require("path");
require("dotenv").config({ path: path.resolve(__dirname, "./configs/.env") });
const cors = require("cors");
const PORT = process.env.PORT || 8080;
const socket = require("socket.io");

app.use(express.json());

app.use(cors());

app.use(require("./routes"));

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
