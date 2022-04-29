const adminModel = require('../models/admin');
const nualetras = require('numero-a-letras');
const conversor = require('conversor-numero-a-letras-es-ar');

async function AddTeacher(req, res) {
    const data = req.user.rol;
    if (data == 1) {
        let ClaseConversor = conversor.conversorNumerosALetras;
        let miConversor = new ClaseConversor();

        const fecha = new Date();
        const hoy = fecha.getDate();
        console.log('dia de hoy', hoy)
        const mesactual = fecha.getMonth();
        console.log('mes actual', mesactual);
        const anio = fecha.getFullYear();
        console.log('año actual', anio);

        function obtenerfechaentexto() {
            const hoys = new Date();
            var dd = String(hoys.getDate()).padStart(2, '0');
            var mm = String(hoys.getMonth() + 1).padStart(2, '0'); //Enero es 0!
            var yyyy = hoys.getFullYear();

            dd = miConversor.convertToText(String(dd));
            mm = miConversor.convertirNroMesAtexto(String(mm));
            yyyy = miConversor.convertToText(String(yyyy));
            return `${dd} de ${mm} de ${yyyy}`;
        }
        console.log(obtenerfechaentexto())

        //https://www.npmjs.com/package/conversor-numero-a-letras-es-ar
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
    let ClaseConversor = conversor.conversorNumerosALetras;
    let miConversor = new ClaseConversor();
    const data = req.user.rol;
    const datos = req.body;

    if (data == 1) {
        const numero = req.body.salario;
        //const aletras = numero;
        // const aletras = nualetras.NumerosALetras(numero)
        const aletras = miConversor.convertToText(numero)
            // console.log('este es el salario', numero)
        console.log('salario en letras', aletras)
            //console.log(datos);
        const Datos = {
            "nombres": req.body.nombres,
            "CC": req.body.CC,
            "correo_electronico": req.body.correo_electronico,
            "id_Nivel_Aca": req.body.id_Nivel_Aca,
            "id_Contrato": req.body.id_Contrato,
            "id_labor": req.body.id_labor,
            "id_programa": req.body.id_programa,
            "inicio_contrato": req.body.inicio_contrato,
            "fin_contrato": req.body.fin_contrato,
            "salario": req.body.salario,
            "salarioenletras": aletras
        }
        console.log(Datos)
        await adminModel().add_teacher_post(Datos);
        req.flash('success', 'User was saved successfullly');
        res.redirect('/administrador/add_teacher');
    } else {

    }
}



module.exports = {
    AddTeacher,
    AddTeacherPost
}