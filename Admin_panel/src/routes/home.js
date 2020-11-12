const router = require("express").Router();
const User = require('../models/User');


router.get('/', async(req, res)  => {

  res.render('pages/dashboard/index');
});

module.exports = router;