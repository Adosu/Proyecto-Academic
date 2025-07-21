const express = require('express');
const router = express.Router();
const controller = require('../controllers/apunte.controller');
const authenticateToken = require('../middleware/auth');

router.get('/listar/:idMateria', authenticateToken, controller.listar);
router.post('/insertar/:idMateria', authenticateToken, controller.insertar);
router.put('/modificar', authenticateToken, controller.modificar);
router.delete('/eliminar', authenticateToken, controller.eliminar);

module.exports = router;
