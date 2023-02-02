const { response, request } = require('express')
const db = require('../config/config');

const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT COD_PERSONA, PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, DNI, FEC_NACIMIENTO, EST_CIVIL, SEXO, TELEFONO, DIREECION FROM TBL_PERSONAS';
     db.query(consulta, (error, results) => {
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


const Insert = async(req = require, res = response)=>{

    let consulta = `INSERT INTO TBL_PERSONAS (PRIMER_NOMBRE, SEGUNDO_NOMBRE, PRIMER_APELLIDO, SEGUNDO_APELLIDO, DNI, FEC_NACIMIENTO, EST_CIVIL, SEXO, TELEFONO, DIREECION)
    VALUES(upper(?),upper(?),upper(?),upper(?),?,?,?,?,?,upper(?))`;

    let data = req.body;

    await db.query(consulta, [data.primern,data.segudon,data.primera,data.segundoa,data.dni,data.nacimiento,data.estado,data.sexo,data.telefono,data.direccion], (error, results)=>{

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

const InsertUserPersona = async(req = require, res = response)=>{

    let consulta = `call RegistroUsuario(?,?,?,?,?,?,?,?,?,?,?,?,?)`;

    let data = req.body;

    await db.query(consulta, [
    data.PRIMER_NOMBRE,
    data.SEGUNDO_NOMBRE,
data.PRIMER_APELLIDO,
data.SEGUNDO_APELLIDO,
data.DNI,
data.FEC_NACIMIENTO,
data.EST_CIVIL,
data.SEXO,
data.TELEFONO,
data.DIREECION,
data.USUARIO,
data.EMAIL,
data.CONTRASEÑA], (error, results)=>{

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

    let consulta = 'UPDATE TBL_PERSONAS SET PRIMER_NOMBRE=?, SEGUNDO_NOMBRE=?, PRIMER_APELLIDO=?, SEGUNDO_APELLIDO=?, DNI=?, FEC_NACIMIENTO=?, EST_CIVIL=?, SEXO=?, TELEFONO=?, DIREECION=?  WHERE COD_PERSONA=?';

    let data = req.body;

    db.query(consulta, [data.primern,data.segudon,data.primera,data.segundoa,data.dni,data.nacimiento,data.estado,data.sexo,data.telefono,data.direccion,data.id], (error,results)=>{

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

const Delete = (req = request, res=response) => {

    let consulta = 'CALL eliminarPersonas(?)';

    let id = req.params.id;

    db.query(consulta, [id], (error,results)=>{

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



module.exports = {

    Select,
    Insert,
    Update,
    Delete,
    InsertUserPersona
   

}
