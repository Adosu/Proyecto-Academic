const service = require('../services/apunte.service');

exports.listar = async (req, res) => {
  try {
    const { idUsuario } = req.user;
    const idMateria = Number(req.params.idMateria);
    const data = await service.listarApuntes(idUsuario, idMateria);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.insertar = async (req, res) => {
  try {
    const { idUsuario } = req.user;
    const idMateria = Number(req.params.idMateria);
    const { titulo, resumen } = req.body;

    const apunte = await service.insertarApunte({
      idUsuario,
      idMateria,
      titulo,
      resumen: resumen || ''
    });

    res.status(201).json(apunte);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.modificar = async (req, res) => {
  try {
    const data = await service.modificarApunte(req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.eliminar = async (req, res) => {
  try {
    const { idApunte } = req.body;
    const data = await service.eliminarApunte(idApunte);
    res.json({ mensaje: 'Apunte eliminado correctamente', data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
