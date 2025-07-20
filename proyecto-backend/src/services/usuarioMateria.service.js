const model = require('../models/usuarioMateria.model');

exports.eliminarInscripcion = async (idUsuario, idMateria) => {
  return await model.deleteByUsuarioMateria(idUsuario, idMateria);
};
