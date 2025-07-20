const service = require('../services/materia.service');

// GET: listar materias activas
exports.listar = async (req, res) => {
    try {
        const data = await service.getMateriasActivas();
        res.json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// POST: inscribir usuario autenticado
exports.inscribirse = async (req, res) => {
    try {
        const idUsuario = req.user.idUsuario;
        const { idMateria, clave } = req.body;

        const claveCorrecta = await service.obtenerClave(idMateria);
        if (!claveCorrecta || claveCorrecta !== clave) {
            return res.status(400).json({ mensaje: 'Clave incorrecta' });
        }

        const yaInscrito = await service.verificarInscripcion(idUsuario, idMateria);
        if (yaInscrito) {
            return res.status(409).json({ mensaje: 'Ya estás inscrito en esta materia' });
        }

        const inscripcion = await service.inscribirUsuario(idUsuario, idMateria);
        res.status(201).json({ mensaje: 'Inscripción exitosa', inscripcion });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.misCursos = async (req, res) => {
  try {
    const idUsuario = req.user.idUsuario;
    const cursos = await service.getMateriasPorUsuario(idUsuario);
    res.json(cursos);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

