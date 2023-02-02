const express = require('express');
const app = express();

const controller = require('../controllers/permisosController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/permisossistema/:id',verifyToken, controller.selectpermisos);
app.get('/permisossistemaid/:rol/:objeto',verifyToken, controller.SelectPermisoSistem);
app.get('/permisos',verifyToken, controller.Select);
 app.post('/permisos',verifyToken, controller.Insert);
app.put('/permisos',verifyToken, controller.Update);
 app.delete('/permisos',verifyToken, controller.Delete);

module.exports = app;