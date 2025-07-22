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
exports.insert = async ({ idTema, texto }) => {
  const result = await db.query(`
    INSERT INTO "Contenido" ("idTema", "texto")
    VALUES ($1, $2)
    RETURNING *;
  `, [idTema, texto]);
  return result.rows[0];
};

// Modificar contenido existente
exports.update = async ({ idContenido, texto }) => {
  const result = await db.query(`
    UPDATE "Contenido"
    SET "texto" = $1
    WHERE "idContenido" = $2
    RETURNING *;
  `, [texto, idContenido]);
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
