const User = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const app = require('./../../app');
/**
 * An async method for user login.
 * 
 * @param req - object contains data send from url
 * @param res - object send back to the url
 */
login = async (req, res) => {
    try {
        
        const user = await User.findOne({
            email: req.body.email
        });
        // check if email and password are valid.
        if (!user) {
            return res.render('pages/login/login', {
                layout: false,
                error: true,
                code: 400,
                message: 'Invalid email or password'
            });
        }
        bcrypt
            .compare(req.body.password, user.password)
            .then(async validPassword => {
                if (!validPassword) {
                    return res.render('pages/login/login', {
                        layout: false,
                        error: true,
                        code: 400,
                        message: 'Invalid email or password'
                    })
                };
                const token = jwt.sign({
                        userId: user._id
                    },
                    process.env.TOKEN_SECRET
                );
                // update user adding token
                const updatedUser = await User.updateOne({
                    _id: user._id
                }, {
                    $set: {
                        token: token
                    }
                });

                let options = {
                    maxAge: 1000 * 60 * 60, // would expire after 15 minutes
                    httpOnly: true // The cookie only accessible by the web server
                };
                res.cookie('auth_token', token, options);
                res.cookie('_id', user._id, options)
                // Redirect user to the home page
                req.flash("info", "Welcome to Solomon's Pools Admin Panel")
                res.redirect('/');
            });

    } catch (error) {
        return res.render('pages/login/login', {
            layout: false,
            error: true,
            code: 400,
            message: 'Invalid email or password'

        });
    }

};

module.exports = {
    login
}