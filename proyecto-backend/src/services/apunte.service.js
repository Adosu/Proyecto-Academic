const model = require('../models/apunte.model');

exports.getByUsuarioAndMateria = async (idUsuario, idMateria) => {
    return await model.findByUsuarioAndMateria(idUsuario, idMateria);
};
