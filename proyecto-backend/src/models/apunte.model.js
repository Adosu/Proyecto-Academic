const db = require('../config/db');

exports.findByUsuarioAndMateria = async (idUsuario, idMateria) => {
    const result = await db.query(`
        SELECT a.* FROM "Apunte" a
        JOIN "UsuarioMateria" um ON a."idUsuMat" = um."idUsuMat"
        WHERE um."idUsuario" = $1 AND um."idMateria" = $2
    `, [idUsuario, idMateria]);
    return result.rows;
};
