const convertir = require('numero-a-letras');

async function Aletras(req, res) {

    const resultado = convertir.NumerosALetras(45223)
    console.log('kkkkkkkkkk', resultado)
    res.render('users/conversionnumero');
}

module.exports = {
    Aletras
}