const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'select tv.*,tp.PRIMER_NOMBRE,tp.DNI from TBL_VENTAS tv inner join TBL_CLIENTES tc on tv.COD_CLIENTE = tc.COD_CLIENTE inner join TBL_PERSONAS tp on tc.COD_PERSONA = tp.COD_PERSONA';
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


const Selectdetalles = (req = request, res=response) => {
    
    let consulta = 'CALL SELECT_DETALLES(?)';
    let id = req.params.id
     db.query(consulta,[id], (error, results) => {

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
const Insert = async(req = require, res = response)=>{

    let consulta = 'CALL INSERT_VENTAS(?,?,?,?,?,?)';

    let data = req.body;

    console.log(data)
    await db.query(consulta, [data.codcliente,data.subtotal,data.total,JSON.stringify(data.productos),data.user,data.isv], (error, results)=>{

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




const Update = (req = request, res=response) => {

    let consulta = 'call UPDATE_CUENTA(?,?,?)';

    let data = req.body;

    db.query(consulta, [data.id,data.socio,data.saldo], (error,results)=>{

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

    let consulta = 'call DELETE_VENTAS(?)';
   // let id = req.body.id;
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
    Delete,
    Selectdetalles
}
