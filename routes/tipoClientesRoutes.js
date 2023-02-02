const express = require('express');
const app = express();

const controller = require('../controllers/tipoClientesController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/tipoclientes',verifyToken, controller.Select);
app.post('/tipoclientes',verifyToken, controller.Insert);
app.put('/tipoclientes',verifyToken, controller.Update);
app.delete('/tipoclientes/:id',verifyToken, controller.Delete);

module.exports = app;