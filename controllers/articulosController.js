const { response, request } = require('express')
const db = require('../config/config');


const Select = (req = request, res = response) => {

    let consulta = 'select * from tbl_cat_articulos tca inner join tbl_articulos ta on tca.COD_CATEGORIA = ta.COD_CATEGORIA';
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

const Selectid = (req = request, res = response) => {

    let consulta = 'SELECT * from TBL_ARTICULOS a  left join tbl_inventario ti on a.COD_ARTICULO = ti.COD_ARTICULO where a.COD_ARTICULO = ?';
    let id = req.params.id;
    console.log(id)
    db.query(consulta, [id], (error, results) => {

        console.log(results)
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

    let consulta = `INSERT INTO tbl_articulos
    (COD_CATEGORIA,NOM_ART, PREC_COMPRA, PREC_VENTA, DESCRIPCION, ESTADO)
    VALUES(?,?,?,?,?,?)`;

    let data = req.body;
    let date = new Date();
    await db.query(consulta, [data.categoria, data.articulo, data.pcompras, data.pventas, data.descripcion,1], (error, results) => {

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

    let consulta = `UPDATE tbl_articulos SET COD_CATEGORIA=?, NOM_ART=?, PREC_COMPRA=?, PREC_VENTA=?, DESCRIPCION=?, 
                    ESTADO=? WHERE COD_ARTICULO=?`;

    let data = req.body;
let date = new Date();
    db.query(consulta, [data.categoria, data.articulo, data.pcompras, data.pventas, data.descripcion,1,data.id], (error, results) => {

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
const Delete = (req = request, res = response) => {

    let consulta = `DELETE FROM tbl_articulos WHERE COD_ARTICULO=?`;
    let id = req.params.id;
    console.log(id)


    db.query(consulta, [id], (error, results) => {

        if (error) return res.json({ ok:false, data: error });

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
    Selectid
}
