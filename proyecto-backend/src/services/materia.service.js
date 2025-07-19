const model = require('../models/materia.model');

exports.getByUsuario = async (idUsuario) => {
    return await model.findByUsuario(idUsuario);
};