const model = require('../models/tema.model');

exports.listarTemas = async (idApunte) => {
  return await model.findByApunte(idApunte);
};

exports.insertarTema = async (data) => {
  return await model.insert(data);
};

exports.modificarTema = async (data) => {
  return await model.update(data);
};

exports.eliminarTema = async (idTema) => {
  return await model.remove(idTema);
};
