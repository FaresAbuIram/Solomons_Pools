const Event = require('../models/Event')
const mongoose = require('mongoose');

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
        console.log(error)
    }
}

module.exports = {
    getEvents
}