const express = require('express');
const app = express();

const controller = require('../controllers/categoriasController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/categorias',verifyToken, controller.Select);
app.post('/categorias',verifyToken, controller.Insert);
app.put('/categorias',verifyToken, controller.Update);
app.delete('/categorias/:id',verifyToken, controller.Delete);

module.exports = app;