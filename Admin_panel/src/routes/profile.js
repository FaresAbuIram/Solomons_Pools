const express = require('express');
const router = new express.Router();
const profileController = require('../controller/profile');



router.get('/',profileController.gProfile );
router.post('/',profileController.updateProfile );

module.exports = router;