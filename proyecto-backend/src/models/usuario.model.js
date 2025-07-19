const db = require('../config/db');

exports.findByCorreo = async (correo) => {
    const result = await db.query('SELECT * FROM "Usuario" WHERE correo = $1', [correo]);
    return result.rows[0];
};