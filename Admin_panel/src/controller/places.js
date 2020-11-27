const Place = require('../models/Place');
const imageuploadservice = require('../services/imageuploadservice');

getPlaces = async (req, res) => {
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
        let data = await Place.paginate({
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


        return res.render('pages/places/index', {
            places: info,
            browse: browse

        });

    } catch (error) {
        req.flash('danger', 'An error occured!');
    }

}
addEdit = async (req, res) => {
    try {
        let id = req.params.id;
        if (id == '0') return res.render('pages/places/add-edit-places');
        try {
            const place = await Place.findById(id);
            console.log(place)
            if (!place) return res.status(404).send('Not found !');
            return res.status(200).render('pages/places/add-edit-places', place);
        } catch (error) {
            req.flash('danger', 'An error occured!');
            console.log(error)
            return res.status(500).send({
                message: error,
            });
        }
    } catch (error) {
        req.flash('danger', 'An error occured!');
    }
};

createPlace = async (req, res) => {
    try {
        imageuploadservice.uploadLocalStorage(req, res, async (err) => {
            console.log(req.body)
            let loc = JSON.parse(req.body.latLng);
            const name = req.body.name;
            const description = req.body.description;

            let pictures = [];
            let imageIds = [];
            let picturesArr = req.files.place;
            let imagesPic;
            if (picturesArr) {
                for (let i = 0; i < picturesArr.length; i++) {
                    imagesPic = picturesArr[i].path;
                    const image = await imageuploadservice.uploadCloudinary(
                        imagesPic,
                        'place',
                    );
                    pictures.push(image.url);
                    imageIds.push(image.id);
                }
            }


            const newPlace = new Place({
                name: name,
                about: description,
                pictures: pictures,
                lat: loc.lat,
                lng: loc.lng
            });
            newPlace.save().then((data) => {
                req.flash('success', 'Place Added');
                return res.redirect('/places')
            }, (err) => {
                console.log(err)
                imageIds.forEach((e) => {
                    imageuploadservice.destroyCloudinary(e);
                });
                req.flash('danger', 'An error occured!');
                return res.redirect('/places');
            })
        })

    } catch (error) {
        req.flash('danger', 'An error occured!');
        console.log(error)
    }

};

updatePlace = async (req, res) => {
    try {
        imageuploadservice.uploadLocalStorage(req, res, async (err) => {

            let id = req.params.id;
            const name = req.body.name;
            const description = req.body.description;
            let loc = JSON.parse(req.body.latLng);

            const place = await Place.findById(id);
            let lat = place.lat;
            let lng = place.lng;
            if (loc) {
                lat = loc.lat;
                lng = loc.lng;
            }
            let pictures = place.pictures;
            let imageIds = [];
            if (req.files.place) {
                let picturesArr = req.files.place;
                let imagesPic;
                if (picturesArr) {
                    pictures=[];
                    for (let i = 0; i < picturesArr.length; i++) {
                        imagesPic = picturesArr[i].path;
                        const image = await imageuploadservice.uploadCloudinary(
                            imagesPic,
                            'place',
                        );
                        pictures.push(image.url);
                        imageIds.push(image.id);
                    }
                }
            }


            await Place.updateOne({
                    _id: id
                }, {
                    $set: {
                        name: name,
                        about: description,
                        pictures: pictures,
                        lat: lat,
                        lng: lng
                    },
                },
                (err) => {
                    if (err){
                        imageIds.forEach((e) => {
                            imageuploadservice.destroyCloudinary(e);
                        });
                        req.flash('danger', 'An error occured!');
                    }
                },
            );
            req.flash('success', 'Place Updated');
            res.redirect('/places')
        })
    } catch (error) {
        req.flash('danger', 'An error occured!');
        res.send(error);
    }
};

deletePlace = async (req, res) => {
    try {
        const id = req.body.deleteIds;
        await Place.deleteMany({
            _id: {
                $in: id
            }
        }, (err) => {

            if (err)
                req.flash('danger', 'An error occured!');
        });
        req.flash('success', 'Success Delete');
        return res.redirect('/places')
    } catch (error) {
        req.flash('danger', 'An error occured!');
        res.send(error);
    }
};
browseById = async (req, res) => {
    try {
        let id = req.params.id;
        await Place.findById(id).then(place => {
            res.render('pages/places/browse', place)
        })

    } catch (error) {
        res.send(error);
    }
}

module.exports = {
    getPlaces,
    addEdit,
    createPlace,
    updatePlace,
    deletePlace,
    browseById
};