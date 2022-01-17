const e = require('express');
const express = require('express')
const app = express()
const mongoose = require("mongoose");
const port = 3000

var jwt = require('jsonwebtoken');

//mongodb
async function connectDB() {
  await mongoose.connect(
    "mongodb+srv://auth1:auth1@auth.cu5pc.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
  );
  console.log("DB Connected ");
}
connectDB();

//model
var schema = new mongoose.Schema({ email: 'string', password: 'string' });
var User = mongoose.model('User', schema);

//this takes the post body
app.use(express.json({ extended: false }));

app.get('/', (req, res) => {
  res.send('Hello World!')
})

//Signup Route
app.post('/signup', async (req, res) => {
  const { email, password } = req.body;
  console.log(email);
  console.log(password);

  User.findOne({ email }, async function (err,AnyUser) {
    if(err){

    }
    if (AnyUser) {
      res.json({ error: 403 });
    } else {
      let user = new User({
        email,
        password,
      });
      await user.save();

      var token = jwt.sign({ id: user.id }, 'password');
      res.json({ token: token });
      console.log(user);
    }
  });
});

//Login Route
app.post('/login', async (req, res) => {
  pass = req.body.password;
  email = req.body.email;

  User.findOne({ email }, async function (err, AnyUser) {
    if (err) {
      console.log(err);
    }
    if (AnyUser) {
      if (AnyUser.password == pass) {
        console.log("Yes user found.");
        console.log(AnyUser);
        var token = jwt.sign({ id: AnyUser.id }, 'password');
        res.json({ token: token });
      } else {
        console.log("Incorrect password.");
        res.json({ error: 403 });
      }
    } else {
      console.log("No user found with this email.");
      res.json({ error: 401 });
    }
  });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})