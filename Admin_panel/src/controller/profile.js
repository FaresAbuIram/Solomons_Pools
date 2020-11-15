const User = require("../models/User");
const bcrypt = require('bcryptjs');
const imageuploadservice = require('../services/imageuploadservice');


gProfile = async (req, res) => {
    let user = await req['user'];
    res.render('pages/profile/profile', user)
}

updateProfile = async (req, res) => {
    imageuploadservice.uploadLocalStorage(req, res, async (err) => {
        console.log(req.body);
        console.log(req.files);

        const name = req.body.userName;
        const email = req.body.email;
        let password = req['user'].password;
        let picture = req['user'].picture;

        if (req.body.password) {
            const salt = await bcrypt.genSalt(10);
            const hashedPassword = await bcrypt.hash(req.body.password, salt);
            password = hashedPassword;
        }
        if (req.files.event) {
            const imagePath = req.files.event[0].path;
            const image = await imageuploadservice.uploadCloudinary(
                imagePath,
                'profilePicture',
            );
            picture = image.url;
        }

        let id = req['user']._id;
        await User.updateOne({
            _id: id
        }, {
            $set: {
                userName: name,
                email: email,
                password: password,
                picture: picture
            },
        });;
        req.flash('success', 'Updated');
        res.redirect('/profile');
    })
}



module.exports = {
    gProfile,
    updateProfile
}