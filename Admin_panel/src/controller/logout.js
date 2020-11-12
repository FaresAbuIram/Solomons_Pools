logout = (req, res) => {
    res.cookie('auth_token', null);
    res.cookie('_id', null);
    res.redirect('/login');
};


module.exports = {
    logout
}