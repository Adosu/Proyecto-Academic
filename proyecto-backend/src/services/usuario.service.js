const model = require('../models/usuario.model');

exports.findByCorreo = async (correo) => {
    return await model.findByCorreo(correo);
};