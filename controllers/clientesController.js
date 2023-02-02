const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'select * from tbl_clientes tc inner join tbl_personas tp on tc.COD_PERSONA = tp.COD_PERSONA inner join tbl_tipo_clientes ttc on tc.COD_TIPO_CLIENTE = ttc.COD_TIPO_CLIENTE';
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

    let consulta = 'INSERT INTO tbl_clientes (COD_PERSONA, COD_TIPO_CLIENTE) VALUES(?,?)';
    let date = new Date();
    let data = req.body;

    await db.query(consulta, [data.persona,data.tipocliente], (error, results)=>{

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

    let consulta = `UPDATE tbl_clientes SET COD_PERSONA=?, COD_TIPO_CLIENTE=?, FEC_REGISTRO=?, ULT_MODIFICACION=? WHERE COD_CLIENTE=?`;
    
    let data = req.body;
    let date = new Date();
    console.log(data)
    console.log('hola mundi')
    db.query(consulta, [data.persona,data.tipocliente,date,date,data.id], (error,results)=>{

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
const Delete = (req=request,res=response) =>{

    let consulta = 'DELETE FROM tbl_clientes WHERE COD_CLIENTE=?';
       let id = req.params.id;
    db.query(consulta, [id], (error, results) => {

        if (error)  return res.json({ ok:false, data: error });

        return res.json({
            ok: true,
            data: results[0]

        });
    });
}

module.exports = {

    Select,
    Insert,
    Update,
    Delete
}
