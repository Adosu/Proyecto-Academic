const model = require('../models/contenido.model');

exports.listarContenidos = async (idTema) => {
  return await model.findByTema(idTema);
};

exports.insertarContenido = async (data) => {
  return await model.insert(data);
};

exports.modificarContenido = async (data) => {
  return await model.update(data);
};

exports.eliminarContenido = async (idContenido) => {
  return await model.remove(idContenido);
};
