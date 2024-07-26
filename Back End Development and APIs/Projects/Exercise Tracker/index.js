const express = require("express");
const app = express();
const cors = require("cors");
require("dotenv").config();

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));

const mongoose = require("mongoose");
mongoose.connect(process.env.MONGO_URI);

// Setup App
app.use(cors());
app.use(express.static("public"));
app.get("/", (req, res) => {
  res.sendFile(__dirname + "/views/index.html");
});

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log("Your app is listening on port " + listener.address().port);
});

// Create User Model
const exerciseSchema = new mongoose.Schema({
  description: String,
  duration: Number,
  date: String,
});

const userSchema = new mongoose.Schema({
  username: { type: String, required: true },
  exercises: { type: [exerciseSchema], default: [] },
});

const User = mongoose.model("User", userSchema);
// User.deleteMany().exec();

const handleError = (error) => {
  console.error("Error fetching users:", error);
};

// Handle users endpoint
app.post("/api/users", (req, res) => {
  const user = new User({
    username: req.body.username,
  });
  user.save();
  res.json(user);
});

app.get("/api/users", (req, res) => {
  User.find()
    .then((users) => {
      res.json(users);
    })
    .catch(handleError);
});

// Handle exercise endpoint
app.post("/api/users/:_id/exercises", (req, res) => {
  const _id = req.params._id;
  let { description, duration, date } = req.body;
  duration = Number(duration);
  date = (date ? new Date(date) : new Date()).toDateString();
  User.findById(_id)
    .then((user) => {
      const exercise = { description, duration, date };
      user.exercises.push(exercise);
      user.save();
      res.json({ username: user.username, ...exercise, _id });
    })
    .catch(handleError);
});

// Handle logs endpoint
app.get("/api/users/:_id/logs", (req, res) => {
  const _id = req.params._id;
  const { from, to, limit } = req.query;
  User.findById(_id)
    .then((user) => {
      let exercises = user.exercises;
      if (limit) exercises = exercises.slice(limit);
      if (from && to) {
        exercises.filter((exercise) => {
          const start = new Date(from);
          const end = new Date(to);
          const curr = new Date(exercise.date);
          return (
            curr.valueOf() >= start.valueOf() && curr.valueOf() <= end.valueOf()
          );
        });
      }

      res.json({
        username: user.username,
        count: exercises.length,
        _id,
        log: exercises,
      });
    })
    .catch(handleError);
});
