const db = require('../config/db');

// Ya existente
exports.findByCorreo = async (correo) => {
  const result = await db.query('SELECT * FROM "Usuario" WHERE correo = $1', [correo]);
  return result.rows[0];
};

// 🔹 Nuevo: obtener por ID
exports.findById = async (idUsuario) => {
  const result = await db.query(
    'SELECT "idUsuario", nombre, apellido, correo FROM "Usuario" WHERE "idUsuario" = $1',
    [idUsuario]
  );
  return result.rows[0];
};

// 🔹 Nuevo: insertar
exports.insert = async ({ nombre, apellido, correo, contraseña, estado, fechaRegistro }) => {
  const result = await db.query(`
    INSERT INTO "Usuario" (nombre, apellido, correo, "contraseña", estado, "fechaRegistro")
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *;
  `, [nombre, apellido, correo, contraseña, estado, fechaRegistro]);
  return result.rows[0];
};

// 🔹 Nuevo: actualizar
exports.update = async ({ idUsuario, nombre, apellido, correo, estado }) => {
  const result = await db.query(`
    UPDATE "Usuario"
    SET nombre = $1,
        apellido = $2,
        correo = $3,
        estado = $4
    WHERE "idUsuario" = $5
    RETURNING *;
  `, [nombre, apellido, correo, estado, idUsuario]);
  return result.rows[0];
};

// 🔹 Nuevo: eliminar
exports.remove = async (idUsuario) => {
  const result = await db.query(`
    DELETE FROM "Usuario"
    WHERE "idUsuario" = $1
    RETURNING *;
  `, [idUsuario]);
  return result.rows[0];
};
