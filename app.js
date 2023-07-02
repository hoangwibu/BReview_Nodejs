var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const handlebars = require('express-handlebars');
var indexRouter = require('./routes/index');
var bookRouter = require('./routes/book');
var adminRouter = require('./routes/admin');
var {requireLogin,requireAdmin} = require('./controllers/authController');
// const route = require('./routes/index');
const hbs = handlebars.create({
  extname: 'hbs',
  defaultLayout: 'main',
  layoutsDir: path.join(__dirname, 'views/layouts'),
  partialsDir: path.join(__dirname, 'views/partials'),
  helpers: {
    getTimeAgo(timestamp) {
      const date = new Date(timestamp);
      const now = new Date();
      const seconds = Math.floor((now - date) / 1000);
      const minutes = Math.floor(seconds / 60);
      const hours = Math.floor(minutes / 60);
      const days = Math.floor(hours / 24);
      const months = Math.floor(days / 30);
      const years = Math.floor(months / 12);

      if (years > 0) {
        return `${years} năm trước`;
      } else if (months > 0) {
        return `${months} tháng trước`;
      } else if (days > 0) {
        return `${days} ngày trước`;
      } else if (hours > 0) {
        return `${hours} giờ trước`;
      } else if (minutes > 0) {
        return `${minutes} phút trước`;
      } else {
        return `${seconds} giây trước`;
      }
    },
    formatDate(dateString) {
      const date = new Date(dateString);
      const day = date.getDate();
      const month = date.getMonth() + 1;
      const year = date.getFullYear();
      const hour = date.getHours();
      const minute = date.getMinutes();
    
      const formattedDate = `${day}h${minute}, ${day} tháng ${month}, ${year}`;
    
      return formattedDate;
    },
    eq: function (a, b) {
      return a === b;
    },
    rounding: num => num.toFixed(1)
  }
})

var app = express();

//setup view engine
app.engine('hbs', hbs.engine)
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//routers
app.use('/', indexRouter);
app.use('/book',requireLogin, bookRouter);
app.use('/admin',requireAdmin, adminRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

// route(app);
module.exports = app;
