const pool = require('../database');
const passport = require('passport');

//generar texto de cerfitificado de los docentes
module.exports = function() {
    async function generartextpdf(cedula) {
        let sql = (`SELECT doc.nombres, doc.CC,doc.inicio_contrato,doc.salario, aca.academico,tc.Tipo_Contrato 
      FROM docente doc,nivel_academico aca , tipo_contrato tc
      WHERE doc.CC=? AND aca.id_Nivel_Aca=doc.id_Nivel_Aca AND tc.id_Contrato=doc.id_Contrato`);
        return await pool.query(sql, cedula)
    }
    async function listteacher() {
        let querylist = (`SELECT doc.id_docentes, doc.nombres, doc.CC, doc.correo_electronico, 
        doc.salario, niv.Academico, con.Tipo_Contrato, 
        lab.labor, pro.programa, doc.inicio_contrato,
        doc.fin_contrato FROM docente doc, nivel_academico niv,
        tipo_contrato con, labor lab, programa pro WHERE doc.id_Nivel_Aca=niv.id_Nivel_Aca AND 
        doc.id_Contrato=con.id_Contrato AND doc.id_labor=lab.id_labor AND doc.id_programa=pro.id_programa`);
        return await pool.query(querylist);
    }

    //modificar docentes
    async function modificarDocentesModel(data) {
        console.log(data);
        let sql = `update docente set nombres = ?,
        CC=?, correo_electronico = ?, id_Nivel_Aca=?, id_Contrato=?, 
        id_labor=? ,id_programa=?,inicio_contrato=?,fin_contrato=?,salario=? where id_docentes=?`;

        return await pool.query(sql, data);
    }

    //delete employees
    async function eliminarDocentesModel(docentes) {
        console.log(docentes);
        let sql = "delete from docente where id_docentes = ?";
        return await pool.query(sql, docentes);
    }

    async function generarCertificadoSencillo(cedula) {
        let sql = (`SELECT doc.nombres, doc.CC,doc.inicio_contrato,doc.salario, aca.academico,tc.Tipo_Contrato 
        FROM docente doc,nivel_academico aca , tipo_contrato tc
        WHERE doc.CC=? AND aca.id_Nivel_Aca=doc.id_Nivel_Aca AND tc.id_Contrato=doc.id_Contrato`);
        return await pool.query(sql, cedula)
    }

    return {
        generartextpdf,
        listteacher,
        modificarDocentesModel,
        eliminarDocentesModel,
        generarCertificadoSencillo
    }
}