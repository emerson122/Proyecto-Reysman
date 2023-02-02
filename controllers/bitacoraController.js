const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'select b.*,tu.USUARIO  from TBL_BITACORA b inner join TBL_USUARIOS tu on b.COD_USUARIO = tu.COD_USUARIO ORDER BY b.COD_BITACORA DESC';
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

const Insert = async(req = require, res = response)=>{

    let consulta = 'INSERT into TBL_BITACORA(ACCION,FECHA,COD_USUARIO,TABLA_MODIFICADA) VALUES(?,?,?,?)';

    let data = req.body;

    await db.query(consulta, [data.operacion,data.fecha,data.idusuario,data.tabla], (error, results)=>{

        if (error) {
            return res.json({
                ok: false,
                data: error
            });
        }
        return res.json({
            ok: true,
            data: results[0]
        });

    });

}

const Update = async(req = require, res = response)=>{

    let consulta = 'INSERT into TBL_BITACORA(ACCION,FECHA,COD_USUARIO,TABLA_MODIFICADA) VALUES(?,?,?,?)';

    let data = req.body;

    await db.query(consulta, [data.operacion,data.fecha,data.idusuario,data.tabla], (error, results)=>{

        if (error) {
            return res.json({
                ok: false,
                data: error
            });
        }
        return res.json({
            ok: true,
            data: results[0]
        });

    });

}





module.exports = {

    Select,
    Insert
}
