const express = require('express');
const app = express();

const controller = require('../controllers/inventarioController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/inventario',verifyToken, controller.Select);
app.get('/movimiento',verifyToken, controller.SelectMovimiento);
app.post('/inventario',verifyToken, controller.Insert);
app.put('/inventario',verifyToken,controller.Update);
app.delete('/inventario/:id',verifyToken, controller.Delete);


module.exports = app