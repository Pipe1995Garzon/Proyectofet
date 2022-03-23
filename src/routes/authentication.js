const express = require('express');
const router = express.Router();
const passport = require('passport');

router.get('/signup', (req, res) => {
    res.render('auth/signup');
});


router.post('/signup', passport.authenticate('local.registrar', {
    successRedirect: '/perfil',
    failureRedirect: '/signup',
    failureFlash: true
}));

router.get('/signin', (req, res) => {
    res.render('auth/signin');
})

router.post('/signin', (req, res, next) => {
    passport.authenticate('local.login', {
        successRedirect: '/auth/user_profile',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next)
})

router.get('/user_profile', (req, res) => {
    res.render('users/user_profile');
});



module.exports = router;