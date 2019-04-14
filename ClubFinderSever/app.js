const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

var Club = require('./models/club');
var router = express.router;

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

mongoose.Promise = require('bluebird');
mongoose.connect('mongodb://localhost:27017/clubfinder', {useNewUrlParser: true});
app.get('/', function(req,res) {
  res.json({message: 'You didnt fuck up'});

});

app.get('/clubfinder/clubs', function(req,res) {
  // Club.find({}).then(eachOne => {
  //   console.log(res.json(eachOne));
  //   console.log("hey");
  //
  // })


  console.log("whats up");
  Club.find({}, function(err, user) {
    console.log(JSON.stringify(user));
  })
})



app.listen(3000);
console.log("Got to this point");
