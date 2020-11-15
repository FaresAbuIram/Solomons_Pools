const router = require("express").Router();
const Event = require('../models/Event');


router.get('/', async (req, res) => {
  try {

    await Event.find({}).then((data) => {
      let events = JSON.stringify(data)
      res.render('pages/dashboard/index', {
        events: events
      });
    })


  } catch (error) {
    req.flash('danger', 'An error occured!');
    res.send(error);
  }

});

module.exports = router;