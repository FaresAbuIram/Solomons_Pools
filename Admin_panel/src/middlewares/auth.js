const User = require('./../models/User');

let auth = (req, res, next)=> {
    console.log("auth middleware");
    let token =req.cookies.token;
    console.log(token);

    if (!token) {
      return res.redirect('/login');
    }
  
    User.findByToken(token,(err,user)=>{
        if(err) {
          return res.redirect('/login');
        }
        if(!user) {
          return res.redirect('/login');
        }

        req.token = token;
        req.user = user;
        next();

    })
}

module.exports = auth;