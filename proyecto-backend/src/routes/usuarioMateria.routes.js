const express = require('express');
const router = express.Router();
const controller = require('../controllers/usuarioMateria.controller');
const authenticateToken = require('../middleware/auth');

router.delete('/desinscribir', authenticateToken, controller.desinscribir);

module.exports = router;
