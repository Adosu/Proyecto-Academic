const db = require('../config/db');

// Listar materias activas
exports.findAllActivas = async () => {
    const result = await db.query(`
        SELECT "idMateria", "nombreMateria", "cursoParalelo", "nombreDocente", horario
        FROM "Materia"
        WHERE estado = 'Activo'
        ORDER BY "nombreMateria"
    `);
    return result.rows;
};

// Obtener clave de materia
exports.getClave = async (idMateria) => {
    const result = await db.query(
        `SELECT clave FROM "Materia" WHERE "idMateria" = $1`,
        [idMateria]
    );
    return result.rows[0]?.clave;
};

// Verificar si usuario ya está inscrito
exports.yaInscrito = async (idUsuario, idMateria) => {
    const result = await db.query(`
        SELECT 1 FROM "UsuarioMateria"
        WHERE "idUsuario" = $1 AND "idMateria" = $2 AND estado = 'Activo'
    `, [idUsuario, idMateria]);
    return result.rowCount > 0;
};

// Insertar inscripción
exports.inscribir = async (idUsuario, idMateria) => {
    const result = await db.query(`
        INSERT INTO "UsuarioMateria" ("idUsuario", "idMateria", estado, "fechaRegistro")
        VALUES ($1, $2, 'Activo', CURRENT_DATE)
        RETURNING *;
    `, [idUsuario, idMateria]);
    return result.rows[0];
};

exports.findByUsuario = async (idUsuario) => {
  const result = await db.query(`
    SELECT m."idMateria", m."nombreMateria", m."cursoParalelo", m."nombreDocente", m."imagenUrl"
    FROM "UsuarioMateria" um
    JOIN "Materia" m ON um."idMateria" = m."idMateria"
    WHERE um."idUsuario" = $1 AND um.estado = 'Activo'
    ORDER BY m."nombreMateria"
  `, [idUsuario]);
  return result.rows;
};

