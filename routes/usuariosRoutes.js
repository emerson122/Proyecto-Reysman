const express = require('express');
const app = express();

const controller = require('../controllers/usuarioController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/usuario',verifyToken, controller.Select);
app.post('/usuario',verifyToken, controller.Insert);
app.put('/usuario',verifyToken, controller.Update);
app.delete('/usuario/:id',verifyToken, controller.Delete);


module.exports = app