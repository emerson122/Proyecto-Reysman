const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT * FROM TBL_ROLES;';
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

    let consulta = `insert into TBL_ROLES(NOMBRE_ROL,FEC_REGISTRO) values (?,?)`;

    let data = req.body;

    await db.query(consulta, [data.rol,new Date()], (error, results)=>{

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

    let consulta = 'UPDATE TBL_ROLES SET NOMBRE_ROL=?, ULT_MODIFICACION=? WHERE COD_ROL = ?';

    let data = req.body;

    db.query(consulta, [data.rol,new Date(),data.id], (error,results)=>{

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

    let consulta = 'DELETE FROM tbl_roles WHERE COD_ROL=?';
    let id = req.params.id;

    db.query(consulta, [id], (error, results) => {

        if (error) return res.json({ ok:false, data: error });

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
