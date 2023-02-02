const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT * FROM tbl_cat_articulos';
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

    let consulta = `INSERT INTO tbl_cat_articulos
    (NOM_CATEGORIA, DESCRIPCION, FEC_REGISTRO)
    VALUES(?,?,?)`;

    let data = req.body;
    let date = new Date();

    await db.query(consulta, [data.categoria,data.descripcion,new Date()], (error, results)=>{

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

    let consulta = `UPDATE tbl_cat_articulos
    SET NOM_CATEGORIA=upper(?), DESCRIPCION=upper(?), ULT_REGISTRO=?
    WHERE COD_CATEGORIA=?`;

    let data = req.body;
    let date = new Date();
    db.query(consulta, [data.categoria,data.descripcion,date,data.id], (error,results)=>{

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

    let consulta = 'DELETE FROM tbl_cat_articulos WHERE COD_CATEGORIA=?';
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
