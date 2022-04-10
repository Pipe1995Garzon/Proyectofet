const adminModel = require('../models/admin');


async function AddTeacher(req, res) {
    const data = req.user.rol;
    if (data == 1) {
        const nivel_academico = await adminModel().academicLevel();
        const tipo_contrato = await adminModel().tipoContrato();
        const labor = await adminModel().labor();
        const programa = await adminModel().programa();
        res.render('users/add_teacher', { nivel_academico, tipo_contrato, labor, programa });
    } else {
        req.flash('message', 'no eres administrador')
        res.render('users/user_profile');
    }
}

async function AddTeacherPost(req, res) {
    const data = req.user.rol;
    const datos = req.body;
    if (data == 1) {
        await adminModel().add_teacher_post(datos);
        req.flash('success', 'User was saved successfullly');
        res.redirect('/administrador/add_teacher');
    } else {

    }
}



module.exports = {
    AddTeacher,
    AddTeacherPost
}