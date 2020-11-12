const router = require("express").Router();
const eventsController = require('../controller/events')

router.get('/',eventsController.getEvents);

module.exports = router;