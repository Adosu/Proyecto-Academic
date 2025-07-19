const service = require('../services/materia.service');

exports.getByUsuario = async (req, res) => {
    try {
        const data = await service.getByUsuario(req.user.idUsuario);
        res.json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};