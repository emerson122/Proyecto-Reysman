const { request } = require("express");

const express = require('express');
const app = express();

const b = require('../controllers/BackupRestoreController');

app.get('/bacselect', b.Select);
app.get('/restore', b.restore);
app.post('/backup', b.backup);



module.exports = app;