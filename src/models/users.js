const pool = require('../database');

module.exports = function() {
    //add employed
    async function addEmployeesModel(employees) {
        let sql = "insert into empleados set ?";
        return await pool.query(sql, employees);
    }

    //list employed controller   
    async function listEmployes() {
        let querylist = "select * from empleados";
        return await pool.query(querylist);
    }

    //delete employees
    async function deleteEmployeesModel(employees) {
        let sql = "delete from empleados where id_empleado = ?";
        return await pool.query(sql, employees);
    }

    async function updateEmployeesModel(employees) {
        let sql = `update empleados set nombre=?, 
                  apellido=?,edad=? where id_empleado=?`;
        return await pool.query(sql, employees);
    }

    return {
        addEmployeesModel,
        listEmployes,
        deleteEmployeesModel,
        updateEmployeesModel
    }
}