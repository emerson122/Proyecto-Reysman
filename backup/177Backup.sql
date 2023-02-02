/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_articulos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_articulos` (
  `COD_ARTICULO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_CATEGORIA` int(11) NOT NULL COMMENT 'FK',
  `NOM_ART` varchar(45) NOT NULL,
  `PREC_COMPRA` decimal(10, 0) DEFAULT NULL,
  `PREC_VENTA` decimal(10, 0) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `ESTADO` int(11) NOT NULL,
  `FEC_MODIFICACION` datetime NOT NULL,
  `ULT_MODIFICACION` datetime NOT NULL,
  PRIMARY KEY (`COD_ARTICULO`),
  KEY `COD_CATEGORIA_idx` (`COD_CATEGORIA`),
  CONSTRAINT `COD_CATEGORIA` FOREIGN KEY (`COD_CATEGORIA`) REFERENCES `tbl_cat_articulos` (`COD_CATEGORIA`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_backup
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_backup` (
  `COD_BACKUP` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(200) DEFAULT NULL,
  `USUARIO_REGISTRO` int(11) DEFAULT NULL,
  `FECHA_REGISTRO` date DEFAULT NULL,
  PRIMARY KEY (`COD_BACKUP`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_bitacora
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_bitacora` (
  `COD_BITACORA` int(11) NOT NULL AUTO_INCREMENT,
  `ACCION` varchar(100) DEFAULT NULL,
  `FECHA` varchar(100) DEFAULT NULL,
  `COD_USUARIO` int(11) DEFAULT NULL,
  `TABLA_MODIFICADA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COD_BITACORA`)
) ENGINE = InnoDB AUTO_INCREMENT = 3193 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_cat_articulos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_cat_articulos` (
  `COD_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_CATEGORIA` varchar(45) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_REGISTRO` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_CATEGORIA`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_clientes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_clientes` (
  `COD_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `COD_PERSONA` int(11) NOT NULL,
  `COD_TIPO_CLIENTE` int(11) DEFAULT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_CLIENTE`),
  KEY `FK_TB_Clientes_TB_PERSONAS_idx` (`COD_PERSONA`),
  KEY `tbl_clientes_FK` (`COD_TIPO_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_PERSONA` FOREIGN KEY (`COD_PERSONA`) REFERENCES `tbl_personas` (`COD_PERSONA`),
  CONSTRAINT `tbl_clientes_FK` FOREIGN KEY (`COD_TIPO_CLIENTE`) REFERENCES `tbl_tipo_clientes` (`COD_TIPO_CLIENTE`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_compras
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_compras` (
  `COD_COMPRA` int(11) NOT NULL AUTO_INCREMENT,
  `COD_PROVEEDOR` int(11) NOT NULL,
  `NUM_FACTURA` int(11) DEFAULT NULL,
  `FECHA` date NOT NULL,
  `COD_MET_PAGO` int(11) DEFAULT NULL,
  `TOT_COMPRA` int(11) DEFAULT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_COMPRA`),
  KEY `FK_COMPR_PROVEEDOR_idx` (`COD_PROVEEDOR`),
  KEY `FK_METODO_PAGO_idx` (`COD_MET_PAGO`),
  CONSTRAINT `tbl_compras_FK` FOREIGN KEY (`COD_PROVEEDOR`) REFERENCES `tbl_proveedores` (`COD_PROVEEDOR`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_detalles_compra
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_detalles_compra` (
  `COD_DETALLE_COMPRA` int(11) NOT NULL AUTO_INCREMENT,
  `COD_COMPRA` int(11) DEFAULT NULL,
  `COD_ARTICULO` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `PREC_COMPRA` decimal(10, 0) DEFAULT NULL,
  `TOTAL` decimal(10, 0) DEFAULT NULL,
  `FEC_REGISTRO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COD_DETALLE_COMPRA`),
  KEY `TBL_DETALLES_COMPRA_FK` (`COD_ARTICULO`),
  KEY `TBL_DETALLES_COMPRA_FK_1` (`COD_COMPRA`),
  CONSTRAINT `tbl_detalles_compra_FK` FOREIGN KEY (`COD_COMPRA`) REFERENCES `tbl_compras` (`COD_COMPRA`),
  CONSTRAINT `tbl_detalles_compra_FK_1` FOREIGN KEY (`COD_ARTICULO`) REFERENCES `tbl_articulos` (`COD_ARTICULO`)
) ENGINE = InnoDB AUTO_INCREMENT = 30 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_detalles_venta
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_detalles_venta` (
  `COD_DETALLE_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `COD_VENTA` int(11) NOT NULL,
  `COD_ARTICULO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PREC_VENTA` decimal(10, 0) NOT NULL,
  `TOTAL` decimal(10, 2) NOT NULL,
  `DESCUENTO` decimal(10, 0) NOT NULL,
  `FEC_REGISTRO` datetime NOT NULL,
  `ULT_MODIFICACION` datetime NOT NULL,
  PRIMARY KEY (`COD_DETALLE_VENTA`),
  KEY `FK_DETALLES_VENTA_VENTAS_idx` (`COD_VENTA`),
  KEY `FK_DETALLES_VENTA_ARTICULOS_idx` (`COD_ARTICULO`),
  CONSTRAINT `tbl_detalles_venta_FK` FOREIGN KEY (`COD_VENTA`) REFERENCES `tbl_ventas` (`COD_VENTA`),
  CONSTRAINT `tbl_detalles_venta_FK_1` FOREIGN KEY (`COD_ARTICULO`) REFERENCES `tbl_articulos` (`COD_ARTICULO`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_inventario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_inventario` (
  `CODINVENTARIO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ARTICULO` int(11) NOT NULL,
  `DESCRIPCIONPRODUCTO` varchar(50) DEFAULT NULL,
  `EXISTENCIA` decimal(10, 0) NOT NULL,
  `ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`CODINVENTARIO`),
  KEY `tbl_inventario_FK` (`COD_ARTICULO`),
  CONSTRAINT `tbl_inventario_FK` FOREIGN KEY (`COD_ARTICULO`) REFERENCES `tbl_articulos` (`COD_ARTICULO`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_metodo_pago
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_metodo_pago` (
  `COD_MET_PAGO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `FEC_REGISTRO` datetime NOT NULL,
  `ULT_MODIFICACION` datetime NOT NULL,
  PRIMARY KEY (`COD_MET_PAGO`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_movimientos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_movimientos` (
  `COD_MOVIMIENTO` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `CANTIDAD` varchar(100) DEFAULT NULL,
  `COD_ARTICULO` int(11) DEFAULT NULL,
  `Fecha` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COD_MOVIMIENTO`),
  KEY `tbl_movimientos_FK` (`COD_ARTICULO`),
  CONSTRAINT `tbl_movimientos_FK` FOREIGN KEY (`COD_ARTICULO`) REFERENCES `tbl_articulos` (`COD_ARTICULO`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_objetos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_objetos` (
  `COD_OBJETO` int(11) NOT NULL AUTO_INCREMENT,
  `OBJETO` varchar(50) NOT NULL,
  `ICONO` varchar(100) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `ID_PADRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_OBJETO`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_parametros
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_parametros` (
  `ID_PARAMETRO` int(11) NOT NULL AUTO_INCREMENT,
  `PARAMETRO` varchar(50) NOT NULL,
  `VALOR` varchar(50) NOT NULL,
  `FEC_CREACION` date DEFAULT NULL,
  `FEC_MODIFICACION` date DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PARAMETRO`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_permisos
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_permisos` (
  `COD_PERMISO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_ROL` int(11) DEFAULT NULL,
  `COD_OBJETO` int(11) DEFAULT NULL,
  `INSERTAR` enum('SI', 'NO') DEFAULT NULL,
  `ACTUALIZAR` enum('SI', 'NO') DEFAULT NULL,
  `CONSULTAR` enum('SI', 'NO') DEFAULT NULL,
  `ELIMINAR` enum('SI', 'NO') DEFAULT NULL,
  PRIMARY KEY (`COD_PERMISO`),
  KEY `FK_ROL_PERMISOS_idx` (`COD_ROL`),
  KEY `FK_OBJETO_PERMISOS_idx` (`COD_OBJETO`),
  CONSTRAINT `tbl_permisos_FK` FOREIGN KEY (`COD_OBJETO`) REFERENCES `tbl_objetos` (`COD_OBJETO`),
  CONSTRAINT `tbl_permisos_FK_1` FOREIGN KEY (`COD_ROL`) REFERENCES `tbl_roles` (`COD_ROL`)
) ENGINE = InnoDB AUTO_INCREMENT = 27 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_personas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_personas` (
  `COD_PERSONA` int(11) NOT NULL AUTO_INCREMENT,
  `PRIMER_NOMBRE` varchar(45) DEFAULT NULL,
  `SEGUNDO_NOMBRE` varchar(45) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(45) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(45) DEFAULT NULL,
  `DNI` varchar(50) DEFAULT NULL,
  `FEC_NACIMIENTO` varchar(50) DEFAULT NULL,
  `EST_CIVIL` varchar(50) DEFAULT NULL,
  `SEXO` varchar(50) DEFAULT NULL,
  `PERFIL` varchar(45) DEFAULT NULL,
  `TELEFONO` varchar(100) DEFAULT NULL,
  `DIREECION` varchar(100) DEFAULT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_PERSONA`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_pregunta_usuario
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_pregunta_usuario` (
  `COD_PREGUNTA_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_PREGUNTA` int(11) NOT NULL,
  `COD_USUARIO` int(11) NOT NULL,
  `RESPUESTA` varchar(250) NOT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime NOT NULL,
  PRIMARY KEY (`COD_PREGUNTA_USUARIO`),
  KEY `TBL_PREGUNTA_USUARIO_idx` (`COD_USUARIO`),
  KEY `TBL_PREGUNTA_USUARIO_TBL_PREGUNTAS_idx` (`COD_PREGUNTA`),
  CONSTRAINT `tbl_pregunta_usuario_FK` FOREIGN KEY (`COD_PREGUNTA`) REFERENCES `tbl_preguntas` (`COD_PREGUNTA`),
  CONSTRAINT `tbl_pregunta_usuario_FK_1` FOREIGN KEY (`COD_USUARIO`) REFERENCES `tbl_usuarios` (`COD_USUARIO`)
) ENGINE = InnoDB AUTO_INCREMENT = 47 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_preguntas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_preguntas` (
  `COD_PREGUNTA` int(11) NOT NULL AUTO_INCREMENT,
  `PREGUNTA` varchar(100) DEFAULT NULL,
  `CREADO_POR` varchar(45) DEFAULT NULL,
  `MODIFICADO_POR` varchar(45) DEFAULT NULL,
  `FEC_REGISTRO` date DEFAULT NULL,
  `ULT_MODIFICACION` date DEFAULT NULL,
  `ESTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PREGUNTA`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_proveedores
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_proveedores` (
  `COD_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `COD_PERSONA` int(11) NOT NULL,
  `NOMBRE_PROVEEDOR` varchar(45) DEFAULT NULL,
  `NOMBRE_CONTACTO` varchar(45) DEFAULT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_PROVEEDOR`),
  KEY `FK_TB_Proveedores_TB_PERSONAS_idx` (`COD_PERSONA`),
  CONSTRAINT `tbl_proveedores_FK` FOREIGN KEY (`COD_PERSONA`) REFERENCES `tbl_personas` (`COD_PERSONA`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_roles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_roles` (
  `COD_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ROL` varchar(50) DEFAULT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime DEFAULT NULL,
  PRIMARY KEY (`COD_ROL`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_tipo_clientes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_tipo_clientes` (
  `COD_TIPO_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_CLIENTE` varchar(200) DEFAULT NULL,
  `REBAJA` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_CLIENTE`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_usuarios
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `COD_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `COD_PERSONA` int(11) DEFAULT NULL,
  `COD_ROL` int(11) DEFAULT NULL,
  `USUARIO` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CONTRASEÑA` varchar(50) DEFAULT NULL,
  `IMG` blob DEFAULT NULL,
  `FEC_REGISTRO` datetime DEFAULT NULL,
  `ULT_MODIFICACION` datetime DEFAULT NULL,
  `ESTADO` varchar(10) DEFAULT NULL,
  `PRIMER_VEZ` int(11) DEFAULT NULL,
  `INTENTOS` int(11) DEFAULT NULL,
  `FEC_VENCIMIENTO` date DEFAULT NULL,
  PRIMARY KEY (`COD_USUARIO`),
  KEY `FK_USUARIO_PERSONA_idx` (`COD_PERSONA`),
  KEY `TBL_USUARIOS_FK` (`COD_ROL`),
  CONSTRAINT `tbl_usuarios_FK` FOREIGN KEY (`COD_ROL`) REFERENCES `tbl_roles` (`COD_ROL`),
  CONSTRAINT `tbl_usuarios_FK_1` FOREIGN KEY (`COD_PERSONA`) REFERENCES `tbl_personas` (`COD_PERSONA`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_ventas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_ventas` (
  `COD_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `COD_CLIENTE` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `NUM_FACTURA` int(11) NOT NULL,
  `SUB_TOTAL` decimal(10, 2) NOT NULL,
  `IMPUESTO` decimal(10, 0) NOT NULL,
  `TOT_PAGAR` decimal(10, 2) NOT NULL,
  `COD_MET_PAGO` int(11) DEFAULT NULL,
  `FEC_REGISTRO` datetime NOT NULL,
  `ULT_MODIFICACION` datetime NOT NULL,
  PRIMARY KEY (`COD_VENTA`),
  KEY `FK_VENTAS_CLIENTES_idx` (`COD_CLIENTE`),
  KEY `FK_VENTAS_MET_PAGOS_idx` (`COD_MET_PAGO`),
  CONSTRAINT `tbl_ventas_FK` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `tbl_clientes` (`COD_CLIENTE`)
) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_articulos
# ------------------------------------------------------------

INSERT INTO
  `tbl_articulos` (
    `COD_ARTICULO`,
    `COD_CATEGORIA`,
    `NOM_ART`,
    `PREC_COMPRA`,
    `PREC_VENTA`,
    `DESCRIPCION`,
    `ESTADO`,
    `FEC_MODIFICACION`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    1,
    3,
    'CAMISA DE DAMA',
    3,
    2,
    'CAMISA',
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `tbl_articulos` (
    `COD_ARTICULO`,
    `COD_CATEGORIA`,
    `NOM_ART`,
    `PREC_COMPRA`,
    `PREC_VENTA`,
    `DESCRIPCION`,
    `ESTADO`,
    `FEC_MODIFICACION`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    2,
    3,
    'PANTALON DE DAMA',
    12,
    20,
    'PANTALON',
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `tbl_articulos` (
    `COD_ARTICULO`,
    `COD_CATEGORIA`,
    `NOM_ART`,
    `PREC_COMPRA`,
    `PREC_VENTA`,
    `DESCRIPCION`,
    `ESTADO`,
    `FEC_MODIFICACION`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    3,
    3,
    'BLUSA',
    77,
    77,
    'BLUSA DE DAMA',
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );
INSERT INTO
  `tbl_articulos` (
    `COD_ARTICULO`,
    `COD_CATEGORIA`,
    `NOM_ART`,
    `PREC_COMPRA`,
    `PREC_VENTA`,
    `DESCRIPCION`,
    `ESTADO`,
    `FEC_MODIFICACION`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    4,
    3,
    'PRUEBAAA',
    NULL,
    30,
    'prueba',
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_backup
# ------------------------------------------------------------

INSERT INTO
  `tbl_backup` (
    `COD_BACKUP`,
    `NOMBRE`,
    `USUARIO_REGISTRO`,
    `FECHA_REGISTRO`
  )
VALUES
  (1, '946Backup.sql', 0, '2022-11-27');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_bitacora
# ------------------------------------------------------------

INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2847,
    'SALIO',
    '2022-11-30T23:53:48.701Z',
    1,
    'BITACORA'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2848,
    'INGRESO',
    '2022-11-30T23:53:48.766Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2849,
    'INGRESO',
    '2022-11-30T23:53:51.582Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2850,
    'SALIO',
    '2022-11-30T23:53:54.539Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2851,
    'INGRESO',
    '2022-11-30T23:53:54.560Z',
    1,
    'BITACORA'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2852,
    'INGRESO',
    '2022-11-30T23:54:58.641Z',
    1,
    'BITACORA'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2853,
    'SALIO',
    '2022-11-30T23:55:45.194Z',
    1,
    'BITACORA'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2854,
    'INGRESO',
    '2022-11-30T23:55:45.214Z',
    1,
    'CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2855,
    'SALIO',
    '2022-11-30T23:55:45.867Z',
    1,
    'CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2856,
    'INGRESO',
    '2022-11-30T23:55:45.905Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2857,
    'INGRESO',
    '2022-11-30T23:59:08.504Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2858,
    'INGRESO',
    '2022-11-30T23:59:18.766Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2859,
    'SALIO',
    '2022-11-30T23:59:20.822Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2860,
    'INGRESO',
    '2022-11-30T23:59:20.857Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2861,
    'INGRESO',
    '2022-12-01T00:08:36.244Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2862,
    'INGRESO',
    '2022-12-01T00:08:52.729Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2863,
    'INGRESO',
    '2022-12-01T00:13:50.241Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2864,
    'INGRESO',
    '2022-12-01T00:15:03.674Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2865,
    'INGRESO',
    '2022-12-01T00:15:58.967Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2866,
    'INGRESO',
    '2022-12-01T00:16:09.068Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2867,
    'INGRESO',
    '2022-12-01T00:16:42.507Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2868,
    'INGRESO',
    '2022-12-01T00:17:30.915Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2869,
    'INGRESO',
    '2022-12-01T00:17:55.792Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2870,
    'INGRESO',
    '2022-12-01T00:18:28.504Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2871,
    'INGRESO',
    '2022-12-01T00:18:47.482Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2872,
    'INGRESO',
    '2022-12-01T00:19:32.465Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2873,
    'INGRESO',
    '2022-12-01T00:21:24.086Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2874,
    'INGRESO',
    '2022-12-01T00:23:33.990Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2875,
    'INGRESO',
    '2022-12-01T00:24:36.374Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2876,
    'INGRESO',
    '2022-12-01T00:25:48.107Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2877,
    'INGRESO',
    '2022-12-01T00:29:24.788Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2878,
    'INGRESO',
    '2022-12-01T00:30:28.269Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2879,
    'INGRESO',
    '2022-12-01T00:32:57.691Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2880,
    'INGRESO',
    '2022-12-01T00:38:40.305Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2881,
    'INGRESO',
    '2022-12-01T00:39:19.918Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2882,
    'INGRESO',
    '2022-12-01T00:40:06.981Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2883,
    'INGRESO',
    '2022-12-01T00:41:24.401Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2884,
    'INGRESO',
    '2022-12-01T00:41:56.017Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2885,
    'INGRESO',
    '2022-12-01T00:45:51.672Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2886,
    'INGRESO',
    '2022-12-01T00:46:59.775Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2887,
    'SALIO',
    '2022-12-01T00:48:34.399Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2888,
    'INGRESO',
    '2022-12-01T00:48:34.489Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2889,
    'SALIO',
    '2022-12-01T00:48:35.241Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2890,
    'INGRESO',
    '2022-12-01T00:48:35.265Z',
    1,
    'OBJETOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2891,
    'SALIO',
    '2022-12-01T00:48:35.624Z',
    1,
    'OBJETOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2892,
    'INGRESO',
    '2022-12-01T00:48:35.654Z',
    1,
    'ROLES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2893,
    'SALIO',
    '2022-12-01T00:48:37.444Z',
    1,
    'ROLES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2894,
    'INGRESO',
    '2022-12-01T00:48:37.471Z',
    1,
    'OBJETOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2895,
    'SALIO',
    '2022-12-01T00:48:38.909Z',
    1,
    'OBJETOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2896,
    'INGRESO',
    '2022-12-01T00:48:38.938Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2897,
    'SALIO',
    '2022-12-01T00:48:41.465Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2898,
    'INGRESO',
    '2022-12-01T00:48:41.500Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2899,
    'ACTUALIZO',
    '2022-12-01T00:48:46.438Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2900,
    'ACTUALIZO',
    '2022-12-01T00:48:51.391Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2901,
    'ACTUALIZO',
    '2022-12-01T00:48:57.032Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2902,
    'ACTUALIZO',
    '2022-12-01T00:49:04.387Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2903,
    'ACTUALIZO',
    '2022-12-01T00:49:11.582Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2904,
    'ACTUALIZO',
    '2022-12-01T00:49:19.882Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2905,
    'ACTUALIZO',
    '2022-12-01T00:49:29.181Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2906,
    'SALIO',
    '2022-12-01T00:49:32.279Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2907,
    'INGRESO',
    '2022-12-01T00:49:32.304Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2908,
    'SALIO',
    '2022-12-01T00:49:59.844Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2909,
    'INGRESO',
    '2022-12-01T00:49:59.912Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2910,
    'INGRESO',
    '2022-12-01T00:50:09.541Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2952,
    'INGRESO',
    '2022-12-01T19:22:58.335Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2953,
    'SALIO',
    '2022-12-01T19:22:59.174Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2954,
    'INGRESO',
    '2022-12-01T19:22:59.201Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2955,
    'SALIO',
    '2022-12-01T19:23:03.024Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2956,
    'INGRESO',
    '2022-12-01T19:23:03.055Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2957,
    'SALIO',
    '2022-12-01T19:23:07.520Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2958,
    'INGRESO',
    '2022-12-01T19:23:07.574Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2959,
    'SALIO',
    '2022-12-01T19:23:10.397Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2960,
    'INGRESO',
    '2022-12-01T19:23:10.453Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2961,
    'SALIO',
    '2022-12-01T19:24:35.434Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2962,
    'INGRESO',
    '2022-12-01T19:24:35.449Z',
    1,
    'CATEGORIAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2963,
    'SALIO',
    '2022-12-01T19:24:46.154Z',
    1,
    'CATEGORIAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2964,
    'INGRESO',
    '2022-12-01T19:24:46.197Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2965,
    'SALIO',
    '2022-12-01T19:25:01.629Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2966,
    'INGRESO',
    '2022-12-01T19:25:01.653Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2967,
    'SALIO',
    '2022-12-01T19:25:03.551Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2968,
    'INGRESO',
    '2022-12-01T19:25:03.557Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2969,
    'SALIO',
    '2022-12-01T19:25:05.282Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2970,
    'INGRESO',
    '2022-12-01T19:25:05.301Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2971,
    'SALIO',
    '2022-12-01T19:25:05.824Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2972,
    'INGRESO',
    '2022-12-01T19:25:05.844Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2973,
    'SALIO',
    '2022-12-01T19:25:06.308Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2974,
    'INGRESO',
    '2022-12-01T19:25:06.319Z',
    1,
    'CATEGORIAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2975,
    'SALIO',
    '2022-12-01T19:25:07.322Z',
    1,
    'CATEGORIAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2976,
    'INGRESO',
    '2022-12-01T19:25:07.342Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2977,
    'SALIO',
    '2022-12-01T19:25:07.809Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2978,
    'INGRESO',
    '2022-12-01T19:25:07.823Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2979,
    'SALIO',
    '2022-12-01T19:25:08.277Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2980,
    'INGRESO',
    '2022-12-01T19:25:08.285Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2981,
    'SALIO',
    '2022-12-01T19:25:09.959Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2982,
    'INGRESO',
    '2022-12-01T19:25:09.974Z',
    1,
    'CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2983,
    'SALIO',
    '2022-12-01T19:25:10.474Z',
    1,
    'CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2984,
    'INGRESO',
    '2022-12-01T19:25:10.527Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2985,
    'SALIO',
    '2022-12-01T19:25:10.987Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2986,
    'INGRESO',
    '2022-12-01T19:25:11.018Z',
    1,
    'TIPO CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2987,
    'SALIO',
    '2022-12-01T19:25:14.061Z',
    1,
    'TIPO CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2988,
    'INGRESO',
    '2022-12-01T19:25:14.089Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2989,
    'SALIO',
    '2022-12-01T19:25:14.582Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2990,
    'INGRESO',
    '2022-12-01T19:25:14.606Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2991,
    'SALIO',
    '2022-12-01T19:25:21.136Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2992,
    'INGRESO',
    '2022-12-01T19:25:21.163Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (2993, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2994,
    'INGRESO',
    '2022-12-01T19:26:57.223Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2995,
    'INGRESO',
    '2022-12-01T19:28:43.496Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (2996, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2997,
    'INGRESO',
    '2022-12-01T19:29:47.673Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (2998, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    2999,
    'INGRESO',
    '2022-12-01T19:33:07.998Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3000,
    'INGRESO',
    '2022-12-01T19:34:13.154Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3001,
    'INGRESO',
    '2022-12-01T19:34:34.668Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3002,
    'SALIO',
    '2022-12-01T19:34:41.955Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3003,
    'INGRESO',
    '2022-12-01T19:34:42.021Z',
    1,
    'PERSONAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3004,
    'SALIO',
    '2022-12-01T19:34:44.504Z',
    1,
    'PERSONAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3005,
    'INGRESO',
    '2022-12-01T19:34:44.517Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3006,
    'INGRESO',
    '2022-12-01T19:36:02.525Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3007,
    'SALIO',
    '2022-12-01T19:36:06.325Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3008,
    'INGRESO',
    '2022-12-01T19:36:06.381Z',
    1,
    'CATEGORIAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3009,
    'SALIO',
    '2022-12-01T19:36:06.957Z',
    1,
    'CATEGORIAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3010,
    'INGRESO',
    '2022-12-01T19:36:06.973Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3011,
    'SALIO',
    '2022-12-01T19:36:18.510Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3012,
    'INGRESO',
    '2022-12-01T19:36:18.533Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3013,
    'SALIO',
    '2022-12-01T19:36:21.308Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3014,
    'INGRESO',
    '2022-12-01T19:36:21.326Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3015,
    'INGRESO',
    '2022-12-01T19:39:42.379Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3016,
    'INGRESO',
    '2022-12-01T19:40:20.850Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (3017, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3018,
    'SALIO',
    '2022-12-01T19:40:35.959Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3019,
    'INGRESO',
    '2022-12-01T19:40:36.017Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3020,
    'INGRESO',
    '2022-12-01T19:41:32.819Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3021,
    'INGRESO',
    '2022-12-01T19:41:38.139Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3022,
    'INGRESO',
    '2022-12-01T19:41:46.906Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3023,
    'INGRESO',
    '2022-12-01T19:41:58.004Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3024,
    'INGRESO',
    '2022-12-01T19:42:18.180Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3025,
    'INGRESO',
    '2022-12-01T19:42:31.986Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3026,
    'INGRESO',
    '2022-12-01T19:42:41.328Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3027,
    'INGRESO',
    '2022-12-01T19:42:58.064Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3028,
    'INGRESO',
    '2022-12-01T19:43:07.340Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3029,
    'INGRESO',
    '2022-12-01T19:43:20.878Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3030,
    'INGRESO',
    '2022-12-01T19:43:27.162Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3031,
    'INGRESO',
    '2022-12-01T19:43:39.149Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3032,
    'INGRESO',
    '2022-12-01T19:43:50.418Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3033,
    'INGRESO',
    '2022-12-01T19:43:57.274Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3034,
    'INGRESO',
    '2022-12-01T19:44:09.125Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3035,
    'INGRESO',
    '2022-12-01T19:44:22.971Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3036,
    'SALIO',
    '2022-12-01T19:44:52.043Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3037,
    'INGRESO',
    '2022-12-01T19:44:52.055Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3038,
    'INGRESO',
    '2022-12-01T19:46:01.545Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3039,
    'INGRESO',
    '2022-12-01T19:46:38.323Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3040,
    'INGRESO',
    '2022-12-01T19:50:19.125Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3041,
    'INGRESO',
    '2022-12-01T19:50:21.098Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3042,
    'SALIO',
    '2022-12-01T19:50:27.045Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3043,
    'INGRESO',
    '2022-12-01T19:50:27.115Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3044,
    'SALIO',
    '2022-12-01T19:50:38.319Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3045,
    'INGRESO',
    '2022-12-01T19:50:38.379Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3046,
    'INSERTO',
    '2022-12-01T19:50:49.602Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3047,
    'SALIO',
    '2022-12-01T19:50:51.933Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3048,
    'INGRESO',
    '2022-12-01T19:50:51.946Z',
    1,
    'CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3049,
    'SALIO',
    '2022-12-01T19:50:52.783Z',
    1,
    'CLIENTES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3050,
    'INGRESO',
    '2022-12-01T19:50:52.818Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3051,
    'SALIO',
    '2022-12-01T19:50:53.707Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3052,
    'INGRESO',
    '2022-12-01T19:50:53.737Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3053,
    'SALIO',
    '2022-12-01T19:50:55.676Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3054,
    'INGRESO',
    '2022-12-01T19:50:55.685Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3055,
    'SALIO',
    '2022-12-01T19:51:31.652Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3056,
    'INGRESO',
    '2022-12-01T19:51:31.700Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3057,
    'SALIO',
    '2022-12-01T19:51:32.154Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3058,
    'INGRESO',
    '2022-12-01T19:51:32.183Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3059,
    'SALIO',
    '2022-12-01T19:51:32.661Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3060,
    'INGRESO',
    '2022-12-01T19:51:32.671Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3061,
    'INGRESO',
    '2022-12-01T19:55:21.203Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3062,
    'INGRESO',
    '2022-12-01T19:55:31.490Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3063,
    'INGRESO',
    '2022-12-01T19:55:46.042Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3064,
    'INGRESO',
    '2022-12-01T19:57:53.415Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3065,
    'SALIO',
    '2022-12-01T20:01:57.847Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3066,
    'INGRESO',
    '2022-12-01T20:01:57.899Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3067,
    'INGRESO',
    '2022-12-01T20:03:20.436Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3068,
    'INGRESO',
    '2022-12-01T20:03:22.349Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3069,
    'DESCARGO PDF',
    '2022-12-01T20:04:06.287Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3070,
    'SALIO',
    '2022-12-01T20:06:56.044Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3071,
    'INGRESO',
    '2022-12-01T20:06:56.120Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3072,
    'INSERTO',
    '2022-12-01T20:07:14.670Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3073,
    'INSERTO',
    '2022-12-01T20:07:30.502Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3074,
    'SALIO',
    '2022-12-01T20:07:37.259Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3075,
    'INGRESO',
    '2022-12-01T20:07:37.286Z',
    1,
    'OBJETOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3076,
    'SALIO',
    '2022-12-01T20:07:37.764Z',
    1,
    'OBJETOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3077,
    'INGRESO',
    '2022-12-01T20:07:37.818Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3078,
    'ACTUALIZO',
    '2022-12-01T20:07:54.467Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3079,
    'SALIO',
    '2022-12-01T20:07:59.608Z',
    1,
    'PERMISOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3080,
    'INGRESO',
    '2022-12-01T20:07:59.675Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3081,
    'SALIO',
    '2022-12-01T20:08:00.755Z',
    1,
    'USUARIOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3082,
    'INGRESO',
    '2022-12-01T20:08:00.777Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3083,
    'ACTUALIZO',
    '2022-12-01T20:08:15.333Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3084,
    'SALIO',
    '2022-12-01T20:11:19.185Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3085,
    'INGRESO',
    '2022-12-01T20:11:19.285Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3086,
    'INGRESO',
    '2022-12-01T20:11:21.219Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3087,
    'SALIO',
    '2022-12-01T20:12:31.614Z',
    1,
    'PARAMETROS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3088,
    'INGRESO',
    '2022-12-01T20:12:31.672Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3089,
    'INGRESO',
    '2022-12-01T20:13:40.707Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3090,
    'INGRESO',
    '2022-12-01T20:14:01.880Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3091,
    'INGRESO',
    '2022-12-01T20:14:36.490Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3092,
    'INGRESO',
    '2022-12-01T20:14:55.047Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3093,
    'INGRESO',
    '2022-12-01T20:15:12.273Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3094,
    'INGRESO',
    '2022-12-01T20:15:42.003Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3095,
    'INGRESO',
    '2022-12-01T20:20:08.844Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3096,
    'INGRESO',
    '2022-12-01T20:43:15.604Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3097,
    'INGRESO',
    '2022-12-01T20:44:23.197Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3098,
    'INGRESO',
    '2022-12-01T20:47:55.641Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3099,
    'INGRESO',
    '2022-12-01T20:48:12.057Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3100,
    'INGRESO',
    '2022-12-01T20:48:38.799Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3101,
    'INGRESO',
    '2022-12-01T20:50:41.495Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3102,
    'INGRESO',
    '2022-12-01T20:51:13.615Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3103,
    'SALIO',
    '2022-12-01T21:25:15.770Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3104,
    'INGRESO',
    '2022-12-01T21:25:15.836Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3105,
    'SALIO',
    '2022-12-01T21:25:32.876Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3106,
    'INGRESO',
    '2022-12-01T21:25:32.929Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3107,
    'SALIO',
    '2022-12-01T21:26:38.288Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3108,
    'INGRESO',
    '2022-12-01T21:26:38.295Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3109,
    'SALIO',
    '2022-12-01T21:26:43.234Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3110,
    'INGRESO',
    '2022-12-01T21:26:43.251Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3111,
    'INSERTO',
    '2022-12-01T21:26:53.439Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3112,
    'SALIO',
    '2022-12-01T21:27:24.287Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3113,
    'INGRESO',
    '2022-12-01T21:27:24.295Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3114,
    'INGRESO',
    '2022-12-01T21:28:26.964Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3115,
    'INGRESO',
    '2022-12-01T21:29:45.174Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3116,
    'INGRESO',
    '2022-12-01T21:30:40.061Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3117,
    'SALIO',
    '2022-12-01T21:36:06.607Z',
    1,
    'MOVIMIENTOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3118,
    'INGRESO',
    '2022-12-01T21:36:06.685Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3119,
    'SALIO',
    '2022-12-01T21:39:03.729Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3120,
    'INGRESO',
    '2022-12-01T21:39:03.794Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3121,
    'SALIO',
    '2022-12-01T21:39:55.933Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3122,
    'INGRESO',
    '2022-12-01T21:39:55.947Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3123,
    'SALIO',
    '2022-12-01T21:40:06.747Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3124,
    'INGRESO',
    '2022-12-01T21:40:06.786Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3125,
    'SALIO',
    '2022-12-01T21:40:08.765Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3126,
    'INGRESO',
    '2022-12-01T21:40:08.778Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3127,
    'SALIO',
    '2022-12-01T21:40:11.889Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3128,
    'INGRESO',
    '2022-12-01T21:40:11.924Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3129,
    'SALIO',
    '2022-12-01T21:40:24.438Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3130,
    'INGRESO',
    '2022-12-01T21:40:24.457Z',
    1,
    'INVENTARIO'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3131,
    'SALIO',
    '2022-12-01T21:40:25.507Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3132,
    'INGRESO',
    '2022-12-01T21:40:25.535Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3133,
    'SALIO',
    '2022-12-01T21:41:50.225Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3134,
    'INGRESO',
    '2022-12-01T21:41:50.287Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3135,
    'SALIO',
    '2022-12-01T21:41:52.621Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3136,
    'INGRESO',
    '2022-12-01T21:41:52.641Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3137,
    'SALIO',
    '2022-12-01T21:42:04.449Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3138,
    'INGRESO',
    '2022-12-01T21:42:04.473Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3139,
    'SALIO',
    '2022-12-01T21:42:05.693Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3140,
    'INGRESO',
    '2022-12-01T21:42:05.727Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3141,
    'SALIO',
    '2022-12-01T21:42:06.754Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3142,
    'INGRESO',
    '2022-12-01T21:42:06.782Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3143,
    'SALIO',
    '2022-12-01T21:42:07.669Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3144,
    'INGRESO',
    '2022-12-01T21:42:07.707Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3145,
    'SALIO',
    '2022-12-01T21:42:08.587Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3146,
    'INGRESO',
    '2022-12-01T21:42:08.642Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3147,
    'SALIO',
    '2022-12-01T21:42:09.100Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3148,
    'INGRESO',
    '2022-12-01T21:42:09.148Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3149,
    'SALIO',
    '2022-12-01T21:42:09.557Z',
    1,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3150,
    'INGRESO',
    '2022-12-01T21:42:09.622Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3151,
    'SALIO',
    '2022-12-01T21:42:38.961Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3152,
    'INGRESO',
    '2022-12-01T21:42:38.986Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3153,
    'INGRESO',
    '2022-12-01T21:44:07.660Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3154,
    'INSERTO',
    '2022-12-01T21:45:15.629Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3155,
    'ACTUALIZO',
    '2022-12-01T21:45:28.549Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3156,
    'SALIO',
    '2022-12-01T21:45:39.998Z',
    1,
    'ARTICULOS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3157,
    'INGRESO',
    '2022-12-01T21:45:40.084Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3158,
    'SALIO',
    '2022-12-01T21:45:50.043Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3159,
    'INGRESO',
    '2022-12-01T21:45:50.117Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3160,
    'INGRESO',
    '2022-12-01T21:46:30.388Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3161,
    'INGRESO',
    '2022-12-01T21:46:51.469Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3162,
    'INGRESO',
    '2022-12-01T21:47:30.922Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3163,
    'INGRESO',
    '2022-12-01T21:47:52.887Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3164,
    'INSERTO',
    '2022-12-01T21:49:32.034Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3165,
    'SALIO',
    '2022-12-01T21:49:34.418Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3166,
    'INGRESO',
    '2022-12-01T21:49:34.433Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3167,
    'INGRESO',
    '2022-12-01T21:51:21.055Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3168,
    'INGRESO',
    '2022-12-01T21:53:18.001Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3169,
    'SALIO',
    '2022-12-01T21:53:26.954Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3170,
    'INGRESO',
    '2022-12-01T21:53:27.018Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3171,
    'INSERTO',
    '2022-12-01T21:53:49.495Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3172,
    'SALIO',
    '2022-12-01T21:54:08.483Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3173,
    'INGRESO',
    '2022-12-01T21:54:08.531Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3174,
    'SALIO',
    '2022-12-01T21:54:12.600Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3175,
    'INGRESO',
    '2022-12-01T21:54:12.710Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3176,
    'SALIO',
    '2022-12-01T21:54:15.568Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3177,
    'INGRESO',
    '2022-12-01T21:54:15.609Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3178,
    'SALIO',
    '2022-12-01T21:54:18.644Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3179,
    'INGRESO',
    '2022-12-01T21:54:18.670Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3180,
    'INSERTO',
    '2022-12-01T21:54:39.631Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3181,
    'SALIO',
    '2022-12-01T21:54:45.242Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3182,
    'INGRESO',
    '2022-12-01T21:54:45.269Z',
    3,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3183,
    'SALIO',
    '2022-12-01T21:54:50.022Z',
    1,
    'VENTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3184,
    'INGRESO',
    '2022-12-01T21:54:50.047Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3185,
    'INGRESO',
    '2022-12-01T21:56:07.769Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3186,
    'INGRESO',
    '2022-12-01T21:56:48.733Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3187,
    'INGRESO',
    '2022-12-01T21:58:26.586Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3188,
    'INGRESO',
    '2022-12-01T23:30:27.015Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3189,
    'INGRESO',
    '2022-12-01T23:31:02.500Z',
    3,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3190,
    'SALIO',
    '2022-12-01T23:33:01.049Z',
    1,
    'COMPRAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3191,
    'INGRESO',
    '2022-12-01T23:33:01.111Z',
    3,
    'PROVEEDORES'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3192,
    'SALIO',
    '2022-12-01T23:40:10.916Z',
    1,
    'PROVEEDORES'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_cat_articulos
# ------------------------------------------------------------

INSERT INTO
  `tbl_cat_articulos` (
    `COD_CATEGORIA`,
    `NOM_CATEGORIA`,
    `DESCRIPCION`,
    `FEC_REGISTRO`,
    `ULT_REGISTRO`
  )
VALUES
  (
    3,
    'ROPA DE DAMA',
    'ROPA',
    '2022-11-05 14:59:25',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_clientes
# ------------------------------------------------------------

INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    3,
    11,
    NULL,
    '2022-11-30 17:33:01',
    '2022-11-30 17:33:01'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    4,
    1,
    NULL,
    '2022-11-30 17:33:13',
    '2022-11-30 17:33:13'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    6,
    10,
    NULL,
    '2022-11-30 17:38:17',
    '2022-11-30 17:38:17'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    7,
    10,
    NULL,
    '2022-11-30 17:40:12',
    '2022-11-30 17:40:12'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    8,
    10,
    NULL,
    '2022-11-30 17:40:56',
    '2022-11-30 17:40:56'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    9,
    10,
    NULL,
    '2022-11-30 17:42:22',
    '2022-11-30 17:42:22'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    10,
    10,
    NULL,
    '2022-11-30 17:44:00',
    '2022-11-30 17:44:00'
  );
INSERT INTO
  `tbl_clientes` (
    `COD_CLIENTE`,
    `COD_PERSONA`,
    `COD_TIPO_CLIENTE`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    11,
    11,
    1,
    '2022-11-30 17:45:14',
    '2022-11-30 17:45:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_compras
# ------------------------------------------------------------

INSERT INTO
  `tbl_compras` (
    `COD_COMPRA`,
    `COD_PROVEEDOR`,
    `NUM_FACTURA`,
    `FECHA`,
    `COD_MET_PAGO`,
    `TOT_COMPRA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (21, 3, NULL, '2022-11-16', NULL, 2688, NULL, NULL);
INSERT INTO
  `tbl_compras` (
    `COD_COMPRA`,
    `COD_PROVEEDOR`,
    `NUM_FACTURA`,
    `FECHA`,
    `COD_MET_PAGO`,
    `TOT_COMPRA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (22, 3, NULL, '2022-11-16', NULL, 1344, NULL, NULL);
INSERT INTO
  `tbl_compras` (
    `COD_COMPRA`,
    `COD_PROVEEDOR`,
    `NUM_FACTURA`,
    `FECHA`,
    `COD_MET_PAGO`,
    `TOT_COMPRA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (23, 3, NULL, '2022-11-25', NULL, 296, NULL, NULL);
INSERT INTO
  `tbl_compras` (
    `COD_COMPRA`,
    `COD_PROVEEDOR`,
    `NUM_FACTURA`,
    `FECHA`,
    `COD_MET_PAGO`,
    `TOT_COMPRA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (25, 3, NULL, '2022-12-01', NULL, 4480, NULL, NULL);
INSERT INTO
  `tbl_compras` (
    `COD_COMPRA`,
    `COD_PROVEEDOR`,
    `NUM_FACTURA`,
    `FECHA`,
    `COD_MET_PAGO`,
    `TOT_COMPRA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (26, 3, NULL, '2022-12-01', NULL, 161, NULL, NULL);
INSERT INTO
  `tbl_compras` (
    `COD_COMPRA`,
    `COD_PROVEEDOR`,
    `NUM_FACTURA`,
    `FECHA`,
    `COD_MET_PAGO`,
    `TOT_COMPRA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (27, 4, NULL, '2022-12-01', NULL, 11200, NULL, NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_detalles_compra
# ------------------------------------------------------------

INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (23, 21, 1, 100, 12, 1344, '2022-11-16 17:39:32');
INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (24, 21, 2, 100, 12, 1344, '2022-11-16 17:39:32');
INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (25, 22, 1, 100, 12, 1344, '2022-11-16 17:39:58');
INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (26, 23, 1, 22, 12, 296, '2022-11-25 17:27:15');
INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (27, 25, 4, 20, 200, 4480, '2022-12-01 15:49:31');
INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (28, 26, 1, 12, 12, 161, '2022-12-01 15:53:49');
INSERT INTO
  `tbl_detalles_compra` (
    `COD_DETALLE_COMPRA`,
    `COD_COMPRA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_COMPRA`,
    `TOTAL`,
    `FEC_REGISTRO`
  )
VALUES
  (29, 27, 3, 100, 100, 11200, '2022-12-01 15:54:39');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_detalles_venta
# ------------------------------------------------------------

INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    15,
    11,
    1,
    10,
    12,
    134.40,
    0,
    '2022-11-16 17:42:27',
    '2022-11-16 17:42:27'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    16,
    12,
    1,
    10,
    12,
    134.40,
    0,
    '2022-11-16 17:43:37',
    '2022-11-16 17:43:37'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    17,
    12,
    2,
    10,
    12,
    134.40,
    0,
    '2022-11-16 17:43:37',
    '2022-11-16 17:43:37'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    18,
    13,
    2,
    23,
    12,
    309.12,
    0,
    '2022-11-28 06:24:05',
    '2022-11-28 06:24:05'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    19,
    14,
    2,
    60,
    12,
    806.40,
    0,
    '2022-11-28 14:21:19',
    '2022-11-28 14:21:19'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    20,
    15,
    1,
    23,
    2,
    51.52,
    0,
    '2022-12-01 13:50:49',
    '2022-12-01 13:50:49'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    21,
    16,
    1,
    2,
    2,
    4.48,
    0,
    '2022-12-01 14:51:27',
    '2022-12-01 14:51:27'
  );
INSERT INTO
  `tbl_detalles_venta` (
    `COD_DETALLE_VENTA`,
    `COD_VENTA`,
    `COD_ARTICULO`,
    `CANTIDAD`,
    `PREC_VENTA`,
    `TOTAL`,
    `DESCUENTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    22,
    17,
    1,
    2,
    2,
    4.48,
    0,
    '2022-12-01 15:26:53',
    '2022-12-01 15:26:53'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_inventario
# ------------------------------------------------------------

INSERT INTO
  `tbl_inventario` (
    `CODINVENTARIO`,
    `COD_ARTICULO`,
    `DESCRIPCIONPRODUCTO`,
    `EXISTENCIA`,
    `ESTADO`
  )
VALUES
  (4, 1, 'Mercancia', 187, 0);
INSERT INTO
  `tbl_inventario` (
    `CODINVENTARIO`,
    `COD_ARTICULO`,
    `DESCRIPCIONPRODUCTO`,
    `EXISTENCIA`,
    `ESTADO`
  )
VALUES
  (5, 2, 'Mercancia', 7, 0);
INSERT INTO
  `tbl_inventario` (
    `CODINVENTARIO`,
    `COD_ARTICULO`,
    `DESCRIPCIONPRODUCTO`,
    `EXISTENCIA`,
    `ESTADO`
  )
VALUES
  (6, 4, 'Mercancia', 20, 0);
INSERT INTO
  `tbl_inventario` (
    `CODINVENTARIO`,
    `COD_ARTICULO`,
    `DESCRIPCIONPRODUCTO`,
    `EXISTENCIA`,
    `ESTADO`
  )
VALUES
  (7, 3, 'Mercancia', 100, 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_metodo_pago
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_movimientos
# ------------------------------------------------------------

INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (1, 'ENTRADA', '22', 1, NULL, NULL);
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (2, 'SALIDA', '23', 2, NULL, NULL);
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (3, 'SALIDA', '60', 2, NULL, NULL);
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (4, 'SALIDA', '23', 1, '2022-12-01 13:50:49', NULL);
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (5, 'SALIDA', '2', 1, '2022-12-01 15:26:53', '1');
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (6, 'ENTRADA', '20', 4, '2022-12-01 15:49:31', '1');
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (7, 'ENTRADA', '12', 1, '2022-12-01 15:53:49', '1');
INSERT INTO
  `tbl_movimientos` (
    `COD_MOVIMIENTO`,
    `DESCRIPCION`,
    `CANTIDAD`,
    `COD_ARTICULO`,
    `Fecha`,
    `usuario`
  )
VALUES
  (8, 'ENTRADA', '100', 3, '2022-12-01 15:54:39', '1');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_objetos
# ------------------------------------------------------------

INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (1, 'SEGURIDAD', 'lock', NULL, 0);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (2, 'Usuarios', '', 'seguridad/usuarios', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (3, 'Roles', '', 'seguridad/roles', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (4, 'Objetos', '', 'seguridad/objetos', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (5, 'Permisos', '', 'seguridad/permisos', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (6, 'Preguntas', '', 'seguridad/preguntas', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (7, 'Bitacora', '', 'seguridad/bitacora', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (8, 'PERSONAS', 'person', NULL, 0);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (9, 'Personas', NULL, 'personas/personas', 8);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (10, 'Parametros', NULL, 'seguridad/parametros', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (11, 'Clientes', NULL, 'ventas/clientes', 16);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (12, 'Proveedores', NULL, 'compras/proveedores', 17);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (13, 'INVENTARIO', 'shop', NULL, 0);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (
    14,
    'Categoria articulos',
    NULL,
    'inventario/categorias',
    13
  );
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (15, 'Articulos', NULL, 'inventario/articulos', 13);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (16, 'VENTAS', 'shopping_cart', NULL, 0);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (17, 'COMPRAS', 'shopping_cart', NULL, 0);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (18, 'Ventas', '', 'ventas/ventas', 16);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (19, 'Compras', '', 'compras/compras', 17);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (20, 'Tipo clientes', NULL, 'ventas/tipoclientes', 16);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (21, 'Inventario', NULL, 'inventario/inventario', 13);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (
    22,
    'Movimientos',
    NULL,
    'inventario/movimientos',
    13
  );
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (23, 'Backup', NULL, 'seguridad/backup', 1);
INSERT INTO
  `tbl_objetos` (`COD_OBJETO`, `OBJETO`, `ICONO`, `URL`, `ID_PADRE`)
VALUES
  (24, 'Restore', NULL, 'seguridad/restore', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_parametros
# ------------------------------------------------------------

INSERT INTO
  `tbl_parametros` (
    `ID_PARAMETRO`,
    `PARAMETRO`,
    `VALOR`,
    `FEC_CREACION`,
    `FEC_MODIFICACION`,
    `ID_USUARIO`
  )
VALUES
  (
    1,
    'ADMIN_INTENTOS',
    '2',
    '2022-10-10',
    '2022-10-10',
    1
  );
INSERT INTO
  `tbl_parametros` (
    `ID_PARAMETRO`,
    `PARAMETRO`,
    `VALOR`,
    `FEC_CREACION`,
    `FEC_MODIFICACION`,
    `ID_USUARIO`
  )
VALUES
  (
    2,
    'SYS_NOMBRE',
    'Reysman',
    '2022-10-10',
    '2022-10-10',
    1
  );
INSERT INTO
  `tbl_parametros` (
    `ID_PARAMETRO`,
    `PARAMETRO`,
    `VALOR`,
    `FEC_CREACION`,
    `FEC_MODIFICACION`,
    `ID_USUARIO`
  )
VALUES
  (
    3,
    'ADMIN_PREGUNTAS_RECU',
    '2',
    '2022-10-10',
    '2022-10-10',
    1
  );
INSERT INTO
  `tbl_parametros` (
    `ID_PARAMETRO`,
    `PARAMETRO`,
    `VALOR`,
    `FEC_CREACION`,
    `FEC_MODIFICACION`,
    `ID_USUARIO`
  )
VALUES
  (
    4,
    'ADMIN_VIGENCIA_USUARIO_DIAS',
    '3',
    '2022-10-10',
    '2022-10-10',
    1
  );
INSERT INTO
  `tbl_parametros` (
    `ID_PARAMETRO`,
    `PARAMETRO`,
    `VALOR`,
    `FEC_CREACION`,
    `FEC_MODIFICACION`,
    `ID_USUARIO`
  )
VALUES
  (6, 'IMPUESTO VENTA', '0.12', NULL, NULL, NULL);
INSERT INTO
  `tbl_parametros` (
    `ID_PARAMETRO`,
    `PARAMETRO`,
    `VALOR`,
    `FEC_CREACION`,
    `FEC_MODIFICACION`,
    `ID_USUARIO`
  )
VALUES
  (7, 'IMPUESTO COMPRA', '0.13', NULL, NULL, NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_permisos
# ------------------------------------------------------------

INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (1, 1, 1, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (2, 1, 2, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (3, 1, 3, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (4, 1, 4, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (5, 1, 5, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (6, 1, 6, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (7, 1, 7, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (8, 1, 8, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (9, 1, 9, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (10, 1, 10, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (11, 1, 11, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (12, 1, 12, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (13, 1, 13, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (14, 1, 14, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (15, 1, 15, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (16, 1, 16, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (17, 1, 17, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (18, 1, 18, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (19, 1, 19, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (20, 1, 20, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (21, 2, 1, 'NO', 'NO', 'NO', 'NO');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (22, 2, 2, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (23, 1, 21, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (24, 1, 22, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (25, 1, 23, 'SI', 'SI', 'SI', 'SI');
INSERT INTO
  `tbl_permisos` (
    `COD_PERMISO`,
    `COD_ROL`,
    `COD_OBJETO`,
    `INSERTAR`,
    `ACTUALIZAR`,
    `CONSULTAR`,
    `ELIMINAR`
  )
VALUES
  (26, 1, 24, 'SI', 'SI', 'SI', 'SI');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_personas
# ------------------------------------------------------------

INSERT INTO
  `tbl_personas` (
    `COD_PERSONA`,
    `PRIMER_NOMBRE`,
    `SEGUNDO_NOMBRE`,
    `PRIMER_APELLIDO`,
    `SEGUNDO_APELLIDO`,
    `DNI`,
    `FEC_NACIMIENTO`,
    `EST_CIVIL`,
    `SEXO`,
    `PERFIL`,
    `TELEFONO`,
    `DIREECION`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    1,
    'ADMIN',
    'ADMIN',
    'ADMIN',
    'ADMIN',
    '',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `tbl_personas` (
    `COD_PERSONA`,
    `PRIMER_NOMBRE`,
    `SEGUNDO_NOMBRE`,
    `PRIMER_APELLIDO`,
    `SEGUNDO_APELLIDO`,
    `DNI`,
    `FEC_NACIMIENTO`,
    `EST_CIVIL`,
    `SEXO`,
    `PERFIL`,
    `TELEFONO`,
    `DIREECION`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    10,
    'PEDRO',
    '',
    'ROMERO',
    '',
    '0811020202030',
    '2022-11-16T06:00:00.000Z',
    'SOLTERO',
    'MASCULINO',
    NULL,
    '32434242',
    'LA VEGA',
    NULL,
    NULL
  );
INSERT INTO
  `tbl_personas` (
    `COD_PERSONA`,
    `PRIMER_NOMBRE`,
    `SEGUNDO_NOMBRE`,
    `PRIMER_APELLIDO`,
    `SEGUNDO_APELLIDO`,
    `DNI`,
    `FEC_NACIMIENTO`,
    `EST_CIVIL`,
    `SEXO`,
    `PERFIL`,
    `TELEFONO`,
    `DIREECION`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    11,
    'DIEGO',
    '',
    'PEREZ',
    '',
    '0833000003333',
    '2022-11-16T06:00:00.000Z',
    'SOLTERO',
    'MASCULINO',
    NULL,
    '77686868',
    'RIVERA',
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_pregunta_usuario
# ------------------------------------------------------------

INSERT INTO
  `tbl_pregunta_usuario` (
    `COD_PREGUNTA_USUARIO`,
    `COD_PREGUNTA`,
    `COD_USUARIO`,
    `RESPUESTA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    45,
    1,
    1,
    'ewre',
    '2022-11-28 06:35:50',
    '2022-11-28 06:35:50'
  );
INSERT INTO
  `tbl_pregunta_usuario` (
    `COD_PREGUNTA_USUARIO`,
    `COD_PREGUNTA`,
    `COD_USUARIO`,
    `RESPUESTA`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    46,
    2,
    1,
    'ewre',
    '2022-11-28 06:36:14',
    '2022-11-28 06:36:14'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_preguntas
# ------------------------------------------------------------

INSERT INTO
  `tbl_preguntas` (
    `COD_PREGUNTA`,
    `PREGUNTA`,
    `CREADO_POR`,
    `MODIFICADO_POR`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`,
    `ESTADO`
  )
VALUES
  (
    1,
    'Nombre de tu perro fav?',
    NULL,
    NULL,
    NULL,
    NULL,
    1
  );
INSERT INTO
  `tbl_preguntas` (
    `COD_PREGUNTA`,
    `PREGUNTA`,
    `CREADO_POR`,
    `MODIFICADO_POR`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`,
    `ESTADO`
  )
VALUES
  (2, 'Mi primer trabajo?', NULL, NULL, NULL, NULL, 1);
INSERT INTO
  `tbl_preguntas` (
    `COD_PREGUNTA`,
    `PREGUNTA`,
    `CREADO_POR`,
    `MODIFICADO_POR`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`,
    `ESTADO`
  )
VALUES
  (3, 'Donde estudio?', NULL, NULL, NULL, NULL, 1);
INSERT INTO
  `tbl_preguntas` (
    `COD_PREGUNTA`,
    `PREGUNTA`,
    `CREADO_POR`,
    `MODIFICADO_POR`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`,
    `ESTADO`
  )
VALUES
  (4, 'Lugar favorito?', NULL, NULL, NULL, NULL, 1);
INSERT INTO
  `tbl_preguntas` (
    `COD_PREGUNTA`,
    `PREGUNTA`,
    `CREADO_POR`,
    `MODIFICADO_POR`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`,
    `ESTADO`
  )
VALUES
  (
    5,
    'Mi fecha de cumpleaños?',
    NULL,
    NULL,
    NULL,
    NULL,
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_proveedores
# ------------------------------------------------------------

INSERT INTO
  `tbl_proveedores` (
    `COD_PROVEEDOR`,
    `COD_PERSONA`,
    `NOMBRE_PROVEEDOR`,
    `NOMBRE_CONTACTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (3, 10, 'PEDRO', 'SALVADOR', NULL, NULL);
INSERT INTO
  `tbl_proveedores` (
    `COD_PROVEEDOR`,
    `COD_PERSONA`,
    `NOMBRE_PROVEEDOR`,
    `NOMBRE_CONTACTO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (4, 11, 'DIEGO', 'D', NULL, NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_roles
# ------------------------------------------------------------

INSERT INTO
  `tbl_roles` (
    `COD_ROL`,
    `NOMBRE_ROL`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    1,
    'ADMINISTRADOR',
    '2022-10-18 00:00:00',
    '2022-10-24 12:30:31'
  );
INSERT INTO
  `tbl_roles` (
    `COD_ROL`,
    `NOMBRE_ROL`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    2,
    'Gerente',
    '2022-10-18 16:53:01',
    '2022-10-18 17:32:34'
  );
INSERT INTO
  `tbl_roles` (
    `COD_ROL`,
    `NOMBRE_ROL`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    4,
    'PRUEBa',
    '2022-11-27 11:17:10',
    '2022-11-27 11:20:07'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_tipo_clientes
# ------------------------------------------------------------

INSERT INTO
  `tbl_tipo_clientes` (`COD_TIPO_CLIENTE`, `TIPO_CLIENTE`, `REBAJA`)
VALUES
  (1, 'Individual', 0);
INSERT INTO
  `tbl_tipo_clientes` (`COD_TIPO_CLIENTE`, `TIPO_CLIENTE`, `REBAJA`)
VALUES
  (3, 'Empresa', 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_usuarios
# ------------------------------------------------------------

INSERT INTO
  `tbl_usuarios` (
    `COD_USUARIO`,
    `COD_PERSONA`,
    `COD_ROL`,
    `USUARIO`,
    `EMAIL`,
    `CONTRASEÑA`,
    `IMG`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`,
    `ESTADO`,
    `PRIMER_VEZ`,
    `INTENTOS`,
    `FEC_VENCIMIENTO`
  )
VALUES
  (
    1,
    1,
    1,
    'ADMINISTRADOR',
    'KHKJ@GMAIL.COM',
    'Hola1234@',
    NULL,
    '2022-11-16 06:22:28',
    '2022-11-16 06:22:28',
    'Activo',
    0,
    2,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: tbl_ventas
# ------------------------------------------------------------

INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    11,
    3,
    '2022-11-16',
    11,
    120.00,
    12,
    134.40,
    NULL,
    '2022-11-16 17:42:27',
    '2022-11-16 17:42:27'
  );
INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    12,
    3,
    '2022-11-16',
    11,
    240.00,
    12,
    268.80,
    NULL,
    '2022-11-16 17:43:37',
    '2022-11-16 17:43:37'
  );
INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    13,
    3,
    '2022-11-28',
    11,
    276.00,
    12,
    309.12,
    NULL,
    '2022-11-28 06:24:05',
    '2022-11-28 06:24:05'
  );
INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    14,
    3,
    '2022-11-28',
    11,
    720.00,
    12,
    806.40,
    NULL,
    '2022-11-28 14:21:19',
    '2022-11-28 14:21:19'
  );
INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    15,
    11,
    '2022-12-01',
    11,
    46.00,
    12,
    51.52,
    NULL,
    '2022-12-01 13:50:49',
    '2022-12-01 13:50:49'
  );
INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    16,
    11,
    '2022-12-01',
    11,
    4.00,
    12,
    4.48,
    NULL,
    '2022-12-01 14:51:27',
    '2022-12-01 14:51:27'
  );
INSERT INTO
  `tbl_ventas` (
    `COD_VENTA`,
    `COD_CLIENTE`,
    `FECHA`,
    `NUM_FACTURA`,
    `SUB_TOTAL`,
    `IMPUESTO`,
    `TOT_PAGAR`,
    `COD_MET_PAGO`,
    `FEC_REGISTRO`,
    `ULT_MODIFICACION`
  )
VALUES
  (
    17,
    11,
    '2022-12-01',
    11,
    4.00,
    12,
    4.48,
    NULL,
    '2022-12-01 15:26:53',
    '2022-12-01 15:26:53'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
