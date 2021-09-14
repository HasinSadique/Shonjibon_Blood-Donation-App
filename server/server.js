const express = require('express')
const app = express()
const mongoose = require("mongoose");
const port = 3000

//mongodb
async function connectDB() {
  await mongoose.connect(
    "mongodb+srv://auth1:auth1@auth.cu5pc.mongodb.net/myFirstDatabase?retryWrites=true&w=majority"
  );
  console.log("DB Connected ");
}
connectDB();

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
  var schema = new mongoose.Schema({ email: 'string', password: 'string' });
  var User = mongoose.model('User', schema);
  let user = new User({
    email,
    password,
  });
  console.log(user);

  await user.save();

  //check db for email existence
  //  res.send('Signup Page')
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})