const express = require('express');
const router = express.Router();
const controller = require('../controllers/contenido.controller');
const authenticateToken = require('../middleware/auth');

router.get('/listar', authenticateToken, controller.getByTema);
router.post('/insertar', authenticateToken, controller.create);
router.put('/modificar', authenticateToken, controller.update);
router.delete('/eliminar', authenticateToken, controller.remove);

module.exports = router;
