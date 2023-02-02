const { response, request } = require('express')
const db = require('../config/config');
const { desects } = require('../helpers/helpers');



const Recupreguntas = async (req = require, res = response) => {

    let consulta = `call RecuConfigPreguntas(?,?,?)`;

    let data = req.body;

    await db.query(consulta, [data.pregunta, data.respuesta, data.usuario], (error, results) => {

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


const recuperacioncorreo = async (req = require, res = response) => {

    let consulta = `call RecuCorreoElectronico(?)`;

    let data = req.body;
//regresaar el usuario 
    await db.query(consulta, [data.correo], (error, results) => {

        if (error) {
            return res.json({
                ok: false,
                data: error
            });
        }

        let { codigo } = desects(results);


        if (codigo == 0) {
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
                subject: "Recuperacion contraseña", // Subject line
                text: "Usted ha olvidad su  contraseña!", // plain text body
                html: `<b>Usuario:${data.USUARIO} ,</b>
                  <b>Contraseña: ${data.CONTRASENA}
                  </b>`,
            });
        }



        return res.json({
            ok: true,
            data: results[0]
        });

    });

}



const Update = (req = request, res = response) => {

    let consulta = 'UPDATE TBL_ROLES SET NOMBRE_ROL=?, ULT_MODIFICACION=? WHERE COD_ROL = ?';

    let data = req.body;

    db.query(consulta, [data.rol, new Date(), data.id], (error, results) => {

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


module.exports = {

    Recupreguntas,
    Update,
    recuperacioncorreo

}
