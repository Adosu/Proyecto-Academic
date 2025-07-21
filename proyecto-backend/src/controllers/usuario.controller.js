const service = require('../services/usuario.service');

// Obtener perfil autenticado
exports.getById = async (req, res) => {
  try {
    const data = await service.findById(req.user.idUsuario);
    if (!data) return res.status(404).json({ mensaje: 'Usuario no encontrado' });
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Insertar nuevo usuario
exports.create = async (req, res) => {
  try {
    const datos = {
      ...req.body,
      estado: 'Activo',
      fechaRegistro: new Date().toISOString().split('T')[0]
    };

    const data = await service.createUsuario(datos);
    res.status(201).json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Modificar usuario autenticado
exports.update = async (req, res) => {
  try {
    const idUsuario = req.user.idUsuario;
    const usuarioModificado = await service.updateUsuario({
      idUsuario,
      ...req.body,
      estado: req.body.estado || 'Activo' // por defecto
    });
    res.json(usuarioModificado);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Eliminar usuario autenticado
exports.remove = async (req, res) => {
  try {
    const idUsuario = req.user.idUsuario;
    const data = await service.deleteUsuario(idUsuario);
    res.json({ mensaje: 'Usuario eliminado correctamente', data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
