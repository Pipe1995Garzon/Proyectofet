const usersModel = require('../models/users');
//render a una vista y redirect va a la ruta
//add employes
async function addEmployedController(req, res) {
    const data = req.body;
    await usersModel().addEmployeesModel(data);
    req.flash('success', 'User was saved successfullly');
    res.redirect('/setusers/register_employees');
}
//list employed controller
async function listEmployedController(req, res) {
    const employed_list = await usersModel().listEmployes();
    res.render('users/list_users', { employed_list });
    //console.log(employed_list);
}

async function deleteEmployedController(req, res) {
    const data = req.params.id;
    await usersModel().deleteEmployeesModel(data);
    req.flash('success', 'User was removed successfullly');
    res.redirect('/setusers/list_employees')
}

async function updateteEmployedController(req, res) {
    const data = [
        req.body.nombre,
        req.body.apellido,
        req.body.edad,
        req.params.id
    ]
    await usersModel().updateEmployeesModel(data);
    req.flash('success', 'User was updated successfullly');
    res.redirect('/setusers/list_employees')
}

module.exports = {
    addEmployedController,
    listEmployedController,
    deleteEmployedController,
    updateteEmployedController
}