const service = require('../services/tema.service');

exports.getByApunte = async (req, res) => {
  try {
    const idApunte = req.query.idApunte;
    const data = await service.listarTemas(idApunte);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.create = async (req, res) => {
  try {
    const data = await service.insertarTema(req.body);
    res.status(201).json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.update = async (req, res) => {
  try {
    const data = await service.modificarTema(req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.remove = async (req, res) => {
  try {
    const idTema = parseInt(req.params.id);
    console.log('🧪 Eliminando tema con ID:', idTema);
    const data = await service.eliminarTema(idTema);
    res.json(data);
  } catch (err) {
    console.error('❌ Error al eliminar tema:', err);
    res.status(500).json({ error: err.message });
  }
};

