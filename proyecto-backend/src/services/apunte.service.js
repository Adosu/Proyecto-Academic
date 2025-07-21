const model = require('../models/apunte.model');

exports.listarApuntes = async (idUsuario, idMateria) => {
  return await model.findAllByUsuarioAndMateria(idUsuario, idMateria);
};

exports.insertarApunte = async ({ idUsuario, idMateria, titulo, resumen }) => {
  const idUsuMat = await model.findUsuMatId(idUsuario, idMateria);
  if (!idUsuMat) throw new Error('Usuario no inscrito en esta materia');
  return await model.insert({ idUsuMat, titulo, resumen });
};

exports.modificarApunte = async (apunte) => {
  return await model.update(apunte);
};

exports.eliminarApunte = async (idApunte) => {
  return await model.remove(idApunte);
};
