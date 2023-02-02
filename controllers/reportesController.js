const { response, request } = require('express')
const db = require('../config/config');


const Selectventasmensuales = (req = request, res=response) => {
    
    let consulta = 'call VENTAS_MENSUALES()';
     db.query(consulta, (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                msg: error
            });
        }
        return res.json({
            ok: true,
            data: results[0]
        });
    });
}

const Selectventasanuales = (req = request, res=response) => {
    
    let consulta = 'call VENTAS_ANUALES()';
     db.query(consulta, (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                msg: error
            });
        }
        return res.json({
            ok: true,
            data: results[0]
        });
    });
}

const Selectusuarios = (req = request, res=response) => {
    
    let consulta = 'select count(*) as cant from tbl_usuarios';
     db.query(consulta, (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                msg: error
            });
        }
        return res.json({
            ok: true,
            data: results
        });
    });
}

const Selectclientes = (req = request, res=response) => {
    
    let consulta = 'select count(*) as cant from tbl_clientes';
     db.query(consulta, (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                msg: error
            });
        }
        return res.json({
            ok: true,
            data: results
        });
    });
}

const Selectpersonas = (req = request, res=response) => {
    
    let consulta = 'select count(*) as cant from tbl_personas';
     db.query(consulta, (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                msg: error
            });
        }
        return res.json({
            ok: true,
            data: results
        });
    });
}

const Selectprovvedores = (req = request, res=response) => {
    
    let consulta = 'select count(*) as cant from tbl_proveedores';
     db.query(consulta, (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                msg: error
            });
        }
        return res.json({
            ok: true,
            data: results
        });
    });
}


module.exports = {

    Selectventasmensuales,
    Selectventasanuales,
    Selectprovvedores,
    Selectusuarios,
    Selectpersonas,
    Selectclientes
  
}
