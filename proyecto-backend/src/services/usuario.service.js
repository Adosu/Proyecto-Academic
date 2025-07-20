const model = require('../models/usuario.model');

// Buscar por correo
exports.findByCorreo = async (correo) => {
  return await model.findByCorreo(correo);
};

// Buscar por ID
exports.findById = async (idUsuario) => {
  return await model.findById(idUsuario);
};

// Insertar
exports.createUsuario = async (data) => {
  return await model.insert(data);
};

// Modificar
exports.updateUsuario = async (data) => {
  return await model.update(data);
};

// Eliminar
exports.deleteUsuario = async (idUsuario) => {
  return await model.remove(idUsuario);
};
  