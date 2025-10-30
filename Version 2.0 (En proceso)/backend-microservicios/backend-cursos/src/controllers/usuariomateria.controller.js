const jwt = require('jsonwebtoken');
const UsuarioMateriaService = require('../services/usuariomateria.service');

function authMiddleware(req, res, next) {
  const header = req.headers.authorization || '';
  const token = header.startsWith('Bearer ') ? header.slice(7) : null;
  if (!token) return res.status(401).json({ error: 'Token requerido' });

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch {
    res.status(401).json({ error: 'Token inválido' });
  }
}

const UsuarioMateriaController = {
  async listarMisCursos(req, res, next) {
    try {
      const idusuario = req.user?.idUsuario;
      const cursos = await UsuarioMateriaService.listarPorUsuario(idusuario);
      res.json(cursos);
    } catch (err) {
      next(err);
    }
  },

  async inscribir(req, res, next) {
    try {
      const idusuario = req.user?.idUsuario;
      const { idmateria } = req.body;
      const inscripcion = await UsuarioMateriaService.inscribir({ idusuario, idmateria });
      res.status(201).json(inscripcion);
    } catch (err) {
      res.status(400).json({ error: err.message });
    }
  },

  async desinscribir(req, res, next) {
    try {
      const { idusumat } = req.params;
      await UsuarioMateriaService.desinscribir(idusumat);
      res.json({ mensaje: 'Desinscripción exitosa' });
    } catch (err) {
      next(err);
    }
  },

  authMiddleware
};

module.exports = UsuarioMateriaController;
