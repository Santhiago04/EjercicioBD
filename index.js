// Conexión a la DB de Mongo
const express = require('express');
const mongoose = require('mongoose');

const app = express();
const PORT = 3000;

// Crear el cuerpo de las peticiones(Middleware)
app.use(express.json());

// Conexión con la base de datos
mongoose.connect('mongodb://localhost:27017//MONGODB', {
    useNewURLParser: true,
    useUnifiedTopology: true
}).then(() => console.log('Conexión exitosa'))
.catch(err => console.log('No conectado error:',err));

// Iniciar servidor
app.listen(PORT, () => {
    console.log('Servidor ejecutándose sobre el puerto: ${PORT}')
});