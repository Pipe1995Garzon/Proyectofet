const express = require('express');
const router = express.Router();
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { isnotLoggedIn } = require('../lib/auth');
const { route } = require('./authentication');
const allAboutAdmin = require('../controllers/admin');

//en este espacio se va a programar todo la funcinalidad del administrador
//here will be programming the admin functions

router.get('/add_teacher', isLoggedIn, allAboutAdmin.AddTeacher);
router.post('/addteacher', isLoggedIn, allAboutAdmin.AddTeacherPost);

module.exports = router;