const db = require('../config/db');

// Listar contenidos por idTema
exports.findByTema = async (idTema) => {
  const result = await db.query(`
    SELECT * FROM "Contenido"
    WHERE "idTema" = $1
    ORDER BY "idContenido"
  `, [idTema]);
  return result.rows;
};

// Insertar nuevo contenido
exports.insert = async ({ idTema, idTipo, texto }) => {
  const result = await db.query(`
    INSERT INTO "Contenido" ("idTema", "idTipo", "texto")
    VALUES ($1, $2, $3)
    RETURNING *;
  `, [idTema, idTipo, texto]);
  return result.rows[0];
};

// Modificar contenido existente
exports.update = async ({ idContenido, idTipo, texto }) => {
  const result = await db.query(`
    UPDATE "Contenido"
    SET "idTipo" = $1, "texto" = $2
    WHERE "idContenido" = $3
    RETURNING *;
  `, [idTipo, texto, idContenido]);
  return result.rows[0];
};

// Eliminar contenido
exports.remove = async (idContenido) => {
  const result = await db.query(`
    DELETE FROM "Contenido"
    WHERE "idContenido" = $1
    RETURNING *;
  `, [idContenido]);
  return result.rows[0];
};
