const { Router } = require('express');
const { authMiddleware } = require('../controllers/_auth');

const ApunteController = require('../controllers/apunte.controller');
const TemaController = require('../controllers/tema.controller');
const ContenidoController = require('../controllers/contenido.controller');

const router = Router();

// Árbol de un apunte
router.get('/:idapunte/tree', authMiddleware, ApunteController.arbol);

// APUNTES
router.get('/:idusumat', authMiddleware, ApunteController.listarPorUsuMat);
router.post('/',          authMiddleware, ApunteController.crear);
router.get('/detalle/:idapunte',   authMiddleware, ApunteController.detalle);
router.put('/:idapunte',  authMiddleware, ApunteController.actualizar);
router.delete('/:idapunte', authMiddleware, ApunteController.eliminar);

// TEMAS
router.get('/:idapunte/temas', authMiddleware, TemaController.listarPorApunte);
router.post('/temas',          authMiddleware, TemaController.crear);
router.put('/temas/:idtema',   authMiddleware, TemaController.actualizar);
router.delete('/temas/:idtema',authMiddleware, TemaController.eliminar);

// CONTENIDOS
router.get('/temas/:idtema/contenidos', authMiddleware, ContenidoController.listarPorTema);
router.post('/contenidos',              authMiddleware, ContenidoController.crear);
router.put('/contenidos/:idcontenido',  authMiddleware, ContenidoController.actualizar);
router.delete('/contenidos/:idcontenido',authMiddleware, ContenidoController.eliminar);

module.exports = router;
