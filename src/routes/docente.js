const express = require('express');
const router = express.Router();
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { isnotLoggedIn } = require('../lib/auth');
const { route } = require('./authentication');
const GenerarPdf = require('../controllers/docente');



//en este espacio se va a programar todo la funcinalidad del administrador
//here will be programming the admin functions

router.get('/generarparrafo', isLoggedIn, GenerarPdf.GenerarParrafo);
router.get('/gestionar_docente', isLoggedIn, GenerarPdf.listTeacherController);
router.post('/modificar_docentes/:id', isLoggedIn, GenerarPdf.ModificarDocenteController);
router.get('/eliminar_docentes/:id', isLoggedIn, GenerarPdf.EliminarDocenteController);

module.exports = router;