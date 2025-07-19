const jwt = require('jsonwebtoken');
const usuarioService = require('../services/usuario.service');
require('dotenv').config();

exports.login = async (req, res) => {
    const { correo, contraseña } = req.body;
    try {
        const usuario = await usuarioService.findByCorreo(correo);
        if (!usuario) return res.status(401).json({ msg: 'Correo no encontrado' });

        // Comparación directa de texto plano
        if (contraseña !== usuario.contraseña) {
            return res.status(401).json({ msg: 'Contraseña incorrecta' });
        }

        const token = jwt.sign({ idUsuario: usuario.idUsuario }, process.env.JWT_SECRET, { expiresIn: '1h' });
        res.json({
            token,
            usuario: {
                idUsuario: usuario.idusuario,
                nombre: usuario.nombre,
                correo: usuario.correo
            }
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
