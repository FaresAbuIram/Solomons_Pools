const router = require("express").Router();
const Place = require('../models/Place');


router.get('/', async (req, res) => {
  try {

    await Place.find({}).then((data) => {
      let places = JSON.stringify(data)
      res.render('pages/dashboard/index', {
        places: places
      });
    })


  } catch (error) {
    req.flash('danger', 'An error occured!');
    res.send(error);
  }

});

module.exports = router;