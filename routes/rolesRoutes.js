const express = require('express');
const app = express();

const controller = require('../controllers/rolesController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/roles',verifyToken, controller.Select);
app.post('/roles',verifyToken, controller.Insert);
app.put('/roles',verifyToken, controller.Update);
app.delete('/roles/:id',verifyToken, controller.Delete);

module.exports = app;