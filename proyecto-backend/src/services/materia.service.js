const model = require('../models/materia.model');

exports.getMateriasActivas = async () => {
    return await model.findAllActivas();
};

exports.verificarInscripcion = async (idUsuario, idMateria) => {
    return await model.yaInscrito(idUsuario, idMateria);
};

exports.obtenerClave = async (idMateria) => {
    return await model.getClave(idMateria);
};

exports.inscribirUsuario = async (idUsuario, idMateria) => {
    return await model.inscribir(idUsuario, idMateria);
};

exports.getMateriasPorUsuario = async (idUsuario) => {
  return await model.findByUsuario(idUsuario);
};
