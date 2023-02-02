const express = require('express');
const app = express();

const controller = require('../controllers/preguntasController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/preguntas',controller.Select);
app.get('/preguntasParam', verifyToken,controller.SelectParam);
app.post('/preguntas',verifyToken, controller.Insert);
app.post('/preguntasUser',verifyToken, controller.InsertPreguntaUsuario);
app.put('/preguntas',verifyToken, controller.Update);
app.delete('/preguntas/:id',verifyToken, controller.Delete);


module.exports = app