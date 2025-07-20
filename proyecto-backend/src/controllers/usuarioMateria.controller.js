const service = require('../services/usuarioMateria.service');

exports.desinscribir = async (req, res) => {
  const idUsuario = req.user.idUsuario;
  const { idMateria } = req.body;

  try {
    const resultado = await service.eliminarInscripcion(idUsuario, idMateria);
    if (!resultado) {
      return res.status(404).json({ message: 'Inscripción no encontrada' });
    }
    res.json({ message: 'Desinscripción exitosa', data: resultado });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
