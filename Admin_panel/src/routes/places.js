const router = require("express").Router();
const placesController = require('../controller/places')

router.get('/', placesController.getPlaces);
router.get('/add-edit-places/:id',placesController.addEdit );
router.post('/create',placesController.createPlace);
router.post('/update/:id',placesController.updatePlace );
router.post('/delete',placesController.deletePlace );
router.get('/browse/:id', placesController.browseById);
module.exports = router;