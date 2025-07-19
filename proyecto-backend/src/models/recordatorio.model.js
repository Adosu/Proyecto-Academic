const db = require('../config/db');

// Listar por usuario
exports.findByUsuario = async (idUsuario) => {
    const result = await db.query('SELECT * FROM "Recordatorio" WHERE "idUsuario" = $1', [idUsuario]);
    return result.rows;
};
// Insertar
exports.insert = async ({ idUsuario, fechaLimite, titulo, descripcion, prioridad, estado, fechaRegistro, hora }) => {
    const result = await db.query(`
        INSERT INTO "Recordatorio"
        ("idUsuario", "fechaLimite", "titulo", "descripcion", "prioridad", "estado", "fechaRegistro", "hora")
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
        RETURNING *;
    `, [idUsuario, fechaLimite, titulo, descripcion, prioridad, estado, fechaRegistro, hora]);
    return result.rows[0];
};
// Modificar
exports.update = async ({ idRecordatorio, fechaLimite, titulo, descripcion, prioridad, estado, fechaRegistro, hora }) => {
    const result = await db.query(`
        UPDATE "Recordatorio"
        SET "fechaLimite" = $1,
            "titulo" = $2,
            "descripcion" = $3,
            "prioridad" = $4,
            "estado" = $5,
            "fechaRegistro" = $6,
            "hora" = $7
        WHERE "idRecordatorio" = $8
        RETURNING *;
    `, [fechaLimite, titulo, descripcion, prioridad, estado, fechaRegistro, hora, idRecordatorio]);
    return result.rows[0];
};
// Eliminar
exports.remove = async (idRecordatorio) => {
    const result = await db.query(`
        DELETE FROM "Recordatorio"
        WHERE "idRecordatorio" = $1
        RETURNING *;
    `, [idRecordatorio]);
    return result.rows[0];
};