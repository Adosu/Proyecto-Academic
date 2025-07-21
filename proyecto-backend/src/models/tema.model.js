const db = require('../config/db');

// Listar temas por idApunte
exports.findByApunte = async (idApunte) => {
  const result = await db.query(`
    SELECT * FROM "Tema"
    WHERE "idApunte" = $1
    ORDER BY "idTema"
  `, [idApunte]);
  return result.rows;
};

// Insertar tema
exports.insert = async ({ idApunte, idTemaPadre, nombre }) => {
  const result = await db.query(`
    INSERT INTO "Tema" ("idApunte", "idTemaPadre", "nombre")
    VALUES ($1, $2, $3)
    RETURNING *;
  `, [idApunte, idTemaPadre || null, nombre]);
  return result.rows[0];
};

// Modificar tema
exports.update = async ({ idTema, nombre }) => {
  const result = await db.query(`
    UPDATE "Tema"
    SET "nombre" = $1
    WHERE "idTema" = $2
    RETURNING *;
  `, [nombre, idTema]);
  return result.rows[0];
};

// Eliminar tema
exports.remove = async (idTema) => {
  const result = await db.query(`
    DELETE FROM "Tema"
    WHERE "idTema" = $1
    RETURNING *;
  `, [idTema]);
  return result.rows[0];
};
