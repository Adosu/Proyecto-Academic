const express = require('express');
const router = express.Router();
const controller = require('../controllers/apunte.controller');
const authenticateToken = require('../middleware/auth');

router.post('/materia', authenticateToken, controller.getByUsuarioAndMateria);

module.exports = router;
