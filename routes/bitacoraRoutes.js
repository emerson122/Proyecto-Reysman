const express = require('express');
const app = express();

const controller = require('../controllers/bitacoraController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/bitacora',verifyToken, controller.Select);
app.post('/bitacora',verifyToken, controller.Insert);


module.exports = app;