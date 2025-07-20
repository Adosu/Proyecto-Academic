const db = require('../config/db');

exports.deleteByUsuarioMateria = async (idUsuario, idMateria) => {
  const result = await db.query(`
    DELETE FROM "UsuarioMateria"
    WHERE "idUsuario" = $1 AND "idMateria" = $2
    RETURNING *;
  `, [idUsuario, idMateria]);

  return result.rows[0];
};
