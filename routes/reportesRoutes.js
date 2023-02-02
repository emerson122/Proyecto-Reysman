const express = require('express');
const app = express();

const controller = require('../controllers/reportesController');
const {verifyToken} = require('../middlewares/verifiyToken');

app.get('/rusuarios',verifyToken, controller.Selectusuarios);
app.get('/rpersona',verifyToken, controller.Selectpersonas);
app.get('/rclientes',verifyToken, controller.Selectclientes);
app.get('/rproveedores',verifyToken, controller.Selectprovvedores);
app.get('/rmensuales',verifyToken, controller.Selectventasmensuales);
app.get('/ranuales',verifyToken, controller.Selectventasanuales);
module.exports = app;