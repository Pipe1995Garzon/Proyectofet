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



module.exports = {
    GenerarParrafo
}