const adminModel = require('../models/admin');
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { isnotLoggedIn } = require('../lib/auth');

async function AddTeacher(req, res) {
    const data = req.user.rol;
    if (data == 1) {
        //const program_list = await usersModel().formShowStudyArea();
        const nivel_academico = await adminModel().academicLevel();
        res.render('users/add_teacher', { nivel_academico });
    } else {
        req.flash('message', 'no eres administrador')
        res.render('users/user_profile');
    }
}




module.exports = {
    AddTeacher
}