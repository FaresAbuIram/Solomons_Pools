const User = require('./../models/User');

let auth = (req, res, next) => {
 
  let token = req.cookies.auth_token;
  if (!token) {
    return res.redirect('/login');
  }

  User.findOne({
    token: token
  }, (err, user) => {
    if (err) {
      return res.redirect('/login');
    }
    if (!user) {
      return res.redirect('/login');
    }

    req.token = token;
    req.user = user;
    next();

  })
}

module.exports = auth;