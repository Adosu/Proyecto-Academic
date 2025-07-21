const express = require('express');
const router = express.Router();
const controller = require('../controllers/tema.controller');
const authenticateToken = require('../middleware/auth');

// Rutas protegidas
router.get('/listar', authenticateToken, controller.getByApunte);
router.post('/insertar', authenticateToken, controller.create);
router.put('/modificar', authenticateToken, controller.update);
router.delete('/eliminar', authenticateToken, controller.remove);

module.exports = router;
