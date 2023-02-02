const express = require('express');
const app = express();

const controller = require('../controllers/articulosController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/articulos',verifyToken, controller.Select);
app.get('/articulosid/:id',verifyToken, controller.Selectid);
app.post('/articulos',verifyToken, controller.Insert);
app.put('/articulos',verifyToken, controller.Update);
app.delete('/articulos/:id',verifyToken, controller.Delete);

module.exports = app;