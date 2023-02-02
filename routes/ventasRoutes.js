const express = require('express');
const app = express();

const controller = require('../controllers/ventasController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/ventas',verifyToken, controller.Select);
app.get('/ventasdetalles/:id', controller.Selectdetalles);
app.post('/ventas',verifyToken, controller.Insert);
app.put('/ventas',verifyToken,controller.Update);
app.delete('/ventas/:id', verifyToken,controller.Delete);


module.exports = app