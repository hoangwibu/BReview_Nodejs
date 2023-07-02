var express = require('express');
var router = express.Router();
const auth = require('../controllers/authController');
const book = require('../controllers/bookController');
/* GET users listing. */
router.get('/:id',auth.requireLogin,book.getBook);
router.post('/:id',auth.requireLogin,book.comment);
module.exports = router;
