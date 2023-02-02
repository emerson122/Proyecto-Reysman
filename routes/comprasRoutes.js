const express = require('express');
const app = express();

const controller = require('../controllers/comprasController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/compras',verifyToken, controller.Select);
app.get('/comprasdetalles/:id',verifyToken, controller.Selectdetalles);
app.post('/compras',verifyToken, controller.Insert);
app.put('/compras',verifyToken, controller.Update);
app.delete('/compras/:id',verifyToken, controller.Delete);

module.exports = app;