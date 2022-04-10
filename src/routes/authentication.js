const express = require('express');
const router = express.Router();
const isAdminorTeaccher = require('../controllers/users');
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { isnotLoggedIn } = require('../lib/auth');

//empieza modulo gestion humana
//resgitrarse get
router.get('/signup', isnotLoggedIn, (req, res) => {
    res.render('auth/signup');
});

//resgitrarse post
router.post('/signup', passport.authenticate('local.registrar', {
    successRedirect: '/auth/user_profile',
    failureRedirect: '/signup',
    failureFlash: true
}));
//ingresar get modulo gestion humana
router.get('/signingestionhumana', isnotLoggedIn, (req, res) => {
        res.render('auth/signin');
    })
    //ingresar post modulo gestion humana
router.post('/signin', (req, res, next) => {
    passport.authenticate('local.login', {
        successRedirect: '/auth/user_profile',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next)
})

//perfil admin o docente modulo gestion humane
router.get('/user_profile', isLoggedIn, isAdminorTeaccher.teacherORAdminController);

//cerrar sesion modulo gestion humana
router.get('/logout', isLoggedIn, (req, res) => {
    req.logOut();
    res.redirect('/signingestionhumana')
});


//fin modulo gestion humana

//ruta escoger modulos.
router.get('/menu_modulos', isnotLoggedIn, (req, res) => {
    res.render('auth/menu_modulos');
});

//empieza modulo gestion de calidad
//ingresar get modulo gestion humana
router.get('/signin_gestioncalidad', isnotLoggedIn, (req, res) => {
    res.render('auth/signingestioncalidad');
})

module.exports = router;