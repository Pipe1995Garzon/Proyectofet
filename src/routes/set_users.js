const express = require('express');
const router = express.Router();
const pool = require('../database');
const SetEmployed = require('../controllers/users')

//add employed
router.get('/register_employees', (req, res) => {
    res.render('users/add_users');
});
//add employed
router.post('/register_employed', SetEmployed.addEmployedController);

//list employed
router.get('/list_employees', SetEmployed.listEmployedController);

//delete employed
router.get('/delete_employees/:id', SetEmployed.deleteEmployedController);

//update employed
router.post('/update_employees/:id', SetEmployed.updateteEmployedController);



module.exports = router;