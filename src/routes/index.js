const express = require('express');
const router = express.Router();
const { isnotLoggedIn } = require('../lib/auth');
const Letras = require('../controllers/convertirnumeros');


router.get('/', isnotLoggedIn, (req, res) => {
    res.render('index');
})

router.get('/conversionnumeros', isnotLoggedIn, Letras.Aletras);




module.exports = router;