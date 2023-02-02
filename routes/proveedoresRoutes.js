const express = require('express');
const app = express();

const controller = require('../controllers/proveedoresController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/proveedores',verifyToken, controller.Select);
app.post('/proveedores',verifyToken, controller.Insert);
app.put('/proveedores',verifyToken, controller.Update);
app.delete('/proveedores/:id',verifyToken, controller.Delete);

module.exports = app;