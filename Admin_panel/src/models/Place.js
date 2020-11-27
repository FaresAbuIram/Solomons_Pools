const mongoose = require('mongoose');

const Schema = mongoose.Schema;
const mongoosePaginate = require('mongoose-paginate');
const PlaceSchema = new Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    about: {
        type: String,
        required: true,
        trim: true
    },
    pictures: {
        type: [String],
        required: true,
        trim: true
    },
    lat: {
        type: Number,
        required: true
    },
    lng: {
        type: Number,
        required: true
    }
});
mongoose.plugin(mongoosePaginate);
module.exports = mongoose.model('Place', PlaceSchema);