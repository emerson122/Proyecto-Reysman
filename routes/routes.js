const express = require('express');
const app = express();

/*
    REVISAR LOS DELETE QUE RESTRICCION TOMAR
*/
app.use(require('./categoriasRoutes'));
app.use(require('./objetosRoutes'));
app.use(require('./preguntasRoutes'));
app.use(require('./clientesRoutes'));
app.use(require('./personaRoutes'));
app.use(require('./loginRoutes'));
app.use(require('./rolesRoutes'));
app.use(require('./bitacoraRoutes'));
app.use(require('./usuariosRoutes'));
app.use(require('./articulosRoutes'));
app.use(require('./permisosRoutes'));
app.use(require('./comprasRoutes'));
app.use(require('./ventasRoutes'));
app.use(require('./proveedoresRoutes'));
app.use(require('./reportesRoutes'));
app.use(require('./parametrosRoutes'));
app.use(require('./recuperacionRoutes'));
app.use(require('./tipoClientesRoutes'));
app.use(require('./inventarioRoutes'));
app.use(require('./BackupRestoreRoutes'));
module.exports = app;