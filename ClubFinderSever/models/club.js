const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/clubfinder', { useNewUrlParser: true})

var db = mongoose.connection;

let Schema = mongoose.Schema;

const clubSchema = new mongoose.Schema({
  name: String,
  description: String,
  image_url: String,
  avg_rating: Number,
  reviews: Array,
  ratings: Array,
})

const Club = module.exports = mongoose.model('Activity', clubSchema);

module.exports = Club;
