const express = require('express');
const router = new express.Router();
const loginController = require('../controller/login');

/**
 * login get
 * 
 * @param req - object contains data send from url
 * @param res - object send back to the url
 */
router.get('/login' , function (req, res) {
  res.render('pages/login/login', {layout: false,message:''});
});

/**
 * login post
 * 
 * @param req - object contains data send from url
 * @param res - object send back to the url
 */
router.post('/login', loginController.login);

module.exports = router;