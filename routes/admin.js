var express = require('express');
var router = express.Router();
const book = require('../controllers/bookController');
/* GET home page. */
router.get('/',book.adminIndex);


router.get('/books',book.showListBooks);

router.get('/books/create',book.formCreateBook);
router.post('/books/create',book.createBook);

router.get('/books/update/:id',book.formUpdateBook);
router.post('/books/update/:id',book.updateBook);

router.get('/books/delete/:id',book.deleteBook);

router.get('/users',book.showListUsers);
router.get('/users/delete/:id',book.deleteUser);

router.get('/comments',book.showListComments);
router.get('/comments/delete/:id',book.deleteComment);

router.post('/liveSearch',book.liveSearch);

module.exports = router;
