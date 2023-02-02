const { response, request } = require('express')
const db = require('../config/config');
const { destrucdata } = require('../helpers/helpers');


const Select = (req = request, res = response) => {

    let consulta = 'select * from tbl_permisos pp inner join tbl_objetos po on pp.COD_OBJETO  = po.COD_OBJETO INNER JOIN TBL_ROLES tr on pp.COD_ROL = tr.COD_ROL';
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


const SelectPermisoSistem = (req = request, res = response) => {

    let consulta = 'select * from tbl_permisos where COD_ROL = ? and COD_OBJETO = ?';
    let data = req.params;

    console.log(data)
    db.query(consulta,[data.rol,data.objeto] ,(error, results) => {

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

//select * from tbl_permisos tp where COD_ROL = 1 and COD_OBJETO = 1

const selectpermisos = (req = request, res = response) => {
    let consulta = "select s.* from tbl_objetos s inner join tbl_permisos tp2 on s.COD_OBJETO = tp2.COD_OBJETO where tp2.CONSULTAR = 'SI' and tp2.COD_ROL = ?";
    let id = req.params.id; 
    db.query(consulta,[id], (error, results) => {
        let menus = [];
        const data = Object.values(JSON.parse(JSON.stringify(results)))
        console.log(data)
        let m = 0;
        for (let i = 0; i < data.length; i++) {
            menus.push({
                CODOBJETO: data[i].COD_OBJETO,
                NOMOBJETO: data[i].OBJETO,
                ICONO: data[i].ICONO,
                URL: data[i].URL,
                ID_PADRE: data[i].ID_PADRE,
                hijos: []
            }
            );

            for (let j = 0; j < data.length; j++) {
                if (data[i].COD_OBJETO == data[j].ID_PADRE) {
                    menus[m].hijos.push(data[j]);
                }
            }
            m++;
        }





        return res.json({
            ok: true,
            data: menus
        });
    });
}

const Insert = async (req = require, res = response) => {

    let consulta = `INSERT INTO tbl_permisos(COD_ROL,COD_OBJETO,INSERTAR,ACTUALIZAR,CONSULTAR,ELIMINAR)VALUES(?,?,?,?,?,?)`;

    let data = req.body;

    await db.query(consulta, [data.rol,data.objeto,data.insertar,data.actualizar,data.consultar,data.eliminar], (error, results) => {

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

    let consulta = `UPDATE TBL_PERMISOS SET COD_ROL=?, COD_OBJETO=?, INSERTAR=?, ACTUALIZAR=?, CONSULTAR=?, ELIMINAR=? WHERE COD_PERMISO=?`;

    let data = req.body;

    db.query(consulta, [data.rol,data.objeto,data.insertar,data.actualizar,data.consultar,data.eliminar,data.permiso], (error, results) => {

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

    let consulta = 'CALL DLELETE_PERMISOS(?,?)';
    let data = req.body;
    console.log(data)
    db.query(consulta, [data.idrol,data.idobjeto], (error, results) => {

        if (error) return res.json({ ok: false, data: error });

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
    selectpermisos,
    SelectPermisoSistem
}
