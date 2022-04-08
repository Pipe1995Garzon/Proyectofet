const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { isnotLoggedIn } = require('../lib/auth');

async function AddTeacher(req, res) {
    const data = req.user.rol;
    if (data == 1) {
        res.render('users/add_teacher');
    } else {
        req.flash('message', 'no eres administrador')
        res.render('users/user_profile');
    }
}


module.exports = {
    AddTeacher
}