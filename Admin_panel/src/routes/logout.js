const express = require('express');
const router = new express.Router();
const logoutController = require('../controller/logout');


/**
 * logout post
 * 
 * @param req - object contains data send from url
 * @param res - object send back to the url
 */
router.get('/logout', logoutController.logout);

module.exports = router;