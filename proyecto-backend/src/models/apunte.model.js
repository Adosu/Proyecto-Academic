const db = require('../config/db');

// Buscar idUsuMat
exports.findUsuMatId = async (idUsuario, idMateria) => {
  const result = await db.query(
    'SELECT "idUsuMat" FROM "UsuarioMateria" WHERE "idUsuario" = $1 AND "idMateria" = $2',
    [idUsuario, idMateria]
  );
  return result.rows[0]?.idUsuMat;
};

// Listar apuntes por idUsuario e idMateria
exports.findAllByUsuarioAndMateria = async (idUsuario, idMateria) => {
  const result = await db.query(`
    SELECT a.*
    FROM "Apunte" a
    JOIN "UsuarioMateria" um ON a."idUsuMat" = um."idUsuMat"
    WHERE um."idUsuario" = $1 AND um."idMateria" = $2
    ORDER BY a."fecha" DESC;
  `, [idUsuario, idMateria]);
  return result.rows;
};

// Insertar apunte con fecha actual
exports.insert = async ({ idUsuMat, titulo, resumen }) => {
  const result = await db.query(`
    INSERT INTO "Apunte" ("idUsuMat", "titulo", "resumen", "fecha")
    VALUES ($1, $2, $3, NOW())
    RETURNING *;
  `, [idUsuMat, titulo, resumen]);
  return result.rows[0];
};

// Modificar
exports.update = async ({ idApunte, titulo, resumen }) => {
  const result = await db.query(`
    UPDATE "Apunte"
    SET "titulo" = $1,
        "resumen" = $2
    WHERE "idApunte" = $3
    RETURNING *;
  `, [titulo, resumen, idApunte]);
  return result.rows[0];
};

// Eliminar
exports.remove = async (idApunte) => {
  const result = await db.query(`
    DELETE FROM "Apunte"
    WHERE "idApunte" = $1
    RETURNING *;
  `, [idApunte]);
  return result.rows[0];
};
