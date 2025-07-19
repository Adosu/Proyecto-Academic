const service = require('../services/recordatorio.service');

// Listar por usuario autenticado
exports.getByUsuario = async (req, res) => {
    try {
        const data = await service.getByUsuario(req.user.idUsuario);
        res.json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
// Insertar
exports.create = async (req, res) => {
    try {
        const idUsuario = req.user.idUsuario;
        const data = await service.createRecordatorio({ ...req.body, idUsuario });
        res.status(201).json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
// Modificar
exports.update = async (req, res) => {
    try {
        const data = await service.updateRecordatorio(req.body);
        res.json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
// Eliminar
exports.remove = async (req, res) => {
    try {
        const { idRecordatorio } = req.body;
        const data = await service.deleteRecordatorio(idRecordatorio);
        res.json({ message: 'Recordatorio eliminado', data });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};