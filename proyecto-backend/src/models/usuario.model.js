const db = require('../config/db');

// Buscar por correo
exports.findByCorreo = async (correo) => {
  const result = await db.query('SELECT * FROM "Usuario" WHERE correo = $1', [correo]);
  return result.rows[0];
};

// Buscar por ID
exports.findById = async (idUsuario) => {
  const result = await db.query(
    'SELECT "idUsuario", nombre, apellido, correo, contrasena FROM "Usuario" WHERE "idUsuario" = $1',
    [idUsuario]
  );
  return result.rows[0];
};

// Insertar usuario
exports.insert = async ({ nombre, apellido, correo, contrasena, estado, fechaRegistro }) => {
  const result = await db.query(`
    INSERT INTO "Usuario" (nombre, apellido, correo, contrasena, estado, "fechaRegistro")
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING *;
  `, [nombre, apellido, correo, contrasena, estado, fechaRegistro]);
  return result.rows[0];
};

// Modificar usuario (autenticado)
exports.update = async ({ idUsuario, nombre, apellido, correo, contrasena, estado }) => {
  const result = await db.query(`
    UPDATE "Usuario"
    SET nombre = $1,
        apellido = $2,
        correo = $3,
        contrasena = $4,
        estado = $5
    WHERE "idUsuario" = $6
    RETURNING *;
  `, [nombre, apellido, correo, contrasena, estado, idUsuario]);
  return result.rows[0];
};

// Eliminar usuario (por cascada)
exports.remove = async (idUsuario) => {
  const result = await db.query(`
    DELETE FROM "Usuario"
    WHERE "idUsuario" = $1
    RETURNING *;
  `, [idUsuario]);
  return result.rows[0];
};
