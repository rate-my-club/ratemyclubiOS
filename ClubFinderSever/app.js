const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

var Club = require('./models/club');
var router = express.Router();

//router.use(bodyParser.json());


app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

mongoose.Promise = require('bluebird');
mongoose.connect('mongodb://localhost:27017/clubfinder', {useNewUrlParser: true});
app.get('/', function(req,res) {
  res.json({message: 'You got this far'});

});

app.get('/clubfinder/clubs', function(req,res) {
  // Club.find({}).then(eachOne => {
  //   console.log(res.json(eachOne));
  //   console.log("hey");
  //
  // })


  console.log("whats up");
  Club.find({}, function(err, user) {
    res.send(user);
    console.log(JSON.stringify(user));
  })
})

app.post('/addclub', function(req, res) {
  var name = req;
  var description = req;
  var school = req;
  Club.save({school: school, name: name, description: description});

});



app.listen(3000);
console.log("Got to this point");





// var MongoClient = require('mongodb').MongoClient;
//
// // Connect to the db
// MongoClient.connect("mongodb://localhost:27017/clubfinder", function (err, db) {
//
//     db.collection('Persons', function (err, collection) {
//
//         collection.insert({ id: 1, firstName: 'Steve', lastName: 'Jobs' });
//         collection.insert({ id: 2, firstName: 'Bill', lastName: 'Gates' });
//         collection.insert({ id: 3, firstName: 'James', lastName: 'Bond' });
//
//
//
//         db.collection('Persons').count(function (err, count) {
//             if (err) throw err;
//
//             console.log('Total Rows: ' + count);
//         });
//     });
//
// });



// var url = "mongodb://127.0.0.1:27017";
//
// var MongoClient = require('mongodb').MongoClient;
//
// MongoClient.connect(url, function(err,db) {
//   if (err) throw err;
//   console.log("Conected to MongoDB!");
//   db.close()
// });
