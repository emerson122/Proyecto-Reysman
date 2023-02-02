const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT tc.*,tp.NOMBRE_PROVEEDOR,tp2.DNI FROM TBL_COMPRAS tc INNER JOIN TBL_PROVEEDORES tp ON tc.COD_PROVEEDOR = tp.COD_PROVEEDOR inner join tbl_personas tp2 on tp.COD_PERSONA = tp2.COD_PERSONA';
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
    
    let consulta = 'select * from tbl_detalles_compra tdc inner join tbl_articulos ta on tdc.COD_ARTICULO = ta.COD_ARTICULO where tdc.COD_COMPRA = ?';
    let id = req.params.id
    console.log(id)
     db.query(consulta,[id], (error, results) => {
console.log(error)
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

    let consulta = 'call INSERTAR_COMPRA(?,?,?,?,?)';

    let data = req.body;

    await db.query(consulta, [data.codproveedor,data.total,JSON.stringify(data.productos),data.user,data.isv], (error, results)=>{

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

    let consulta = 'call DELETE_COMPRA(?)';
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
