const jwt = require('jsonwebtoken');
const secretKey = 'dnhoang2002';
const bcrypt = require('bcrypt');
const User = require('../models/user.model');
class authController{
  constructor(){
  }
  formLogin =(req,res)=>{
    res.render('login',{title:"Login"})
  }
  formRegister =(req,res)=>{
    res.render('register',{title:"Register"})
  }
  register = async (req, res) => {
    //let errors = {errNull:"Có lỗi xảy ra, vui lòng thử lại sau",errName:"Tên phải từ 4-20 ký tự",errEmail:"Email đã được sử dụng",errPassword:"Mật khẩu phải từ 6-20 ký tự",errPassword2:"Mật khẩu nhập lại không khớp"}
    const { name, email, password, password2 } = req.body;
  
    // Kiểm tra xem mật khẩu nhập lại có khớp không
    if (password !== password2) {
      res.render('register');
      return;
    }
  
    try {
      // Kiểm tra xem địa chỉ email đã được sử dụng chưa
      const user = await User.findOne({ where: { email } });
      if (user) {
        res.render('register',{errorEmail:"Email đã tồn tại",formData:req.body});
        return;
      }
  
      // Tạo người dùng mới
      await User.create({ name, email, password });
  
      res.redirect('/login');
    } catch (err) {
      console.error(err);
      res.render('register');
    }
  }

  login = async (req, res) => {
    const { email, password } = req.body;
    // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu hay không
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.render('login',{title:"Login",error:"Email hoặc mật khẩu không chính xác"});
    }
    // Kiểm tra mật khẩu
    const isMatched = await bcrypt.compare(password, user.password);
    if (!isMatched) {
      return res.render('login',{title:"Login",error:"Email hoặc mật khẩu không chính xác"});
    }
    // Tạo JWT
    const token = jwt.sign(user.dataValues, secretKey, { expiresIn: '10h' });

    // Gửi token đến máy khách dưới dạng cookie
    res.cookie('token', token, { maxAge: 36000000, httpOnly: true });
    res.redirect('/');
  }
  requireLogin = (req, res, next) => {
    const token = req.cookies.token;
    if (!token) {
      return res.redirect('/login');
    } else{
      try {
        const decoded = jwt.verify(token, secretKey);
        req.user = decoded;
        next();
      } catch (err) {
        res.status(400).send('Invalid token');
      }
    }
  };
  requireAdmin = (req, res, next) => {
    const token = req.cookies.token;
    if (!token) {
      return res.redirect('/login');
    } else{
      try {
        const decoded = jwt.verify(token, secretKey);
        req.user = decoded;
        if (req.user.email == "ngochoang27810@gmail.com") {
          next();
        } else{
          return res.redirect('/');
        }
        
      } catch (err) {
        res.status(400).send('Invalid token');
      }
    }
  };
  isLogged = (req, res, next) => {
    const token = req.cookies.token;
    if (!token) {
      return next()
    } else{
      return res.redirect('/');
    }
  };
  logout = (req, res, next) => {
    res.clearCookie('token')
    res.redirect('/login');
  }
}
module.exports = new authController()
