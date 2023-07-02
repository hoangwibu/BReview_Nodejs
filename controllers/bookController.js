const Sequelize = require('sequelize');
const jwt = require('jsonwebtoken');
const secretKey = 'dnhoang2002';
const Book = require('../models/book.model');
const User = require('../models/user.model');
const Comment = require('../models/comment.model');
const Rating = require('../models/rating.model');
const multer = require('multer');
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, './public/images'); // Thư mục lưu trữ ảnh
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname); // Tên file được lưu trữ là tên file gốc
  }
});

const upload = multer({ storage: storage });

const { Op } = require('sequelize');

User.hasMany(Comment);
Comment.belongsTo(User);

Book.hasMany(Comment);
Comment.belongsTo(Book);

class bookController {
  constructor() { }
  index = async (req, res, next) => {
    const token = req.cookies.token;
    if (token) {
      try {
        const decoded = jwt.verify(token, secretKey);
        req.user = decoded;
      } catch (err) {
        res.status(400).send('Invalid token');
      }
    }
    const user = req.user;
    const trendingBooks = await Book.findAll({
      order: [['stars', 'DESC'],['publishing', 'DESC']],
      limit: 12
    });
    const newBooks = await Book.findAll({
      order: [['publishing', 'DESC'],['createdAt', 'DESC']],
      limit: 12
    });
    const popBooks = await Book.findAll({
      order: [['ratings', 'DESC'],['publishing', 'ASC'],['commentCount', 'DESC']],
      limit: 12
    });
    res.render('index', { title: "BReview", trending: trendingBooks,news:newBooks,pops:popBooks, user: user })
  }
  getBook = async (req, res, next) => {
    const bookId = req.params.id
    const user = req.user;
    const book = await Book.findOne({ where: { bookId } })
    const ratingsBefore = await Rating.findAll({ where: { bookId, userId: user.userId } });
    const comments = await Comment.findAll({
      where: { bookBookId: req.params.id },
      include: [{ model: User, attributes: ['name'] }],
      order: [['createdAt', 'DESC']], limit: 10
    });
    res.render('book', { title: book.dataValues.title, rated:ratingsBefore[0], user: user, book: book.dataValues, comments: comments })
  }
  search = async (req, res, next) => {
    const user = req.user;
    const searchQuery = req.query.t;
    if (searchQuery == "") {
      return res.render('error')
    }
    console.log(searchQuery);
    Book.findAll({
      where: {
        title: {
          [Op.like]: `%${searchQuery}%` // Tìm các cuốn sách có tiêu đề chứa từ khóa tìm kiếm
        }
      }
    })
      .then((data) => {
        res.render('search', { title: 'Search: ' + searchQuery, user: user, books: data, searchQuery })
      })
      .catch((err) => console.log(err))
  }
  comment = async (req, res, next) => {
    const user = req.user;
    const bookId = req.params.id;
    const { content } = req.body;
    await Book.update({ commentCount: Sequelize.literal('commentCount + 1') }, { where: { bookId: bookId } });
    Comment.create({
      content: content,
      userUserId: user.userId,
      bookBookId: bookId,
    })
      .then((data) => {
        console.log(data.dataValues.createdAt);
        res.redirect(req.get('referer'));
      })
      .catch((err) => console.log(err))
  }
  //admin
  adminIndex = async (req, res, next) => {
    const totalComment = await Comment.count(); 
    const totalUser = await User.count();
    const totalBook = await Book.count();
    res.render('admin/index', { layout: 'admin', title: 'BReview - Admin',totalComment,totalBook,totalUser })
  }

  showListBooks = async (req, res, next) => {
    const books = await Book.findAll({
      order: [['createdAt', 'DESC']]
    });
    res.render('admin/books/index', { layout: 'admin', title: 'Quản lý sách', books: books })
  }

  formCreateBook = async (req, res, next) => {
    res.render('admin/books/create', { layout: 'admin', title: 'Thêm sách mới' })
  }

  formUpdateBook = async (req, res, next) => {
    const bookId = req.params.id
    const book = await Book.findByPk(bookId);
    res.render('admin/books/update', { layout: 'admin', title: 'Cập nhật', book: book.dataValues })
  }

  createBook = async (req, res, next) => {
    upload.single('image')(req, res, (err) => {
      if (err) {
        return next(err);
      }
      let filename = "bookError.jpg";
      const { title, author, publishing, description, category } = req.body;
      if (req.file) {
        filename = req.file.filename
      }
      Book.create({
        title: title,
        image: filename,
        author: author,
        publishing: publishing,
        description: description,
        category: category
      })
        .then(book => {
          console.log('Book created successfully:', book);
          res.redirect('/admin/books');
        })
        .catch(error => {
          console.error('Error creating book:', error);
        });

    });
  }
  updateBook = async (req, res, next) => {
    upload.single('image')(req, res, (err) => {
      const { title, author, publishing, description, category } = req.body;
      const bookId = req.params.id;
      let updateFields = {
        title: title,
        author: author,
        publishing: publishing,
        description: description,
        category: category
      };
      if (req.file) {
        updateFields.image = req.file.filename;
      }
      try {
        Book.update(updateFields, { where: { bookId: bookId } }).then((data) => {
          res.redirect(`/admin/books`);
        })

      } catch (error) {
        console.error('Error updating book:', error);
        next(error);
      }
    })

  }
  deleteBook = async (req, res, next) => {
    const bookId = req.params.id;
    await Book.destroy({where: {bookId: bookId},force: true})
    .then(()=>{
      res.redirect(`/admin/books`);})
    .catch((err)=>{
      console.log('Error',err);
      next(err);})
  }
  showListUsers = async (req, res, next) => {
    const users = await User.findAll({
      order: [['createdAt', 'DESC']]
    });
    res.render('admin/users/index', { layout: 'admin', title: 'Quản lý tài khoản', users: users })
  }
  deleteUser = async (req, res, next) => {
    const userId = req.params.id;
    await User.destroy({where: {userId: userId},force: true})
    .then(()=>{
      res.redirect(`/admin/users`);})
    .catch((err)=>{
      console.log('Error',err);
      next(err);})
  }
  showListComments = async (req, res, next) => {
    const comments = await Comment.findAll({
      order: [['createdAt', 'DESC']]
    });
    res.render('admin/comments/index', { layout: 'admin', title: 'Quản lý bình luận', comments: comments })
  }
  deleteComment = async (req, res, next) => {
    const commentId = req.params.id;
    await Comment.destroy({where: {commentId: commentId},force: true})
    .then(()=>{
      res.redirect(`/admin/comments`);})
    .catch((err)=>{
      console.log('Error',err);
      next(err);})
  }
  rating = async (req,res,next) =>{
    console.log(req.body);
    const { bookId, userId, rating } = req.body;
      //check Rating
      // Nếu đã đánh giá (tồn tại userId ở bảng ghi Rating có bookId đấy) => không cho đánh giá nữa
      const ratingsBefore = await Rating.findAll({ where: { bookId,userId } });
      if (ratingsBefore[0]) {
        return res.json({
          success: false,
          message: 'Rating added fail',
        });
      }
      // Nếu chưa đánh giá:
      try {
        await Rating.create({
          userId,
          bookId,
          rating,
        });
        const ratings = await Rating.findAll({ where: { bookId } });
        const sum = ratings.reduce((acc, curr) => acc + curr.rating, 0);
        const averageRating = sum / ratings.length;

        await Book.update({ stars:averageRating, ratings: Sequelize.literal('ratings + 1') }, { where: { bookId: bookId } });
        res.json({
          success: true,
          message: 'Rating added successfully',
          averageRating,
        });
      } catch (err) {
        console.error(err);
        res.status(500).json({
          success: false,
          message: 'Failed to add rating',
        });
      }
  }

  liveSearch = async (req,res) =>{
    console.log(req.body);
    const { keySearch } = req.body;
    let books = await Book.findAll({where: {title: {[Op.like]: `%${keySearch}%`}}})
    if (books[0]) {
      let booksResult =``;
      let headResult = `<tr>
                          <th><i class="uil uil-list-ol"></i> ID</th>
                          <th><i class="uil uil-paragraph"></i> Title</th>
                          <th><i class="uil uil-image"></i> Hình</th>
                          <th><i class="uil uil-chat-bubble-user"></i> Tác giả</th>
                          <th><i class="uil uil-comment-chart-line"></i> Số bình luận</th>
                          <th><i class="uil uil-chart-pie-alt"></i> Năm phát hành</th>
                          <th><i class="uil uil-list-ui-alt"></i> Thể loại</th>
                          <th> <i class="uil uil-file-edit-alt"></i> Action</th>
                        </tr>`;
      books.forEach(book => {
        booksResult+=`
                    <tr>
                    <td>
                        ${book.dataValues.bookId}
                    </td>
                    <td>
                        </h2>
                        ${book.dataValues.title}
                        <h2>
                    </td>
                    <td><img src="/images/${book.dataValues.image}" width="80px" height="100px" style="object-fit: cover;"></td>
                    <td>
                      ${book.dataValues.author}
                    </td>
                    <td>
                        <p>
                        ${book.dataValues.commentCount}
                        </p>
                    </td>
                    <td>
                        <p>
                        ${book.dataValues.publishing}
                        </p>
                    </td>
                    <td>
                        <p>
                        ${book.dataValues.category}
                        </p>
                    </td>
                    <td style="font-size: 30px;"><a style="margin-right: 10px;" href="/admin/books/update/${book.dataValues.bookId}"><i
                                class="uil uil-edit-alt"></i></a>
                        <a onclick="return confirm('Bạn có chắc muốn xóa?')" href="/admin/books/delete/${book.dataValues.bookId}"><i class="uil uil-trash"></i></a>
                    </td>
                </tr>`
      });
      let results = headResult + booksResult;
      res.json({
        success: true,
        message: 'successfully',
        results,
      });
    }else{
      res.json({
        success: false,
        message: 'undefine',
      });
    }
  }
}
module.exports = new bookController()