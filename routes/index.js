var express = require('express');
var router = express.Router();
const auth = require('../controllers/authController');
const book = require('../controllers/bookController');
/* GET home page. */
router.get('/', book.index);
router.get('/search', book.search);

router.get('/login',auth.isLogged, auth.formLogin);
router.post('/login', auth.login);

router.get('/register',auth.isLogged, auth.formRegister);
router.post('/register', auth.register);

router.post('/rating', book.rating);


router.get('/logout', auth.logout);

module.exports = router;
