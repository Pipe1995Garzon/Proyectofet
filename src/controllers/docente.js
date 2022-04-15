const docenteModel = require('../models/docentes');

async function GenerarParrafo(req, res) {
    const data = req.user.rol;
    if (data == 2) {
        const cedula = [req.user.cc];
        const texto = await docenteModel().generartextpdf(cedula);
        console.log(texto)
        res.render('docentes/generar_parrafo', { texto });
    } else {
        req.flash('message', 'no tienes permiso')
        res.render('users/user_profile');
    }
}

//listar docentes
async function listTeacherController(req, res) {
    const data = req.user.rol;
    if (data == 1) {
        const teacher_list = await docenteModel().listteacher();
        // console.log(teacher_list)
        res.render('users/list_teacher', { teacher_list });
    } else {
        res.render('users/user_profile');
    }

}

//modificar docentes
async function ModificarDocenteController(req, res) {
    const data = [
            req.body.nombres,
            req.body.CC,
            req.body.correo_electronico,
            req.body.id_Nivel_Aca,
            req.body.id_Contrato,
            req.body.id_labor,
            req.body.id_programa,
            req.body.inicio_contrato,
            req.body.fin_contrato,
            req.body.salario,
            req.params.id
        ]
        //console.log(data)
    await docenteModel().modificarDocentesModel(data)
    req.flash('success', 'Exito');
    res.redirect('/docente/gestionar_docente')

}

async function EliminarDocenteController(req, res) {
    const data = req.params.id;
    console.log(data)
    await docenteModel().eliminarDocentesModel(data);
    req.flash('success', 'exito');
    res.redirect('/docente/gestionar_docente')
}

module.exports = {
    GenerarParrafo,
    listTeacherController,
    ModificarDocenteController,
    EliminarDocenteController
}