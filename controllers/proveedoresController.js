const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res = response) => {

    let consulta = 'select * from TBL_PROVEEDORES tp4 inner join TBL_PERSONAS tp5 on tp4.COD_PERSONA = tp5.COD_PERSONA';
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

const Insert = async (req = require, res = response) => {

    let consulta = `INSERT INTO tbl_proveedores
    (COD_PERSONA, NOMBRE_PROVEEDOR, NOMBRE_CONTACTO)
    VALUES(upper(?),upper(?),upper(?))`;
    let data = req.body;
    let date = new Date();
    await db.query(consulta, [data.persona, data.proveedor, data.contacto], (error, results) => {

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




const Update = (req = request, res = response) => {

    let consulta = `UPDATE tbl_proveedores
    SET COD_PERSONA=?,NOMBRE_PROVEEDOR=upper(?),NOMBRE_CONTACTO=upper(?),FEC_REGISTRO=?,ULT_MODIFICACION=?
    WHERE COD_PROVEEDOR=?`;

    let data = req.body;
    let date = new Date();
    db.query(consulta, [data.persona, data.proveedor, data.contacto, date, date, data.id], (error, results) => {

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


const Delete = (req = request, res = response) => {

    let consulta = `DELETE FROM tbl_proveedores WHERE COD_PROVEEDOR=?`;
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
