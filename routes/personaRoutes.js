const express = require('express');
const app = express();

const controller = require('../controllers/personaController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/persona',verifyToken, controller.Select);
app.post('/persona',verifyToken, controller.Insert);
app.post('/personauser', controller.InsertUserPersona);
app.put('/persona',verifyToken, controller.Update);
app.delete('/persona/:id',verifyToken,controller.Delete)


module.exports = app;