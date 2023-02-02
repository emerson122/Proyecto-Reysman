const jwt = require('jsonwebtoken');


const verifyToken = (req, res, next) => {

    let token = req.headers['authorization'].split(' ')[1];
    token = token.replace(/['"]+/g, '');
    jwt.verify(token, 'holamundo1234', (err, decoded) => {
        console.log(err)
        if (err) {
            return res.status(401).json({
                ok: false,
                err: {
                    message: 'Token no valido'
                }
            });
        }
        req.usuario = decoded.usuario;
        next();
    }
    );
}

module.exports = { verifyToken }