const model = require('../models/recordatorio.model');

exports.getByUsuario = async (idUsuario) => {
    return await model.findByUsuario(idUsuario);
};
exports.createRecordatorio = async (data) => {
    return await model.insert(data);
};
exports.updateRecordatorio = async (data) => {
    return await model.update(data);
};

exports.deleteRecordatorio = async (idRecordatorio) => {
    return await model.remove(idRecordatorio);
};