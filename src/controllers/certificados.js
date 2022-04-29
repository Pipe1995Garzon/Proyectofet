const puppeteer = require('puppeteer');
const docenteModel = require('../models/docentes');


async function crearCertificado(url) {
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
    return pdf;
}

module.exports = {
    async certificadosencillo(req, res) {

        //res.render('pdfs/certificadof', { layout: "pdf" });
        res.render('docentes/generar_parrafo', { layout: "pdfs/certificadof" });
        //res.redirect('/docente/generar_parrafo', { layout: "pdfs/certificadof" });
    },
    async descargar(req, res) {
        //const cedulas = req.user.cc;
        //const texto = await docenteModel().generartextpdf(cedulas);
        // Crear nustra factura
        let pdf = await crearCertificado("http://localhost:4000/docente/generarparrafo");
        //let pdf = await crearCertificado("http://localhost:4000/docente/certificado", { texto });
        //http://localhost:4000/docente/generarparrafo
        //let pdf = await crearFactura("http://localhost:4000");
        //let pdf = await crearFactura("http://localhost:4000/certificado");
        //let pdf = await crearFactura("http://localhost:4000/docente/certificado");
        // Devolver el response como PDF
        res.contentType('application/pdf');
        res.send(pdf);
    }
}