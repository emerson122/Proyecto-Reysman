const express = require('express');
const app = express();

const controller = require('../controllers/clientesController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/clientes',verifyToken,controller.Select);
app.post('/clientes',verifyToken, controller.Insert);
app.put('/clientes',verifyToken,controller.Update);
app.delete('/clientes/:id',verifyToken, controller.Delete);

module.exports = app;