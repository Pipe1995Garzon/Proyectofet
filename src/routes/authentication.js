const express = require('express');
const router = express.Router();
const isAdminorTeaccher = require('../controllers/users');
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { isnotLoggedIn } = require('../lib/auth');

router.get('/signup', isnotLoggedIn, (req, res) => {
    res.render('auth/signup');
});


router.post('/signup', passport.authenticate('local.registrar', {
    successRedirect: '/auth/user_profile',
    failureRedirect: '/signup',
    failureFlash: true
}));

router.get('/signin', isnotLoggedIn, (req, res) => {
    res.render('auth/signin');
})

router.post('/signin', (req, res, next) => {
    passport.authenticate('local.login', {
        successRedirect: '/auth/user_profile',
        failureRedirect: '/signin',
        failureFlash: true
    })(req, res, next)
})

router.get('/user_profile', isLoggedIn, isAdminorTeaccher.teacherORAdminController);

router.get('/logout', isLoggedIn, (req, res) => {
    req.logOut();
    res.redirect('/signin')
});


module.exports = router;