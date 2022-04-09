const pool = require('../database');
const passport = require('passport');


module.exports = function() {

    //list academic level   
    async function academicLevel() {
        let querylist = "select * from nivel_academico";
        return await pool.query(querylist);
    }
    return {
        academicLevel
    }
}