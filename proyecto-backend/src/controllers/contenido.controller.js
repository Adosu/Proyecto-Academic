const service = require('../services/contenido.service');

// Listar por idTema
exports.getByTema = async (req, res) => {
  try {
    const idTema = req.query.idTema;
    const data = await service.listarContenidos(idTema);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Insertar
exports.create = async (req, res) => {
  try {
    const data = await service.insertarContenido(req.body);
    res.status(201).json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Modificar
exports.update = async (req, res) => {
  try {
    const data = await service.modificarContenido(req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Eliminar
exports.remove = async (req, res) => {
  try {
    const { idContenido } = req.body;
    const data = await service.eliminarContenido(idContenido);
    res.json({ message: 'Contenido eliminado', data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
