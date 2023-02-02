const express = require('express');
const app = express();

const controller = require('../controllers/recuperacionController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.post('/recupreguntas', controller.Recupreguntas);
app.post('/recuperacioncorreo', controller.recuperacioncorreo);
// app.put('/proveedores',verifyToken, controller.Update);
// app.delete('/proveedores/:id',verifyToken, controller.Delete);

module.exports = app;