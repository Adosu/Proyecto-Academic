const { Router } = require('express');
const MateriaController = require('../controllers/materia.controller');
const UsuarioMateriaController = require('../controllers/usuariomateria.controller');

const router = Router();

// Materias
router.get('/materias', MateriaController.listar);
router.get('/materias/:idmateria', MateriaController.detalle);

// UsuarioMateria
router.get('/mis-cursos', UsuarioMateriaController.authMiddleware, UsuarioMateriaController.listarMisCursos);
router.post('/inscribir', UsuarioMateriaController.authMiddleware, UsuarioMateriaController.inscribir);
router.delete('/desinscribir/:idusumat', UsuarioMateriaController.authMiddleware, UsuarioMateriaController.desinscribir);

module.exports = router;
