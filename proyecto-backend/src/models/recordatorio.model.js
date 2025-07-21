const db = require('../config/db');

// Listar por usuario
exports.findByUsuario = async (idUsuario) => {
    const result = await db.query('SELECT * FROM "Recordatorio" WHERE "idUsuario" = $1', [idUsuario]);
    return result.rows;
};
// Insertar
exports.insert = async ({ idUsuario, fechaLimite, titulo, descripcion, hora }) => {
    const estado = 'Activo';
    const fechaRegistro = new Date().toISOString().split('T')[0];

    const result = await db.query(`
        INSERT INTO "Recordatorio"
        ("idUsuario", "fechaLimite", "titulo", "descripcion", "estado", "fechaRegistro", "hora")
        VALUES ($1, $2, $3, $4, $5, $6, $7)
        RETURNING *;
    `, [idUsuario, fechaLimite, titulo, descripcion, estado, fechaRegistro, hora]);

    return result.rows[0];
};
// Modificar
exports.update = async ({ idRecordatorio, fechaLimite, titulo, descripcion, hora }) => {
    const result = await db.query(`
        UPDATE "Recordatorio"
        SET "fechaLimite" = $1,
            "titulo" = $2,
            "descripcion" = $3,
            "hora" = $4
        WHERE "idRecordatorio" = $5
        RETURNING *;
    `, [fechaLimite, titulo, descripcion, hora, idRecordatorio]);

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