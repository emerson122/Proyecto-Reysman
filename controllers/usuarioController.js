const { response, request } = require('express')
const db = require('../config/config');
const nodemailer = require('nodemailer');

const Select = (req = request, res=response) => {
    
    let consulta = `SELECT u.*,CONCAT(p.PRIMER_NOMBRE,' ',p.PRIMER_APELLIDO) AS PERSONA,r.NOMBRE_ROL
    FROM TBL_USUARIOS u INNER JOIN TBL_PERSONAS p ON u.COD_PERSONA = p.COD_PERSONA
    inner join TBL_ROLES r on u.COD_ROL = r.COD_ROL`;
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

    let consulta = 'call Insert_Usuario(?,?,?,?,?)';

    let data = req.body;
    console.log(data)

    await db.query(consulta, [data.idpersona,
                              data.rol,
                              data.usuario,
                              data.correo,
                              data.pass], (error, results)=>{

        if (error) {
            return res.json({
                ok: false,
                data: error
            });
        }

        let transporter = nodemailer.createTransport({
            host: "smtp.gmail.com",
            port: 587,
            secure: false, // true for 465, false for other ports
            auth: {
                user: 'inventariosreysman@gmail.com', // generated ethereal user
                pass: 'skthtgfapnvflnbd', // generated ethereal password
            },
        });

        transporter.sendMail({
            from: '"REYSMAN', // sender address
            to: data.correo, // list of receivers
            subject: "Credenciales del sistema", // Subject line
            text: `¡Hola Fulano de tal!
            Te damos la bienvenida a tiendas REYSMAN, nos sentimos orgullosos que seas nuestro colaborador,
            seas mas que bienvenido a este gran equipo.
            A partir de ahora podras ingresar a nuestro plataforma el usuario: y la contraseña temporal: 
            Nota: Se te solicitara cambio de contraseña la primera vez que inicies sesion.
            ¡Saludos del equipo de REYMAN!
            Este es un mensaje automático de Reysman, si recibiste este correo por error por favor elimínalo.`, // plain text body
            html: `<b>Usuario:${data.usuario} ,</b>
               <b>Contraseña: ${data.pass}
               </b>`,
        });

        return res.json({
            ok: true,
            data: results
        });

    });

}

const Update = (req = request, res=response) => {
    let consulta = `UPDATE tbl_usuarios
    SET COD_PERSONA=?,
    COD_ROL=?,
     USUARIO=?,
    EMAIL=?,
    FEC_REGISTRO=?,
    ULT_MODIFICACION=?,
     ESTADO=?
    WHERE COD_USUARIO=?`;

    let data = req.body;
    console.log(data)
    db.query(consulta, [
        data.idpersona,
        data.rol,
        data.usuario,
        data.correo,
        new Date(),
        new Date(),
        data.estado,
        data.id], (error,results)=>{

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

    let consulta = 'DELETE FROM tbl_usuarios WHERE COD_USUARIO=?';
    let id = req.params.id;
    db.query(consulta, [id], (error, results) => {

        console.log(id)
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
