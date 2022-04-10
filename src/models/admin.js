const pool = require('../database');
const passport = require('passport');


module.exports = function() {

    //list academic level   
    async function academicLevel() {
        let querylist = "select * from nivel_academico";
        return await pool.query(querylist);
    }

    //listar tipo de contrato docente
    async function tipoContrato() {
        let querylist = "select * from tipo_contrato";
        return await pool.query(querylist);
    }

    //listar labor docente
    async function labor() {
        let querylist = "select * from labor";
        return await pool.query(querylist);
    }

    //listar labor docente
    async function add_teacher_post(docente) {
        let sql = "insert into docente set ?";
        return await pool.query(sql, docente);
    }

    async function programa() {
        let querylist = "select * from programa";
        return await pool.query(querylist);
    }

    return {
        academicLevel,
        tipoContrato,
        labor,
        add_teacher_post,
        programa
    }
}