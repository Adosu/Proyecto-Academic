const express = require('express');
const cors = require('cors');
require('./config/dotenv');
const jwt = require('jsonwebtoken');

const authRoutes = require('./routes/auth.routes');
const usuarioRoutes = require('./routes/usuario.routes')
const recordatorioRoutes = require('./routes/recordatorio.routes');
const materiaRoutes = require('./routes/materia.routes');
const apunteRoutes = require('./routes/apunte.routes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api/usuarios', usuarioRoutes)
app.use('/api/recordatorios', recordatorioRoutes);
app.use('/api/materias', materiaRoutes);
app.use('/api/apuntes', apunteRoutes);

module.exports = app;
