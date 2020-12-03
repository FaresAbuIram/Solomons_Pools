const mongoose = require('mongoose');

const Schema = mongoose.Schema;
const mongoosePaginate = require('mongoose-paginate');
const EventSchema = new Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    description: {
        type: String,
        required: true,
        trim: true
    },
    picture: {
        type: String,
        required: true,
        trim: true
    },

    eventDate: {
        type: String,
        required: true,
    },
    eventTime: {
        type: String,
        required: true,
    },
    placeName: {
        type: String,
        required: true
    },
    placeId: {
        type: Schema.ObjectId,
        required: true
    }
});
mongoose.plugin(mongoosePaginate);
module.exports = mongoose.model('Event', EventSchema);