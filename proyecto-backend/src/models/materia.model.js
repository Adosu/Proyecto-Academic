const db = require('../config/db');

exports.findByUsuario = async (idUsuario) => {
    const result = await db.query(`
        SELECT m.* FROM "Materia" m
        JOIN "UsuarioMateria" um ON m."idMateria" = um."idMateria"
        WHERE um."idUsuario" = $1
    `, [idUsuario]);
    return result.rows;
};