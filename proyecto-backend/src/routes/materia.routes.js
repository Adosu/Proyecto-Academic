const express = require('express');
const router = express.Router();
const controller = require('../controllers/materia.controller');
const authenticateToken = require('../middleware/auth');

router.get('/', authenticateToken, controller.getByUsuario);

module.exports = router;