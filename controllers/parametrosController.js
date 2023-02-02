const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'select * from tbl_parametros';
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

    let consulta = 'insert into tbl_parametros (PARAMETRO,VALOR) values(?,?)';
    let date = new Date();
    let data = req.body;

    await db.query(consulta, [data.parametro,data.valor], (error, results)=>{

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

    let consulta = 'update tbl_parametros set PARAMETRO = ?, VALOR = ? where ID_PARAMETRO = ?';

    let data = req.body;
    let date = new Date();

    db.query(consulta, [data.parametro,data.valor,data.id], (error,results)=>{

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

    let consulta = 'delete from tbl_parametros where ID_PARAMETRO = ?'
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
    Delete
}
