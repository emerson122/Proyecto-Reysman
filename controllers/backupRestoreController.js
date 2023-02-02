const { response, request } = require('express')
const mysqldump = require('mysqldump');
const db = require('../config/config')


const Select = (req = request, res=response) => {
    
    let consulta = 'SELECT * FROM tbl_backup';
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

const restore = async (req = request, res = response) => {

    const ruta = `b45qckupp.sql`

    //await db.query(``,(errors, result) => {


 await  require('mysql-import').config({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'reysmandb1',
        onerror: err=>console.log(err.message)
    }).import('./backup/5-12-2022-Backup.sql').then(()=> {
        console.log('all statements have been executed')
    });
    // await mysqldump({
    //     connection: {
    //         host: 'localhost',
    //         user: 'root',
    //         password: '',
    //         database: 'reysmandb'
    //     },
    //     dumpToFile: `./${ruta}`
    // });

    return res.json({
        ok: true
    });


}

//Crear datos de bitacora (insert)
const backup = async (req = require, res = response) => {

    //backup 12/12-12
    const fecha = new Date().toLocaleDateString();
    const nuevafecha = fecha.replaceAll("/", "-");
    const ruta = `backup/${nuevafecha}-Backup.sql`
    const data = await mysqldump({
        connection: {
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'reysmandb'
        },
        dumpToFile: `./${ruta}`,

    });

    await db.query(`INSERT INTO tbl_backup(NOMBRE,USUARIO_REGISTRO,FECHA_REGISTRO) values ('${ruta}','${req.body.nombre}',sysdate())`,(errors, result) => {

       if (errors) return res.json({ok:false, msg:errors});

        return res.json({
            ok : true, 
            msg: result
        });

     })


}

module.exports = {
    restore,
    backup,
    Select
}