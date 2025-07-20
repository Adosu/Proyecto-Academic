const model = require('../models/usuario.model');

// Ya existente
exports.findByCorreo = async (correo) => {
  return await model.findByCorreo(correo);
};

// 🔹 Nuevo
exports.findById = async (idUsuario) => {
  return await model.findById(idUsuario);
};

exports.createUsuario = async (data) => {
  return await model.insert(data);
};

exports.updateUsuario = async (data) => {
  return await model.update(data);
};

exports.deleteUsuario = async (idUsuario) => {
  return await model.remove(idUsuario);
};
