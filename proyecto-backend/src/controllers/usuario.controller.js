const service = require('../services/usuario.service');

// 🔹 Obtener perfil por ID (autenticado)
exports.getById = async (req, res) => {
  try {
    const data = await service.findById(req.user.idUsuario);
    if (!data) return res.status(404).json({ mensaje: 'Usuario no encontrado' });
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// 🔹 Insertar nuevo usuario
exports.create = async (req, res) => {
  try {
    const data = await service.createUsuario(req.body);
    res.status(201).json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// 🔹 Modificar usuario
exports.update = async (req, res) => {
  try {
    const data = await service.updateUsuario(req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// 🔹 Eliminar usuario
exports.remove = async (req, res) => {
  try {
    const { idUsuario } = req.body;
    const data = await service.deleteUsuario(idUsuario);
    res.json({ mensaje: 'Usuario eliminado', data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
