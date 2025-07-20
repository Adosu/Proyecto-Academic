const express = require('express');
const router = express.Router();
const controller = require('../controllers/materia.controller');
const authenticateToken = require('../middleware/auth');

router.get('/listar', authenticateToken, controller.listar);
router.post('/inscribirse', authenticateToken, controller.inscribirse);
router.get('/mis-cursos', authenticateToken, controller.misCursos);

module.exports = router;
