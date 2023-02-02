const { response, request } = require('express')
const db = require('../config/config');

const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT * FROM TBL_PREGUNTAS';
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

const SelectParam = (req = request, res=response) => {
    
    let consulta = 'call PreguntasLogin()';
     db.query(consulta, (error, results) => {
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

    let consulta = `INSERT INTO tbl_preguntas
    (PREGUNTA, ESTADO) VALUES(?,?)`;

    let data = req.body;

    await db.query(consulta, [data.pregunta,data.estado], (error, results)=>{

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

const InsertPreguntaUsuario = async(req = require, res = response)=>{

    let consulta = `call InsertPreguntasUser(?,?,?)`;

    let data = req.body;

    await db.query(consulta, [data.pregunta,data.usuario,data.respuesta], (error, results)=>{

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

    let consulta = 'CALL UPDATE_PREGUNTAS(?,?,?)';

    let data = req.body;

    db.query(consulta, [data.id,data.pregunta,data.estado], (error,results)=>{

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

    let consulta = 'call DELETE_PREGUNTAS(?)';
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
    SelectParam,
    InsertPreguntaUsuario

}
