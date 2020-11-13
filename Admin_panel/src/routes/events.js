const router = require("express").Router();
const eventsController = require('../controller/events')

router.get('/', eventsController.getEvents);
router.get('/add-edit-events/:id', eventsController.addEdit);
router.post('/create', eventsController.createEvent);
router.post('/update/:id', eventsController.updateEvent);
router.post('/delete', eventsController.deleteEvent);
router.get('/browse/:id',eventsController.browseById );


module.exports = router;