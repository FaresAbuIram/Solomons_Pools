const router = require("express").Router();
const User = require('../models/User');


router.get('/', async(req, res)  => {

  res.render('pages/events/add-edit-events');
});

module.exports = router;