const mongoose = require('mongoose');

const Schema = mongoose.Schema;

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
        type: Date
    },
    location: {
        type: {
            type: String,
            enum: ['Point'],
            required: true
        },
        coordinates: {
            type: [Number],
            required: true
        }
    }
});

module.exports = mongoose.model('Event', EventSchema);