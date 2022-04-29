const docenteModel = require('../models/docentes');
const conversor = require('conversor-numero-a-letras-es-ar');
const puppeteer = require('puppeteer');
const pdfDocument = require('pdfkit');
const fs = require('fs');
const blobStream = require('blob-stream');
const { listeners, eventNames } = require('process');
const { text } = require('pdfkit');
const docentes = require('../models/docentes');

async function crearCertificado(url) {
    console.log('estoy llegando aqui')
        // Abrir el navegador
    let navegador = await puppeteer.launch();
    // Creamos una nueva pestaña o pagina
    let pagina = await navegador.newPage();
    // Abrir la url dentro de esta pagina
    await pagina.goto(url);
    // Vamos a crear nuestro PDF
    let pdf = await pagina.pdf();
    // Cerrar el navegador
    navegador.close();
    console.log('tambien aqui')
    return pdf;
}

async function GenerarParrafo(req, res) {
    const data = req.user.rol;
    if (data == 2) {
        let ClaseConversor = conversor.conversorNumerosALetras;
        let miConversor = new ClaseConversor();

        function obtenerFechaParaPdf() {
            const today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = String(today.getFullYear());


            dd = miConversor.convertToText(String(dd));
            mm = miConversor.convertirNroMesAtexto(String(mm));
            yyyy = miConversor.convertToText(String(yyyy));
            return `${dd} de ${mm} de ${yyyy}`;
        }
        console.log('holis')
            // console.log(obtenerFechaParaPdf());
        const fecha = obtenerFechaParaPdf();
        console.log(fecha);
        const cedula = [req.user.cc];
        const texto = await docenteModel().generartextpdf(cedula);
        const f = JSON.parse(JSON.stringify(texto));
        const docente = f[0]
        console.log(docente.nombres)
            //pdf
        const doc = new pdfDocument({ bufferPage: true });
        const nombre = `Fet${docente.nombres}.pdf`
        const stream = res.writeHead(200, {
            'Content-Type': 'application/pdf',
            'Content-disposition': `attachment;nombre=${nombre}`
        });
        doc.on('data', (data) => { stream.write(data) })
        doc.on('data', () => { stream.end() })
            //empieza diseño del contnido pdf

        //titulo
        doc.image('./src/public/img/img_pdf/fet.png', 0, 0, {
            width: 600,
            height: 100
        });

        doc.moveDown();
        doc.fontSize(15).text(`LA SUSCRITA COORDINADORA DE TALENTO HUMANA DE LA FUNDACIÓN ESCUELA 
        TECNOLÓGICA DE NEIVA “JESÚS OVIEDO PÉREZ” – FET`, {
                width: 410,
                align: 'center'
            })
            //espaciado
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        //----
        //certifica que 
        doc.fontSize(13).text('Cerfifica que:', { align: 'center' })
            //espaciado
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        //-----
        //texto del certificado
        const textoCerfificado = ` La señor(a) ${docente.nombres} identificado con cédula de ciudadanía No. ${docente.CC} expedida en Neiva, labora en la  Fundación Escuela Tecnológica de Neiva “Jesús Oviedo Pérez” - FET, mediante contrato individual de trabajo a término fijo CT 022-2022A desde el día ${docente.inicio_contrato} del año 2022, desempeñando el cargo de DOCENTE TIEMPO COMPLETO, devengando un salario básico mensual de DOS MILLONES DOSCIENTOS CUARENTA Y CUATRO MIL PESOS MCTE. ($2.244.000).`
        doc.fontSize(10).text(`${textoCerfificado}`, {
            align: 'justify'
        });
        //--------
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();

        //fecha en que se imprime  
        const fechaDeExpedicion = ` La presente Certificación se expide a solicitud de la interesado, el ${fecha} 2022.`
        doc.fontSize(10).text(`${fechaDeExpedicion}`, {
                align: 'justify'
            })
            //--
            //espaciado 
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();
        //-----
        //quien lo expide
        doc.fontSize(10).text('Cordialmente', { align: 'justify' })
        doc.moveDown();
        doc.moveDown();
        doc.moveDown();

        //firma
        doc.image('./src/public/img/img_pdf/firma.png', 40, 590, {
            width: 150,
            height: 40
        });
        doc.fontSize(10).text('_______________________________', { align: 'justify' });

        doc.fontSize(10).text('MARIA FERNANDA VALENZUELA', { align: 'justify' });

        doc.fontSize(10).text('Coordinadora Gestion Humana', { align: 'justify' });

        doc.fontSize(10).text('', { align: 'justify' });

        doc.fontSize(10).text('gestionhumana@fet.edu.co', { align: 'justify' })

        //imagen footer
        doc.image('./src/public/img/img_pdf/fet_2.png', 0, 680, {
            width: 600,
            height: 100
        });
        //-------

        doc.end();
        //fin pdf
        //  res.render('docentes/generar_parrafo', { texto, fecha, layout: "pdfs/certificadof" });
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

async function prueba(req, res) {

    const doc = new pdfDocument({ bufferPage: true });
    const nombre = `Fet${Date.now()}.pdf`
    const stream = res.writeHead(200, {
        'Content-Type': 'application/pdf',
        'Content-disposition': `attachment;nombre=${nombre}`
    });
    doc.on('data', (data) => { stream.write(data) })
    doc.on('data', () => { stream.end() })
    doc.text('hola mundo');
    doc.end();
}



module.exports = {
    GenerarParrafo,
    listTeacherController,
    ModificarDocenteController,
    EliminarDocenteController,
    prueba,
    async certificadosencillo(req, res) {
        //res.render('pdfs/certificadof', { layout: "pdf" });
        res.render('docentes/generar_parrafo', { layout: "pdfs/certificadof" });
        //res.redirect('/docente/generar_parrafo', { layout: "pdfs/certificadof" });
    },
    async descargar(req, res) {

        //const cedulas = req.user.cc;
        let pdf = await crearCertificado("http://localhost:4000/docente/generarparrafo");

        // Devolver el response como PDF
        res.contentType('application/pdf');
        res.send(pdf);
    }
}