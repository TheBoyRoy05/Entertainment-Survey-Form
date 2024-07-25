const express = require("express");
const path = require("path");
const bodyParser = require('body-parser');
require("dotenv").config();

let app = express();

console.log("Hello World");

__dirname = "/workspace/boilerplate-express";
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "views", "index.html"));
});

app.use("/public", express.static(path.join(__dirname, "public")));

app.get("/json", (req, res) => {
  const message =
    process.env.MESSAGE_STYLE === "uppercase" ? "HELLO JSON" : "Hello json";
  res.json({ message: message });
});

app.use((req, res, next) => {
  console.log(`${req.method} ${req.path} - ${req.ip}`);
  next();
});

app.get('/now', (req, res, next) => {
  req.time = new Date().toString();
  next();
}, (req, res) => {
  res.send({time: req.time});
});

app.get("/:word/echo", (req, res) => {
  res.send({echo: req.params.word});
});

app.get('/name', (req, res) => {
  const {first, last} = req.query;
  res.json({name: `${first} ${last}`});
});

app.use(bodyParser.urlencoded({ extended: false }));

app.post('/name', (req, res) => {
  const {first, last} = req.body;
  res.json({name: `${first} ${last}`});
});

module.exports = app;
