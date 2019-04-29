const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/clubfinder', { useNewUrlParser: true})

var db = mongoose.connection;

//let Schema = mongoose.Schema;

const clubSchema = new mongoose.Schema({
  school: {
    type: String,
    index: true
  },
  name: {
    type: String,
  },
  description: {
    type: String,
  },
  image_url: {
    type: String,
  },
  // avg_rating: {
  //   type: Number,
  // },
  username: {
    type: Array,
  },
  reviews: {
    type: Array,
  },
  ratings: {
    type: Array,
  }
}, { collection: 'purdue_university' });

const Club = module.exports = mongoose.model('Club', clubSchema);

module.exports = Club;
