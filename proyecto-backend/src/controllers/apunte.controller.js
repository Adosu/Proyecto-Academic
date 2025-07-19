const service = require('../services/apunte.service');

exports.getByUsuarioAndMateria = async (req, res) => {
    try {
        const { idMateria } = req.body;
        if (!idMateria) {
            return res.status(400).json({ error: 'Debe enviar idMateria en el body' });
        }

        const idUsuario = req.user.idUsuario;
        const data = await service.getByUsuarioAndMateria(idUsuario, idMateria);
        res.json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
