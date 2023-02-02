const { response, request } = require('express')
const db = require('../config/config');

const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT * FROM tbl_tipo_clientes';
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

    let consulta = `INSERT INTO tbl_tipo_clientes (TIPO_CLIENTE, REBAJA) VALUES(?,?)`;

    let data = req.body;

    await db.query(consulta, [data.tipo,data.rebaja], (error, results)=>{

        if (error) {
            return res.json({
                ok: false,
                data: error
            });
        }
        return res.json({
            ok: true,
            data: results
        });

    });

}


const Update = (req = request, res=response) => {

    let consulta = `UPDATE tbl_tipo_clientes SET TIPO_CLIENTE=?, REBAJA=? WHERE COD_TIPO_CLIENTE=?`;

    let data = req.body;

    db.query(consulta, [data.tipo,data.rebaja,data.id], (error,results)=>{

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

const Delete = (req=request,res=response) =>{

    let consulta = 'DELETE FROM tbl_tipo_clientes  WHERE COD_TIPO_CLIENTE=?';
    let id = req.params.id;

    db.query(consulta, [id], (error, results) => {

        if (error)  return res.json({ ok:false, data: error });

        return res.json({
            ok: true,
            data: results
        });
    });
}

module.exports = {

    Select,
    Insert,
    Update,
    Delete,

    

}
