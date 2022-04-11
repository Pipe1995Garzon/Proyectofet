const pool = require('../database');
const passport = require('passport');


module.exports = function() {
    async function generartextpdf(cedula) {
        let sql = (`SELECT doc.nombres, doc.CC,doc.inicio_contrato,doc.salario, aca.academico,tc.Tipo_Contrato 
      FROM docente doc,nivel_academico aca , tipo_contrato tc
      WHERE doc.CC=? AND aca.id_Nivel_Aca=doc.id_Nivel_Aca AND tc.id_Contrato=doc.id_Contrato`);
        return await pool.query(sql, cedula)
    }

    return {
        generartextpdf
    }
}