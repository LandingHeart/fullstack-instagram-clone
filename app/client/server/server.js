const path = require("path");
const express = require("express");

const app = express();
const port = process.env.PORT || 8080;
const DIST_DIR = path.join(__dirname, "../dist");
const HTML_FILE = path.join(DIST_DIR, "index.html");

app.use(express.static(DIST_DIR));

app.get("*", (req, res) => {
  res.sendFile(HTML_FILE);
});

app.listen(port, function () {
  console.log("App listening on port: " + port);
});
