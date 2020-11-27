const Event = require('../models/Event')
const Place = require('../models/Place')
const mongoose = require('mongoose');
const imageuploadservice = require('../services/imageuploadservice');

getEvents = async (req, res) => {
    try {
        let page = req.query.page || 1;
        let searchText = req.query.search || '';

        let info = [];
        const options = {
            lean: true,
            page: page || 1,
            limit: 10,
            sort: {
                createdAt: -1
            },
        };
        let data = await Event.paginate({
            name: {
                $regex: searchText
            }
        }, options);

        pagesNumber = data.pages;
        totalElements = data.total;
        limit = data.docs.length;
        activePage = page - 1;
        searchString = searchText ? searchText : '';
        inform = data.docs;
        inform.forEach((e) => {
            const pro = {
                name: e.name,
                date: e.eventDate,
                time: e.eventTime,
                place: e.placeName,
                opjectId: e._id,
            };
            info.push(pro);

        });


        const browse = {
            limit: limit,
            totalElements: totalElements,
            activePage: activePage,
            pagesNumber: pagesNumber,
            searchText: searchText,
            page: page,
            nextPage: (page + 1 > pagesNumber) ? pagesNumber : page + 1,
            prevPage: (page - 1 <= 0) ? 1 : page - 1,
        }
        await Event.find({}).then((events) => {
            
            return res.render('pages/events/index', {
                events: info,
                browse: browse

            });
        })

    } catch (error) {
        req.flash('danger', 'An error occured!');
    }
}

addEdit = async (req, res) => {
    try {
        const allPlaces = await Place.find({});
        let id = req.params.id;
        if (id == '0') return res.render('pages/events/add-edit-events', {
            allPlaces: allPlaces
        });
        try {
            const event = await Event.findById(id);
            if (!event) return res.status(404).send('Not found !');
            return res.status(200).render('pages/events/add-edit-events', {
                event: event,
                allPlaces: allPlaces,
                id,
            });
        } catch (error) {
            console.log(error)
            return res.status(500).send({
                message: error,
            });
        }
    } catch (error) {
        req.flash('danger', 'An error occured!');
    }
};
createEvent = async (req, res) => {
    try {
        imageuploadservice.uploadLocalStorage(req, res, async (err) => {


            const name = req.body.name;
            const description = req.body.description;

            const imagePath = req.files.event[0].path;

            const image = await imageuploadservice.uploadCloudinary(
                imagePath,
                'event'
            );

            const eventTime = req.body.time;
            const eventDate = req.body.date;
            const place = await Place.findById(req.body.select);


            const newEvent = new Event({
                name: name,
                description: description,
                picture: image.url,
                eventTime: eventTime,
                eventDate: eventDate,
                placeId: req.body.select,
                placeName: place.name
            });
            newEvent.save().then((data) => {
                req.flash('success', 'Event Added');
                return res.redirect('/events')
            }, (err) => {
                console.log(err)
                imageuploadservice.destroyCloudinary(image.id);
                req.flash('danger', 'An error occured!');
                return res.redirect('/events');
            })
        })

    } catch (error) {
        req.flash('danger', 'An error occured!');
    }

};
updateEvent = async (req, res) => {
    try {
        imageuploadservice.uploadLocalStorage(req, res, async (err) => {

            let id = req.params.id;
            const name = req.body.name;
            const description = req.body.description;


            const event = await Event.findById(id);
            let eventImage = event.picture;
            let eventTime = event.eventTime;
            let eventDate = event.eventDate;
            let placeName = event.placeName;
            let placeId = event.placeId;
            if(req.body.select){
                const place = await Place.findById(req.body.select);
                placeId = req.body.select;
                placeName = place.name

            }

            if (req.files.event) {
                const imagePath = req.files.event[0].path;
                const image = await imageuploadservice.uploadCloudinary(
                    imagePath,
                    'event',
                );
                eventImage = image.url;
            }


            if (req.body.time)
                eventTime = req.body.time
            if (req.body.date)
                eventDate = req.body.date;

            await Event.updateOne({
                    _id: id
                }, {
                    $set: {
                        name: name,
                        description: description,
                        picture: eventImage,
                        eventTime: eventTime,
                        eventDate: eventDate,
                        placeId: placeId,
                        placeName: placeName
                    },
                },
                (err) => {
                    if (err)
                        req.flash('danger', 'An error occured!');
                },
            );
            req.flash('success', 'Event Updated');
            res.redirect('/events')
        })
    } catch (error) {
        req.flash('danger', 'An error occured!');
        res.send(error);
    }
};

deleteEvent = async (req, res) => {
    try {
        const id = req.body.deleteIds;
        await Event.deleteMany({
            _id: {
                $in: id
            }
        }, (err) => {

            if (err)
                req.flash('danger', 'An error occured!');
        });
        req.flash('success', 'Success Delete');
        return res.redirect('/events')
    } catch (error) {
        req.flash('danger', 'An error occured!');
        res.send(error);
    }
};

browseById = async (req, res) => {
    try {
        let id = req.params.id;
        await Event.findById(id).then(event => {
            res.render('pages/events/browse', event)
        })

    } catch (error) {
        res.send(error);
    }
}
module.exports = {
    getEvents,
    addEdit,
    createEvent,
    updateEvent,
    deleteEvent,
    browseById
}