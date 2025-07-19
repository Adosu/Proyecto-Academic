const express = require('express');
const router = express.Router();
const controller = require('../controllers/recordatorio.controller');
const authenticateToken = require('../middleware/auth');

router.get('/listar', authenticateToken, controller.getByUsuario);           // Listar
router.post('/insertar', authenticateToken, controller.create);               // Insertar
router.put('/modificar', authenticateToken, controller.update);                // Modificar
router.delete('/eliminar', authenticateToken, controller.remove);             // Eliminar

module.exports = router;