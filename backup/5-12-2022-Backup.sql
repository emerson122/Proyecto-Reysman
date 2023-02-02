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
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3957 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4;

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: tbl_ventas
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_ventas` (
  `COD_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `COD_CLIENTE` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `NUM_FACTURA` int(11) NOT NULL,
  `SUB_TOTAL` decimal(10, 2) NOT NULL,
  `IMPUESTO` double NOT NULL,
  `TOT_PAGAR` decimal(10, 2) NOT NULL,
  `COD_MET_PAGO` int(11) DEFAULT NULL,
  `FEC_REGISTRO` datetime NOT NULL,
  `ULT_MODIFICACION` datetime NOT NULL,
  PRIMARY KEY (`COD_VENTA`),
  KEY `FK_VENTAS_CLIENTES_idx` (`COD_CLIENTE`),
  KEY `FK_VENTAS_MET_PAGOS_idx` (`COD_MET_PAGO`),
  CONSTRAINT `tbl_ventas_FK` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `tbl_clientes` (`COD_CLIENTE`)
) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8mb4;

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
INSERT INTO
  `tbl_backup` (
    `COD_BACKUP`,
    `NOMBRE`,
    `USUARIO_REGISTRO`,
    `FECHA_REGISTRO`
  )
VALUES
  (2, 'backup/177Backup.sql', 0, '2022-12-01');
INSERT INTO
  `tbl_backup` (
    `COD_BACKUP`,
    `NOMBRE`,
    `USUARIO_REGISTRO`,
    `FECHA_REGISTRO`
  )
VALUES
  (3, 'backup/740Backup.sql', 0, '2022-12-01');
INSERT INTO
  `tbl_backup` (
    `COD_BACKUP`,
    `NOMBRE`,
    `USUARIO_REGISTRO`,
    `FECHA_REGISTRO`
  )
VALUES
  (4, 'backup/537Backup.sql', 0, '2022-12-01');
INSERT INTO
  `tbl_backup` (
    `COD_BACKUP`,
    `NOMBRE`,
    `USUARIO_REGISTRO`,
    `FECHA_REGISTRO`
  )
VALUES
  (5, 'backup/Backup5-12-2022.sql', 0, '2022-12-05');

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
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3193,
    'INGRESO',
    '2022-12-02T00:01:28.277Z',
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
    3194,
    'INGRESO',
    '2022-12-02T00:02:34.418Z',
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
    3195,
    'SALIO',
    '2022-12-02T00:04:40.686Z',
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
    3196,
    'INGRESO',
    '2022-12-02T00:04:40.757Z',
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
    3197,
    'SALIO',
    '2022-12-02T00:04:47.293Z',
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
    3198,
    'INGRESO',
    '2022-12-02T00:04:47.356Z',
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
    3199,
    'INGRESO',
    '2022-12-02T00:10:07.689Z',
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
    3200,
    'SALIO',
    '2022-12-02T00:10:49.978Z',
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
    3201,
    'INGRESO',
    '2022-12-02T00:10:50.075Z',
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
    3202,
    'DESCARGO PDF',
    '2022-12-02T00:11:07.486Z',
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
    3203,
    'SALIO',
    '2022-12-02T00:12:05.304Z',
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
    3204,
    'INGRESO',
    '2022-12-02T00:12:05.334Z',
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
    3205,
    'DESCARGO PDF',
    '2022-12-02T00:12:39.297Z',
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
    3206,
    'SALIO',
    '2022-12-02T00:12:54.441Z',
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
    3207,
    'INGRESO',
    '2022-12-02T00:12:54.460Z',
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
    3208,
    'INSERTO',
    '2022-12-02T00:13:22.109Z',
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
    3209,
    'SALIO',
    '2022-12-02T00:14:36.215Z',
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
    3210,
    'INGRESO',
    '2022-12-02T00:14:36.263Z',
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
    3211,
    'SALIO',
    '2022-12-02T00:14:39.218Z',
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
    3212,
    'INGRESO',
    '2022-12-02T00:14:39.251Z',
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
    3213,
    'SALIO',
    '2022-12-02T00:14:46.142Z',
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
    3214,
    'INGRESO',
    '2022-12-02T00:14:46.177Z',
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
    3215,
    'DESCARGO PDF',
    '2022-12-02T00:15:21.814Z',
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
    3216,
    'SALIO',
    '2022-12-02T00:15:38.516Z',
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
    3217,
    'INGRESO',
    '2022-12-02T00:20:11.218Z',
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
    3218,
    'SALIO',
    '2022-12-02T00:20:13.218Z',
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
    3219,
    'INGRESO',
    '2022-12-02T00:20:13.266Z',
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
    3220,
    'SALIO',
    '2022-12-02T00:20:13.929Z',
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
    3221,
    'INGRESO',
    '2022-12-02T00:20:32.094Z',
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
    3222,
    'SALIO',
    '2022-12-02T00:20:32.910Z',
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
    3223,
    'INGRESO',
    '2022-12-02T00:20:32.963Z',
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
    3224,
    'SALIO',
    '2022-12-02T00:20:35.062Z',
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
    3225,
    'INGRESO',
    '2022-12-02T00:21:39.156Z',
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
    3226,
    'SALIO',
    '2022-12-02T00:21:40.431Z',
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
    3227,
    'INGRESO',
    '2022-12-02T00:22:12.154Z',
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
    3228,
    'SALIO',
    '2022-12-02T00:22:12.602Z',
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
    3229,
    'INGRESO',
    '2022-12-02T00:33:39.928Z',
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
    3230,
    'SALIO',
    '2022-12-02T00:33:40.822Z',
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
    3231,
    'INGRESO',
    '2022-12-02T00:35:17.996Z',
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
    3232,
    'SALIO',
    '2022-12-02T00:35:18.627Z',
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
    3233,
    'INGRESO',
    '2022-12-02T00:35:18.717Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3234,
    'SALIO',
    '2022-12-02T00:35:19.263Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3235,
    'INGRESO',
    '2022-12-02T00:35:19.294Z',
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
    3236,
    'SALIO',
    '2022-12-02T00:35:20.078Z',
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
    3237,
    'INGRESO',
    '2022-12-02T00:35:20.100Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3238,
    'SALIO',
    '2022-12-02T00:35:20.993Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3239,
    'INGRESO',
    '2022-12-02T00:35:21.020Z',
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
    3240,
    'SALIO',
    '2022-12-02T00:35:21.524Z',
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
    3241,
    'INGRESO',
    '2022-12-02T00:35:21.555Z',
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
    3242,
    'SALIO',
    '2022-12-02T00:35:22.287Z',
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
    3243,
    'INGRESO',
    '2022-12-02T00:35:22.325Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3244,
    'INGRESO',
    '2022-12-02T04:15:54.053Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3245,
    'INGRESO',
    '2022-12-02T12:03:12.608Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3246,
    'INGRESO',
    '2022-12-02T12:17:41.413Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3247,
    'SALIO',
    '2022-12-02T12:17:45.769Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3248,
    'INGRESO',
    '2022-12-02T12:17:45.834Z',
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
    3249,
    'INGRESO',
    '2022-12-02T12:18:06.014Z',
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
    3250,
    'INGRESO',
    '2022-12-02T12:19:19.389Z',
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
    3251,
    'INGRESO',
    '2022-12-02T13:24:14.707Z',
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
    3252,
    'INGRESO',
    '2022-12-02T17:12:32.694Z',
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
    3253,
    'SALIO',
    '2022-12-02T17:18:07.712Z',
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
    3254,
    'INGRESO',
    '2022-12-02T17:18:07.744Z',
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
    3255,
    'INGRESO',
    '2022-12-02T17:20:24.467Z',
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
    3256,
    'INGRESO',
    '2022-12-02T17:20:58.722Z',
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
    3257,
    'INGRESO',
    '2022-12-02T17:21:24.588Z',
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
    3258,
    'INGRESO',
    '2022-12-02T17:21:56.500Z',
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
    3259,
    'INGRESO',
    '2022-12-02T17:22:02.989Z',
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
    3260,
    'INGRESO',
    '2022-12-02T17:22:22.903Z',
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
    3261,
    'INGRESO',
    '2022-12-02T17:23:14.336Z',
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
    3262,
    'INGRESO',
    '2022-12-02T17:23:34.377Z',
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
    3263,
    'INGRESO',
    '2022-12-02T17:23:58.640Z',
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
    3264,
    'INGRESO',
    '2022-12-02T17:24:13.061Z',
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
    3265,
    'INGRESO',
    '2022-12-02T17:25:02.793Z',
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
    3266,
    'INGRESO',
    '2022-12-02T17:28:38.357Z',
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
    3267,
    'INGRESO',
    '2022-12-02T17:29:50.152Z',
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
    3268,
    'INGRESO',
    '2022-12-02T17:30:39.918Z',
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
    3269,
    'INGRESO',
    '2022-12-02T17:30:46.979Z',
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
    3270,
    'INGRESO',
    '2022-12-02T17:31:44.877Z',
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
    3271,
    'INGRESO',
    '2022-12-02T17:32:17.423Z',
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
    3272,
    'INGRESO',
    '2022-12-02T17:33:07.933Z',
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
    3273,
    'INGRESO',
    '2022-12-02T17:33:47.286Z',
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
    3274,
    'INGRESO',
    '2022-12-02T17:35:00.836Z',
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
    3275,
    'INGRESO',
    '2022-12-02T17:38:43.119Z',
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
    3276,
    'INGRESO',
    '2022-12-02T17:39:12.725Z',
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
    3277,
    'INGRESO',
    '2022-12-02T17:40:52.035Z',
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
    3278,
    'INGRESO',
    '2022-12-02T17:41:57.647Z',
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
    3279,
    'INGRESO',
    '2022-12-02T17:43:44.721Z',
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
    3280,
    'INGRESO',
    '2022-12-02T17:44:02.558Z',
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
    3281,
    'INGRESO',
    '2022-12-02T17:44:17.246Z',
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
    3282,
    'INGRESO',
    '2022-12-02T17:45:18.562Z',
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
    3283,
    'INGRESO',
    '2022-12-02T17:45:32.285Z',
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
    3284,
    'INGRESO',
    '2022-12-02T17:46:03.481Z',
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
    3285,
    'INGRESO',
    '2022-12-02T17:46:30.772Z',
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
    3286,
    'INGRESO',
    '2022-12-02T17:46:36.691Z',
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
    3287,
    'INGRESO',
    '2022-12-02T17:46:54.363Z',
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
    3288,
    'INGRESO',
    '2022-12-02T17:49:10.971Z',
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
    3289,
    'INGRESO',
    '2022-12-02T17:51:37.173Z',
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
    3290,
    'INGRESO',
    '2022-12-02T17:52:10.902Z',
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
    3291,
    'INGRESO',
    '2022-12-02T17:52:38.180Z',
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
    3292,
    'INGRESO',
    '2022-12-02T17:54:06.141Z',
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
    3293,
    'INGRESO',
    '2022-12-02T17:54:33.556Z',
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
    3294,
    'SALIO',
    '2022-12-02T17:54:53.996Z',
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
    3295,
    'INGRESO',
    '2022-12-02T17:54:54.046Z',
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
    3296,
    'SALIO',
    '2022-12-02T17:55:05.076Z',
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
    3297,
    'INGRESO',
    '2022-12-02T17:55:05.100Z',
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
    3298,
    'INGRESO',
    '2022-12-02T17:56:03.821Z',
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
    3299,
    'INGRESO',
    '2022-12-02T17:56:34.112Z',
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
    3300,
    'INGRESO',
    '2022-12-02T17:57:11.700Z',
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
    3301,
    'INGRESO',
    '2022-12-02T17:57:52.434Z',
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
    3302,
    'INGRESO',
    '2022-12-02T17:59:27.937Z',
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
    3303,
    'INSERTO',
    '2022-12-02T18:00:02.678Z',
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
    3304,
    'INGRESO',
    '2022-12-02T18:04:05.602Z',
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
    3305,
    'INGRESO',
    '2022-12-02T18:04:24.967Z',
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
    3306,
    'INGRESO',
    '2022-12-02T18:05:00.877Z',
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
    3307,
    'INGRESO',
    '2022-12-02T18:05:57.376Z',
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
    3308,
    'INGRESO',
    '2022-12-02T18:07:17.706Z',
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
    3309,
    'INGRESO',
    '2022-12-02T18:10:42.296Z',
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
    3310,
    'INGRESO',
    '2022-12-02T18:12:52.751Z',
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
    3311,
    'SALIO',
    '2022-12-02T18:13:02.524Z',
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
    3312,
    'INGRESO',
    '2022-12-02T18:13:02.584Z',
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
    3313,
    'SALIO',
    '2022-12-02T18:13:14.586Z',
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
    3314,
    'INGRESO',
    '2022-12-02T18:13:14.606Z',
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
    3315,
    'SALIO',
    '2022-12-02T18:13:21.811Z',
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
    3316,
    'INGRESO',
    '2022-12-02T18:13:21.842Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3317,
    'SALIO',
    '2022-12-02T18:13:27.518Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3318,
    'INGRESO',
    '2022-12-02T18:13:27.568Z',
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
    3319,
    'SALIO',
    '2022-12-02T18:13:38.920Z',
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
    3320,
    'INGRESO',
    '2022-12-02T18:13:38.940Z',
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
    3321,
    'SALIO',
    '2022-12-02T18:13:39.979Z',
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
    3322,
    'INGRESO',
    '2022-12-02T18:13:40.016Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3323,
    'SALIO',
    '2022-12-02T18:13:40.954Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3324,
    'INGRESO',
    '2022-12-02T18:13:41.015Z',
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
    3325,
    'SALIO',
    '2022-12-02T18:14:20.044Z',
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
    3326,
    'INGRESO',
    '2022-12-02T18:14:20.099Z',
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
    3327,
    'INGRESO',
    '2022-12-02T18:14:21.537Z',
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
    3328,
    'SALIO',
    '2022-12-02T18:14:23.548Z',
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
    3329,
    'INGRESO',
    '2022-12-02T18:14:23.617Z',
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
    3330,
    'INGRESO',
    '2022-12-02T18:15:23.261Z',
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
    3331,
    'INGRESO',
    '2022-12-02T18:15:34.813Z',
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
    3332,
    'SALIO',
    '2022-12-02T18:16:27.458Z',
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
    3333,
    'INGRESO',
    '2022-12-02T18:16:27.472Z',
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
    3334,
    'SALIO',
    '2022-12-02T18:16:42.680Z',
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
    3335,
    'INGRESO',
    '2022-12-02T18:16:42.705Z',
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
    3336,
    'SALIO',
    '2022-12-02T18:16:53.402Z',
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
    3337,
    'INGRESO',
    '2022-12-02T18:16:53.427Z',
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
    3338,
    'SALIO',
    '2022-12-02T18:17:03.863Z',
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
    3339,
    'INGRESO',
    '2022-12-02T18:17:03.873Z',
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
    3340,
    'INGRESO',
    '2022-12-02T19:07:22.906Z',
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
    3341,
    'SALIO',
    '2022-12-02T19:09:32.224Z',
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
    3342,
    'INGRESO',
    '2022-12-02T19:09:32.309Z',
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
    3343,
    'SALIO',
    '2022-12-02T19:09:33.681Z',
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
    3344,
    'INGRESO',
    '2022-12-02T19:09:33.698Z',
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
    3345,
    'SALIO',
    '2022-12-02T19:09:36.193Z',
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
    3346,
    'INGRESO',
    '2022-12-02T19:09:36.259Z',
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
    3347,
    'SALIO',
    '2022-12-02T19:10:18.756Z',
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
    3348,
    'INGRESO',
    '2022-12-02T19:10:18.894Z',
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
    3349,
    'INGRESO',
    '2022-12-02T19:10:32.072Z',
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
    3350,
    'SALIO',
    '2022-12-02T19:11:01.641Z',
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
    3351,
    'INGRESO',
    '2022-12-02T19:11:01.732Z',
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
    3352,
    'SALIO',
    '2022-12-02T19:11:02.194Z',
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
    3353,
    'INGRESO',
    '2022-12-02T19:11:02.252Z',
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
    3354,
    'SALIO',
    '2022-12-02T19:11:03.486Z',
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
    3355,
    'INGRESO',
    '2022-12-02T19:11:03.538Z',
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
    3356,
    'SALIO',
    '2022-12-02T19:11:13.272Z',
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
    3357,
    'INGRESO',
    '2022-12-02T19:11:13.325Z',
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
    3358,
    'SALIO',
    '2022-12-02T19:12:33.540Z',
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
    3359,
    'INGRESO',
    '2022-12-02T19:12:33.566Z',
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
    3360,
    'SALIO',
    '2022-12-02T19:12:59.000Z',
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
    3361,
    'INGRESO',
    '2022-12-02T19:12:59.092Z',
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
    3362,
    'SALIO',
    '2022-12-02T19:12:59.581Z',
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
    3363,
    'INGRESO',
    '2022-12-02T19:12:59.677Z',
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
    3364,
    'ACTUALIZO',
    '2022-12-02T19:13:50.161Z',
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
    3365,
    'SALIO',
    '2022-12-02T19:14:01.317Z',
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
    3366,
    'INGRESO',
    '2022-12-02T19:14:01.423Z',
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
    3367,
    'DESCARGO PDF',
    '2022-12-02T19:14:02.632Z',
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
    3368,
    'SALIO',
    '2022-12-02T19:14:27.633Z',
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
    3369,
    'INGRESO',
    '2022-12-02T19:14:27.660Z',
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
    3370,
    'SALIO',
    '2022-12-02T19:14:30.394Z',
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
    3371,
    'INGRESO',
    '2022-12-02T19:14:30.418Z',
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
    3372,
    'SALIO',
    '2022-12-02T19:14:37.490Z',
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
    3373,
    'INGRESO',
    '2022-12-02T19:14:37.510Z',
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
    3374,
    'INGRESO',
    '2022-12-02T19:15:28.877Z',
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
    3375,
    'INGRESO',
    '2022-12-02T19:16:27.736Z',
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
    3376,
    'INGRESO',
    '2022-12-02T19:17:27.417Z',
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
    3377,
    'DESCARGO PDF',
    '2022-12-02T19:17:29.553Z',
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
    3378,
    'INGRESO',
    '2022-12-02T19:18:13.930Z',
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
    3379,
    'DESCARGO PDF',
    '2022-12-02T19:18:22.564Z',
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
    3380,
    'INGRESO',
    '2022-12-02T19:20:30.108Z',
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
    3381,
    'SALIO',
    '2022-12-02T19:20:36.266Z',
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
    3382,
    'INGRESO',
    '2022-12-02T19:20:36.331Z',
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
    3383,
    'SALIO',
    '2022-12-02T19:20:38.186Z',
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
    3384,
    'INGRESO',
    '2022-12-02T19:20:38.291Z',
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
    3385,
    'INGRESO',
    '2022-12-02T19:21:12.853Z',
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
    3386,
    'INGRESO',
    '2022-12-02T19:22:07.677Z',
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
    3387,
    'INGRESO',
    '2022-12-02T19:24:04.125Z',
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
    3388,
    'SALIO',
    '2022-12-02T19:24:34.556Z',
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
    3389,
    'INGRESO',
    '2022-12-02T19:24:34.604Z',
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
    3390,
    'SALIO',
    '2022-12-02T19:24:41.738Z',
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
    3391,
    'INGRESO',
    '2022-12-02T19:24:41.823Z',
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
    3392,
    'INGRESO',
    '2022-12-02T19:25:42.413Z',
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
    3393,
    'SALIO',
    '2022-12-02T19:26:38.063Z',
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
    3394,
    'INGRESO',
    '2022-12-02T19:26:38.094Z',
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
    3395,
    'DESCARGO PDF',
    '2022-12-02T19:26:39.546Z',
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
    3396,
    'SALIO',
    '2022-12-02T19:26:53.670Z',
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
    3397,
    'INGRESO',
    '2022-12-02T19:26:53.767Z',
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
    3398,
    'SALIO',
    '2022-12-02T19:26:54.645Z',
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
    3399,
    'INGRESO',
    '2022-12-02T19:28:21.914Z',
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
    3400,
    'SALIO',
    '2022-12-02T19:28:24.734Z',
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
    3401,
    'INGRESO',
    '2022-12-02T19:28:24.790Z',
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
    3402,
    'DESCARGO PDF',
    '2022-12-02T19:28:25.675Z',
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
    3403,
    'SALIO',
    '2022-12-02T19:28:33.059Z',
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
    3404,
    'INGRESO',
    '2022-12-02T19:28:33.107Z',
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
    3405,
    'SALIO',
    '2022-12-02T19:28:34.378Z',
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
    3406,
    'INGRESO',
    '2022-12-02T19:28:34.398Z',
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
    3407,
    'INGRESO',
    '2022-12-02T19:33:18.714Z',
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
    3408,
    'SALIO',
    '2022-12-02T19:33:33.363Z',
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
    3409,
    'INGRESO',
    '2022-12-02T19:33:33.424Z',
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
    3410,
    'INGRESO',
    '2022-12-02T19:34:00.829Z',
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
    3411,
    'INGRESO',
    '2022-12-02T19:35:03.698Z',
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
    3412,
    'INGRESO',
    '2022-12-02T19:36:39.759Z',
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
    3413,
    'INGRESO',
    '2022-12-02T19:37:25.273Z',
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
    3414,
    'INGRESO',
    '2022-12-02T19:39:34.866Z',
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
    3415,
    'INGRESO',
    '2022-12-02T19:40:56.017Z',
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
    3416,
    'INGRESO',
    '2022-12-02T19:41:37.760Z',
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
    3417,
    'INGRESO',
    '2022-12-02T19:45:51.246Z',
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
    3418,
    'INGRESO',
    '2022-12-02T19:46:55.496Z',
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
    3419,
    'INSERTO',
    '2022-12-02T19:47:05.480Z',
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
    3420,
    'INGRESO',
    '2022-12-02T19:48:20.455Z',
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
    3421,
    'INGRESO',
    '2022-12-02T19:48:44.285Z',
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
    3422,
    'INGRESO',
    '2022-12-02T19:50:49.182Z',
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
    3423,
    'SALIO',
    '2022-12-02T19:50:53.170Z',
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
    3424,
    'INGRESO',
    '2022-12-02T19:50:53.259Z',
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
    3425,
    'SALIO',
    '2022-12-02T19:50:54.108Z',
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
    3426,
    'INGRESO',
    '2022-12-02T19:50:54.173Z',
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
    3427,
    'INGRESO',
    '2022-12-02T19:53:47.658Z',
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
    3428,
    'SALIO',
    '2022-12-02T19:56:09.654Z',
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
    3429,
    'INGRESO',
    '2022-12-02T19:56:09.719Z',
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
    3430,
    'DESCARGO PDF',
    '2022-12-02T19:56:11.994Z',
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
    3431,
    'SALIO',
    '2022-12-02T19:58:21.567Z',
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
    3432,
    'INGRESO',
    '2022-12-02T19:58:21.637Z',
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
    3433,
    'INGRESO',
    '2022-12-02T20:00:30.993Z',
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
    3434,
    'INGRESO',
    '2022-12-02T20:00:35.323Z',
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
    3435,
    'SALIO',
    '2022-12-02T20:01:01.258Z',
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
    3436,
    'INGRESO',
    '2022-12-02T20:01:01.386Z',
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
    3437,
    'SALIO',
    '2022-12-02T20:01:11.338Z',
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
    3438,
    'INGRESO',
    '2022-12-02T20:01:11.413Z',
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
    3439,
    'INGRESO',
    '2022-12-02T20:01:37.221Z',
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
    3440,
    'INGRESO',
    '2022-12-02T20:03:59.787Z',
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
    3441,
    'INGRESO',
    '2022-12-02T20:04:36.053Z',
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
    3442,
    'INGRESO',
    '2022-12-02T20:05:16.395Z',
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
    3443,
    'INGRESO',
    '2022-12-02T20:05:55.549Z',
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
    3444,
    'INGRESO',
    '2022-12-02T20:07:08.360Z',
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
    3445,
    'INGRESO',
    '2022-12-02T20:08:07.562Z',
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
    3446,
    'INGRESO',
    '2022-12-02T20:08:53.591Z',
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
    3447,
    'INGRESO',
    '2022-12-02T20:09:00.855Z',
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
    3448,
    'SALIO',
    '2022-12-02T20:10:52.208Z',
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
    3449,
    'INGRESO',
    '2022-12-02T20:10:52.268Z',
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
    3450,
    'INGRESO',
    '2022-12-02T20:11:43.864Z',
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
    3451,
    'INGRESO',
    '2022-12-02T20:12:05.369Z',
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
    3452,
    'SALIO',
    '2022-12-02T20:12:42.123Z',
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
    3453,
    'INGRESO',
    '2022-12-02T20:12:42.139Z',
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
    3454,
    'SALIO',
    '2022-12-02T20:12:47.324Z',
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
    3455,
    'INGRESO',
    '2022-12-02T20:12:47.360Z',
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
    3456,
    'SALIO',
    '2022-12-02T20:13:23.616Z',
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
    3457,
    'INGRESO',
    '2022-12-02T20:13:23.704Z',
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
    3458,
    'ACTUALIZO',
    '2022-12-02T20:13:34.354Z',
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
    3459,
    'SALIO',
    '2022-12-02T20:13:38.732Z',
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
    3460,
    'INGRESO',
    '2022-12-02T20:13:38.780Z',
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
    3461,
    'INGRESO',
    '2022-12-02T20:14:09.397Z',
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
    3462,
    'SALIO',
    '2022-12-02T20:15:05.198Z',
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
    3463,
    'INGRESO',
    '2022-12-02T20:15:05.256Z',
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
    3464,
    'INSERTO',
    '2022-12-02T20:15:41.176Z',
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
    3465,
    'INGRESO',
    '2022-12-02T20:16:41.984Z',
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
    3466,
    'INSERTO',
    '2022-12-02T20:16:59.663Z',
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
    3467,
    'INGRESO',
    '2022-12-02T20:17:42.938Z',
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
    3468,
    'INSERTO',
    '2022-12-02T20:18:04.819Z',
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
    3469,
    'SALIO',
    '2022-12-02T20:18:10.285Z',
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
    3470,
    'INGRESO',
    '2022-12-02T20:18:10.373Z',
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
    3471,
    'INSERTO',
    '2022-12-02T20:18:18.477Z',
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
    3472,
    'SALIO',
    '2022-12-02T20:18:30.767Z',
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
    3473,
    'INGRESO',
    '2022-12-02T20:18:30.785Z',
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
    3474,
    'SALIO',
    '2022-12-02T20:18:42.284Z',
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
    3475,
    'INGRESO',
    '2022-12-02T20:18:42.353Z',
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
    3476,
    'INGRESO',
    '2022-12-02T20:22:01.160Z',
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
    3477,
    'INGRESO',
    '2022-12-02T20:23:42.425Z',
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
    3478,
    'INGRESO',
    '2022-12-02T20:24:04.326Z',
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
    3479,
    'INSERTO',
    '2022-12-02T20:24:18.694Z',
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
    3480,
    'INGRESO',
    '2022-12-02T20:25:04.390Z',
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
    3481,
    'INGRESO',
    '2022-12-02T20:26:07.462Z',
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
    3482,
    'INGRESO',
    '2022-12-02T20:26:38.382Z',
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
    3483,
    'INGRESO',
    '2022-12-02T20:27:07.704Z',
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
    3484,
    'INGRESO',
    '2022-12-02T20:27:58.380Z',
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
    3485,
    'INSERTO',
    '2022-12-02T20:28:16.486Z',
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
    3486,
    'INSERTO',
    '2022-12-02T20:29:45.862Z',
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
    3487,
    'INSERTO',
    '2022-12-02T20:30:33.101Z',
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
    3488,
    'INSERTO',
    '2022-12-02T20:32:06.680Z',
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
    3489,
    'INSERTO',
    '2022-12-02T20:32:35.814Z',
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
    3490,
    'INSERTO',
    '2022-12-02T20:33:30.535Z',
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
    3491,
    'INSERTO',
    '2022-12-02T20:34:02.830Z',
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
    3492,
    'INGRESO',
    '2022-12-02T20:35:35.413Z',
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
    3493,
    'INGRESO',
    '2022-12-02T20:36:01.887Z',
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
    3494,
    'SALIO',
    '2022-12-02T20:36:27.581Z',
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
    3495,
    'INGRESO',
    '2022-12-02T20:36:27.651Z',
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
    3496,
    'ACTUALIZO',
    '2022-12-02T20:37:05.317Z',
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
    3497,
    'SALIO',
    '2022-12-02T20:37:08.982Z',
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
    3498,
    'INGRESO',
    '2022-12-02T20:37:09.037Z',
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
    3499,
    'SALIO',
    '2022-12-02T20:37:50.125Z',
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
    3500,
    'INGRESO',
    '2022-12-02T20:37:50.157Z',
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
    3501,
    'INSERTO',
    '2022-12-02T20:38:16.880Z',
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
    3502,
    'SALIO',
    '2022-12-02T20:38:54.036Z',
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
    3503,
    'INGRESO',
    '2022-12-02T20:38:54.078Z',
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
    3504,
    'SALIO',
    '2022-12-02T20:38:57.569Z',
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
    3505,
    'INGRESO',
    '2022-12-02T20:38:57.633Z',
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
    3506,
    'SALIO',
    '2022-12-02T20:39:03.621Z',
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
    3507,
    'INGRESO',
    '2022-12-02T20:39:03.650Z',
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
    3508,
    'SALIO',
    '2022-12-02T20:39:38.075Z',
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
    3509,
    'INGRESO',
    '2022-12-02T20:39:38.096Z',
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
    3510,
    'SALIO',
    '2022-12-02T20:39:45.729Z',
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
    3511,
    'INGRESO',
    '2022-12-02T20:39:45.771Z',
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
    3512,
    'SALIO',
    '2022-12-02T20:39:49.014Z',
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
    3513,
    'INGRESO',
    '2022-12-02T20:39:49.050Z',
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
    3514,
    'SALIO',
    '2022-12-02T20:40:10.272Z',
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
    3515,
    'INGRESO',
    '2022-12-02T20:40:10.370Z',
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
    3516,
    'SALIO',
    '2022-12-02T20:40:18.044Z',
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
    3517,
    'INGRESO',
    '2022-12-02T20:40:18.089Z',
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
    3518,
    'SALIO',
    '2022-12-02T20:40:28.834Z',
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
    3519,
    'INGRESO',
    '2022-12-02T20:40:28.905Z',
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
    3520,
    'SALIO',
    '2022-12-02T20:41:34.415Z',
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
    3521,
    'INGRESO',
    '2022-12-02T20:41:34.441Z',
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
    3522,
    'SALIO',
    '2022-12-02T20:41:35.298Z',
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
    3523,
    'INGRESO',
    '2022-12-02T20:41:35.323Z',
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
    3524,
    'SALIO',
    '2022-12-02T20:41:36.951Z',
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
    3525,
    'INGRESO',
    '2022-12-02T20:41:36.988Z',
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
    3526,
    'SALIO',
    '2022-12-02T20:41:37.663Z',
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
    3527,
    'INGRESO',
    '2022-12-02T20:41:37.693Z',
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
    3528,
    'SALIO',
    '2022-12-02T20:41:38.315Z',
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
    3529,
    'INGRESO',
    '2022-12-02T20:41:38.328Z',
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
    3530,
    'INGRESO',
    '2022-12-02T20:43:55.604Z',
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
    3531,
    'INGRESO',
    '2022-12-02T20:45:20.279Z',
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
    3532,
    'INGRESO',
    '2022-12-02T20:45:28.618Z',
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
    3533,
    'INGRESO',
    '2022-12-02T20:45:39.742Z',
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
    3534,
    'INGRESO',
    '2022-12-02T20:46:30.168Z',
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
    3535,
    'SALIO',
    '2022-12-02T20:46:34.471Z',
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
    3536,
    'INGRESO',
    '2022-12-02T20:46:34.546Z',
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
    3537,
    'INGRESO',
    '2022-12-02T20:47:38.238Z',
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
    3538,
    'SALIO',
    '2022-12-02T20:48:03.296Z',
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
    3539,
    'INGRESO',
    '2022-12-02T20:48:03.360Z',
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
    3540,
    'SALIO',
    '2022-12-02T20:48:19.915Z',
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
    3541,
    'INGRESO',
    '2022-12-02T20:48:19.973Z',
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
    3542,
    'INGRESO',
    '2022-12-02T20:52:45.413Z',
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
    3543,
    'INGRESO',
    '2022-12-02T20:54:25.899Z',
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
    3544,
    'INGRESO',
    '2022-12-02T20:55:38.322Z',
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
    3545,
    'INGRESO',
    '2022-12-02T20:56:21.119Z',
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
    3546,
    'INGRESO',
    '2022-12-02T21:01:25.528Z',
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
    3547,
    'INGRESO',
    '2022-12-02T21:02:11.177Z',
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
    3548,
    'INGRESO',
    '2022-12-02T21:03:44.811Z',
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
    3549,
    'INGRESO',
    '2022-12-02T21:04:03.118Z',
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
    3550,
    'INGRESO',
    '2022-12-02T21:04:27.700Z',
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
    3551,
    'INGRESO',
    '2022-12-02T21:06:23.470Z',
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
    3552,
    'INGRESO',
    '2022-12-02T21:08:07.282Z',
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
    3553,
    'INGRESO',
    '2022-12-02T21:09:29.895Z',
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
    3554,
    'INGRESO',
    '2022-12-02T21:09:58.126Z',
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
    3555,
    'INGRESO',
    '2022-12-02T21:10:26.109Z',
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
    3556,
    'INGRESO',
    '2022-12-02T21:16:43.669Z',
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
    3557,
    'INGRESO',
    '2022-12-02T21:19:18.474Z',
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
    3558,
    'SALIO',
    '2022-12-02T21:19:52.255Z',
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
    3559,
    'INGRESO',
    '2022-12-02T21:19:52.334Z',
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
    3560,
    'SALIO',
    '2022-12-02T21:21:19.246Z',
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
    3561,
    'INGRESO',
    '2022-12-02T21:21:19.267Z',
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
    3562,
    'DESCARGO PDF',
    '2022-12-02T21:21:32.720Z',
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
    3563,
    'DESCARGO PDF',
    '2022-12-02T21:23:59.321Z',
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
    3564,
    'INGRESO',
    '2022-12-02T21:25:51.798Z',
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
    3565,
    'DESCARGO PDF',
    '2022-12-02T21:25:55.356Z',
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
    3566,
    'DESCARGO PDF',
    '2022-12-02T21:28:24.393Z',
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
    3567,
    'INGRESO',
    '2022-12-02T21:30:20.686Z',
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
    3568,
    'SALIO',
    '2022-12-02T21:30:29.995Z',
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
    3569,
    'INGRESO',
    '2022-12-02T21:30:30.075Z',
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
    3570,
    'SALIO',
    '2022-12-02T21:30:32.508Z',
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
    3571,
    'INGRESO',
    '2022-12-02T21:30:32.613Z',
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
    3572,
    'SALIO',
    '2022-12-02T21:30:32.981Z',
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
    3573,
    'INGRESO',
    '2022-12-02T21:30:33.084Z',
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
    3574,
    'SALIO',
    '2022-12-02T21:30:39.167Z',
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
    3575,
    'INGRESO',
    '2022-12-02T21:30:39.262Z',
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
    3576,
    'SALIO',
    '2022-12-02T21:30:52.639Z',
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
    3577,
    'INGRESO',
    '2022-12-02T21:30:52.769Z',
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
    3578,
    'SALIO',
    '2022-12-02T21:30:52.942Z',
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
    3579,
    'INGRESO',
    '2022-12-02T21:30:53.042Z',
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
    3580,
    'SALIO',
    '2022-12-02T21:30:58.751Z',
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
    3581,
    'INGRESO',
    '2022-12-02T21:30:58.820Z',
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
    3582,
    'SALIO',
    '2022-12-02T21:31:11.714Z',
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
    3583,
    'INGRESO',
    '2022-12-02T21:31:11.755Z',
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
    3584,
    'INGRESO',
    '2022-12-02T21:34:44.271Z',
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
    3585,
    'SALIO',
    '2022-12-02T21:39:48.701Z',
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
    3586,
    'INGRESO',
    '2022-12-02T21:39:48.740Z',
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
    3587,
    'INGRESO',
    '2022-12-02T21:39:55.469Z',
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
    3588,
    'SALIO',
    '2022-12-02T21:40:09.983Z',
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
    3589,
    'INGRESO',
    '2022-12-02T21:40:10.027Z',
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
    3590,
    'SALIO',
    '2022-12-02T21:40:10.852Z',
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
    3591,
    'INGRESO',
    '2022-12-02T21:40:10.918Z',
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
    3592,
    'SALIO',
    '2022-12-02T21:40:11.728Z',
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
    3593,
    'INGRESO',
    '2022-12-02T21:40:11.754Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3594,
    'SALIO',
    '2022-12-02T21:40:12.562Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3595,
    'INGRESO',
    '2022-12-02T21:40:12.588Z',
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
    3596,
    'SALIO',
    '2022-12-02T21:40:17.717Z',
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
    3597,
    'INGRESO',
    '2022-12-02T21:40:17.725Z',
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
  (3598, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (3599, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3600,
    'SALIO',
    '2022-12-02T21:43:02.218Z',
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
    3601,
    'INGRESO',
    '2022-12-02T21:43:02.237Z',
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
    3602,
    'DESCARGO PDF',
    '2022-12-02T21:43:23.707Z',
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
    3603,
    'SALIO',
    '2022-12-02T21:43:48.280Z',
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
    3604,
    'INGRESO',
    '2022-12-02T21:43:48.298Z',
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
    3605,
    'SALIO',
    '2022-12-02T21:43:49.905Z',
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
    3606,
    'INGRESO',
    '2022-12-02T21:43:49.915Z',
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
    3607,
    'SALIO',
    '2022-12-02T21:44:15.944Z',
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
    3608,
    'INGRESO',
    '2022-12-02T21:44:16.020Z',
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
    3609,
    'INSERTO',
    '2022-12-02T21:44:24.718Z',
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
    3610,
    'SALIO',
    '2022-12-02T21:44:32.097Z',
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
    3611,
    'INGRESO',
    '2022-12-02T21:44:32.175Z',
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
    3612,
    'SALIO',
    '2022-12-02T21:44:42.257Z',
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
    3613,
    'INGRESO',
    '2022-12-02T21:44:42.314Z',
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
    3614,
    'SALIO',
    '2022-12-02T21:44:47.113Z',
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
    3615,
    'INGRESO',
    '2022-12-02T21:44:47.163Z',
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
    3616,
    'SALIO',
    '2022-12-02T21:45:00.700Z',
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
    3617,
    'INGRESO',
    '2022-12-02T21:45:00.758Z',
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
    3618,
    'SALIO',
    '2022-12-02T21:45:01.642Z',
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
    3619,
    'INGRESO',
    '2022-12-02T21:45:01.665Z',
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
    3620,
    'SALIO',
    '2022-12-02T21:45:02.385Z',
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
    3621,
    'INGRESO',
    '2022-12-02T21:45:02.400Z',
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
    3622,
    'SALIO',
    '2022-12-02T21:45:09.595Z',
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
    3623,
    'INGRESO',
    '2022-12-02T21:45:09.626Z',
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
    3624,
    'SALIO',
    '2022-12-02T21:45:10.998Z',
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
    3625,
    'INGRESO',
    '2022-12-02T21:45:11.029Z',
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
    3626,
    'SALIO',
    '2022-12-02T21:45:12.280Z',
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
    3627,
    'INGRESO',
    '2022-12-02T21:45:12.302Z',
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
    3628,
    'SALIO',
    '2022-12-02T21:45:12.930Z',
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
    3629,
    'INGRESO',
    '2022-12-02T21:45:13.048Z',
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
    3630,
    'SALIO',
    '2022-12-02T21:45:15.794Z',
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
    3631,
    'INGRESO',
    '2022-12-02T21:45:15.824Z',
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
    3632,
    'SALIO',
    '2022-12-02T21:45:20.246Z',
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
    3633,
    'INGRESO',
    '2022-12-02T21:45:20.261Z',
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
    3634,
    'SALIO',
    '2022-12-02T21:45:26.355Z',
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
    3635,
    'INGRESO',
    '2022-12-02T21:45:26.383Z',
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
    3636,
    'SALIO',
    '2022-12-02T21:46:32.716Z',
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
    3637,
    'INGRESO',
    '2022-12-02T21:46:32.742Z',
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
    3638,
    'SALIO',
    '2022-12-02T21:46:36.494Z',
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
    3639,
    'INGRESO',
    '2022-12-02T21:46:36.524Z',
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
    3640,
    'SALIO',
    '2022-12-02T21:46:40.149Z',
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
    3641,
    'INGRESO',
    '2022-12-02T21:46:40.169Z',
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
    3642,
    'SALIO',
    '2022-12-02T21:46:40.696Z',
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
    3643,
    'INGRESO',
    '2022-12-02T21:46:40.701Z',
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
    3644,
    'SALIO',
    '2022-12-02T21:46:41.267Z',
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
    3645,
    'INGRESO',
    '2022-12-02T21:46:41.295Z',
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
    3646,
    'SALIO',
    '2022-12-02T21:46:44.464Z',
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
    3647,
    'INGRESO',
    '2022-12-02T21:47:18.227Z',
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
    3648,
    'SALIO',
    '2022-12-02T21:47:42.586Z',
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
    3649,
    'INGRESO',
    '2022-12-02T21:47:42.595Z',
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
    3650,
    'SALIO',
    '2022-12-02T21:47:50.954Z',
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
    3651,
    'INGRESO',
    '2022-12-02T21:47:50.963Z',
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
    3652,
    'SALIO',
    '2022-12-02T21:48:41.772Z',
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
    3653,
    'INGRESO',
    '2022-12-02T21:48:41.776Z',
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
    3654,
    'SALIO',
    '2022-12-02T21:48:42.393Z',
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
    3655,
    'INGRESO',
    '2022-12-02T21:48:42.428Z',
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
    3656,
    'SALIO',
    '2022-12-02T21:48:44.836Z',
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
    3657,
    'INGRESO',
    '2022-12-02T21:48:44.840Z',
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
    3658,
    'SALIO',
    '2022-12-02T21:49:05.771Z',
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
    3659,
    'INGRESO',
    '2022-12-02T21:49:05.780Z',
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
    3660,
    'SALIO',
    '2022-12-02T21:49:08.500Z',
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
    3661,
    'INGRESO',
    '2022-12-02T21:49:08.502Z',
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
    3662,
    'SALIO',
    '2022-12-02T21:49:10.388Z',
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
    3663,
    'INGRESO',
    '2022-12-02T21:49:10.392Z',
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
    3664,
    'SALIO',
    '2022-12-02T21:49:11.717Z',
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
    3665,
    'INGRESO',
    '2022-12-02T21:49:11.722Z',
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
    3666,
    'SALIO',
    '2022-12-02T21:49:26.138Z',
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
    3667,
    'INGRESO',
    '2022-12-02T21:49:26.146Z',
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
    3668,
    'SALIO',
    '2022-12-02T21:49:30.308Z',
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
    3669,
    'INGRESO',
    '2022-12-02T21:49:30.317Z',
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
    3670,
    'INGRESO',
    '2022-12-02T21:53:20.682Z',
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
    3671,
    'INGRESO',
    '2022-12-02T21:54:53.429Z',
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
    3672,
    'INGRESO',
    '2022-12-02T21:55:13.182Z',
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
    3673,
    'INGRESO',
    '2022-12-02T21:58:13.678Z',
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
    3674,
    'INGRESO',
    '2022-12-02T21:58:27.740Z',
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
    3675,
    'INGRESO',
    '2022-12-02T21:59:03.581Z',
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
    3676,
    'INGRESO',
    '2022-12-02T21:59:22.475Z',
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
    3677,
    'INGRESO',
    '2022-12-02T21:59:59.023Z',
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
    3678,
    'INGRESO',
    '2022-12-02T22:05:01.265Z',
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
    3679,
    'SALIO',
    '2022-12-02T22:05:31.830Z',
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
    3680,
    'INGRESO',
    '2022-12-02T22:05:31.837Z',
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
    3681,
    'INSERTO',
    '2022-12-02T22:06:30.489Z',
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
    3682,
    'SALIO',
    '2022-12-02T22:06:33.487Z',
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
    3683,
    'INGRESO',
    '2022-12-02T22:06:33.497Z',
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
    3684,
    'INGRESO',
    '2022-12-02T22:08:55.128Z',
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
    3685,
    'INGRESO',
    '2022-12-02T22:25:14.765Z',
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
    3686,
    'INGRESO',
    '2022-12-03T15:31:49.355Z',
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
    3687,
    'INGRESO',
    '2022-12-03T15:32:11.058Z',
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
    3688,
    'INGRESO',
    '2022-12-03T15:35:47.589Z',
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
    3689,
    'INGRESO',
    '2022-12-03T15:37:14.512Z',
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
    3690,
    'INGRESO',
    '2022-12-03T15:38:10.901Z',
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
    3691,
    'INGRESO',
    '2022-12-03T15:38:53.238Z',
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
    3692,
    'INGRESO',
    '2022-12-03T15:40:26.107Z',
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
    3693,
    'INGRESO',
    '2022-12-03T15:45:35.803Z',
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
    3694,
    'INGRESO',
    '2022-12-03T15:49:27.467Z',
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
    3695,
    'INGRESO',
    '2022-12-03T15:50:39.867Z',
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
    3696,
    'INGRESO',
    '2022-12-03T15:51:46.053Z',
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
    3697,
    'INGRESO',
    '2022-12-03T15:52:19.916Z',
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
    3698,
    'INGRESO',
    '2022-12-03T15:55:04.878Z',
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
    3699,
    'INGRESO',
    '2022-12-03T15:55:53.589Z',
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
    3700,
    'INGRESO',
    '2022-12-03T15:56:45.126Z',
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
    3701,
    'INGRESO',
    '2022-12-03T15:57:12.739Z',
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
    3702,
    'INSERTO',
    '2022-12-03T15:59:21.718Z',
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
    3703,
    'INGRESO',
    '2022-12-03T15:59:40.685Z',
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
    3704,
    'INGRESO',
    '2022-12-03T16:00:29.030Z',
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
    3705,
    'INGRESO',
    '2022-12-03T16:00:51.090Z',
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
    3706,
    'INGRESO',
    '2022-12-03T16:08:54.362Z',
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
    3707,
    'INGRESO',
    '2022-12-03T16:15:05.395Z',
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
    3708,
    'INGRESO',
    '2022-12-03T16:15:59.277Z',
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
    3709,
    'INGRESO',
    '2022-12-03T16:16:36.051Z',
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
    3710,
    'INGRESO',
    '2022-12-03T16:17:07.033Z',
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
    3711,
    'INGRESO',
    '2022-12-03T16:17:17.843Z',
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
    3712,
    'INGRESO',
    '2022-12-03T16:17:34.652Z',
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
    3713,
    'INGRESO',
    '2022-12-03T16:20:54.517Z',
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
    3714,
    'INGRESO',
    '2022-12-03T16:25:24.080Z',
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
    3715,
    'INGRESO',
    '2022-12-03T16:28:22.348Z',
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
    3716,
    'INGRESO',
    '2022-12-03T16:29:11.920Z',
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
    3717,
    'INGRESO',
    '2022-12-03T16:29:29.740Z',
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
    3718,
    'INGRESO',
    '2022-12-03T16:29:59.083Z',
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
    3719,
    'INSERTO',
    '2022-12-03T16:30:27.439Z',
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
    3720,
    'INGRESO',
    '2022-12-03T16:31:24.221Z',
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
    3721,
    'INSERTO',
    '2022-12-03T16:31:53.009Z',
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
    3722,
    'INGRESO',
    '2022-12-03T16:34:23.422Z',
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
    3723,
    'INGRESO',
    '2022-12-03T16:35:09.239Z',
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
    3724,
    'INGRESO',
    '2022-12-03T16:35:27.216Z',
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
    3725,
    'INGRESO',
    '2022-12-03T16:35:36.624Z',
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
    3726,
    'INGRESO',
    '2022-12-03T16:36:14.917Z',
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
    3727,
    'INGRESO',
    '2022-12-03T16:36:39.702Z',
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
    3728,
    'INSERTO',
    '2022-12-03T16:37:05.700Z',
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
    3729,
    'INGRESO',
    '2022-12-03T16:37:22.182Z',
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
    3730,
    'INGRESO',
    '2022-12-03T16:38:19.083Z',
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
    3731,
    'INGRESO',
    '2022-12-03T16:38:25.094Z',
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
    3732,
    'INSERTO',
    '2022-12-03T16:39:16.805Z',
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
    3733,
    'INGRESO',
    '2022-12-03T16:43:53.747Z',
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
    3734,
    'INGRESO',
    '2022-12-03T16:44:07.011Z',
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
    3735,
    'INGRESO',
    '2022-12-03T16:45:09.258Z',
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
    3736,
    'INGRESO',
    '2022-12-03T16:46:17.160Z',
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
    3737,
    'INGRESO',
    '2022-12-03T16:46:39.240Z',
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
    3738,
    'INGRESO',
    '2022-12-03T16:50:56.216Z',
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
    3739,
    'INGRESO',
    '2022-12-03T16:51:30.548Z',
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
    3740,
    'INSERTO',
    '2022-12-03T16:52:12.714Z',
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
    3741,
    'INGRESO',
    '2022-12-03T16:52:28.199Z',
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
    3742,
    'INGRESO',
    '2022-12-03T16:53:23.423Z',
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
    3743,
    'INGRESO',
    '2022-12-03T16:53:27.903Z',
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
    3744,
    'INGRESO',
    '2022-12-03T16:55:00.746Z',
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
    3745,
    'INGRESO',
    '2022-12-03T17:02:26.837Z',
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
    3746,
    'INGRESO',
    '2022-12-03T17:03:05.218Z',
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
    3747,
    'INGRESO',
    '2022-12-03T17:04:20.922Z',
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
    3748,
    'SALIO',
    '2022-12-03T17:10:08.297Z',
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
    3749,
    'INGRESO',
    '2022-12-03T17:10:08.392Z',
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
    3750,
    'SALIO',
    '2022-12-03T17:10:09.297Z',
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
    3751,
    'INGRESO',
    '2022-12-03T17:10:09.331Z',
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
    3752,
    'INGRESO',
    '2022-12-03T17:12:50.702Z',
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
    3753,
    'SALIO',
    '2022-12-03T17:13:12.026Z',
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
    3754,
    'INGRESO',
    '2022-12-03T17:13:12.104Z',
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
    3755,
    'INGRESO',
    '2022-12-03T17:14:19.860Z',
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
    3756,
    'INGRESO',
    '2022-12-03T17:14:51.698Z',
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
    3757,
    'INGRESO',
    '2022-12-03T17:15:39.049Z',
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
    3758,
    'INGRESO',
    '2022-12-03T17:30:22.592Z',
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
    3759,
    'INGRESO',
    '2022-12-03T17:33:02.838Z',
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
    3760,
    'INGRESO',
    '2022-12-03T17:35:12.153Z',
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
    3761,
    'SALIO',
    '2022-12-03T17:37:39.129Z',
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
    3762,
    'INGRESO',
    '2022-12-03T17:37:39.148Z',
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
    3763,
    'INGRESO',
    '2022-12-03T17:40:20.428Z',
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
    3764,
    'SALIO',
    '2022-12-03T17:53:25.022Z',
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
    3765,
    'INGRESO',
    '2022-12-03T17:53:25.107Z',
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
    3766,
    'SALIO',
    '2022-12-03T17:53:25.741Z',
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
    3767,
    'INGRESO',
    '2022-12-03T17:53:25.765Z',
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
    3768,
    'SALIO',
    '2022-12-03T17:53:28.272Z',
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
    3769,
    'INGRESO',
    '2022-12-03T17:53:28.287Z',
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
    3770,
    'SALIO',
    '2022-12-03T17:53:28.487Z',
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
    3771,
    'INGRESO',
    '2022-12-03T17:53:28.526Z',
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
    3772,
    'SALIO',
    '2022-12-03T17:53:29.422Z',
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
    3773,
    'INGRESO',
    '2022-12-03T17:53:29.446Z',
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
    3774,
    'SALIO',
    '2022-12-03T17:53:30.105Z',
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
    3775,
    'INGRESO',
    '2022-12-03T17:53:30.139Z',
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
    3776,
    'SALIO',
    '2022-12-03T17:53:32.995Z',
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
    3777,
    'INGRESO',
    '2022-12-03T17:53:33.041Z',
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
    3778,
    'SALIO',
    '2022-12-03T17:53:33.498Z',
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
    3779,
    'INGRESO',
    '2022-12-03T17:53:33.543Z',
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
    3780,
    'SALIO',
    '2022-12-03T17:53:38.788Z',
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
    3781,
    'INGRESO',
    '2022-12-05T03:05:38.326Z',
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
    3782,
    'SALIO',
    '2022-12-05T03:05:46.186Z',
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
    3783,
    'INGRESO',
    '2022-12-05T03:05:46.229Z',
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
    3784,
    'INGRESO',
    '2022-12-05T03:07:34.035Z',
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
    3785,
    'INGRESO',
    '2022-12-05T03:08:42.075Z',
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
    3786,
    'SALIO',
    '2022-12-05T03:12:43.968Z',
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
    3787,
    'INGRESO',
    '2022-12-05T03:12:44.012Z',
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
    3788,
    'INGRESO',
    '2022-12-05T03:19:19.699Z',
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
    3789,
    'SALIO',
    '2022-12-05T03:19:37.749Z',
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
    3790,
    'INGRESO',
    '2022-12-05T03:19:37.810Z',
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
    3791,
    'INGRESO',
    '2022-12-05T03:21:33.140Z',
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
    3792,
    'INGRESO',
    '2022-12-05T03:23:18.219Z',
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
    3793,
    'INGRESO',
    '2022-12-05T03:26:38.046Z',
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
    3794,
    'INGRESO',
    '2022-12-05T03:28:48.515Z',
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
    3795,
    'INGRESO',
    '2022-12-05T03:29:34.966Z',
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
    3796,
    'INGRESO',
    '2022-12-05T03:29:51.234Z',
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
    3797,
    'INGRESO',
    '2022-12-05T03:32:37.616Z',
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
    3798,
    'INGRESO',
    '2022-12-05T03:32:54.741Z',
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
    3799,
    'INGRESO',
    '2022-12-05T03:34:53.368Z',
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
    3800,
    'INGRESO',
    '2022-12-05T03:38:02.047Z',
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
    3801,
    'INGRESO',
    '2022-12-05T03:38:10.837Z',
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
    3802,
    'INGRESO',
    '2022-12-05T03:39:57.454Z',
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
    3803,
    'INGRESO',
    '2022-12-05T03:41:05.595Z',
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
    3804,
    'INGRESO',
    '2022-12-05T03:43:04.922Z',
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
    3805,
    'INSERTO',
    '2022-12-05T03:43:38.600Z',
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
    3806,
    'INGRESO',
    '2022-12-05T03:50:42.280Z',
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
    3807,
    'INGRESO',
    '2022-12-05T03:51:07.246Z',
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
    3808,
    'INGRESO',
    '2022-12-05T03:51:28.261Z',
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
    3809,
    'INGRESO',
    '2022-12-05T03:51:43.388Z',
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
    3810,
    'INGRESO',
    '2022-12-05T03:52:50.941Z',
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
    3811,
    'INGRESO',
    '2022-12-05T03:53:19.427Z',
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
    3812,
    'INGRESO',
    '2022-12-05T03:54:59.042Z',
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
    3813,
    'INGRESO',
    '2022-12-05T03:55:18.780Z',
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
    3814,
    'INGRESO',
    '2022-12-05T03:56:55.826Z',
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
    3815,
    'INGRESO',
    '2022-12-05T03:58:42.187Z',
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
    3816,
    'INSERTO',
    '2022-12-05T03:58:59.894Z',
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
    3817,
    'INGRESO',
    '2022-12-05T04:00:20.514Z',
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
    3818,
    'SALIO',
    '2022-12-05T04:00:24.699Z',
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
    3819,
    'INGRESO',
    '2022-12-05T04:00:24.736Z',
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
    3820,
    'SALIO',
    '2022-12-05T04:00:25.128Z',
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
    3821,
    'INGRESO',
    '2022-12-05T04:00:25.151Z',
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
    3822,
    'SALIO',
    '2022-12-05T04:00:48.816Z',
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
    3823,
    'INGRESO',
    '2022-12-05T04:00:48.871Z',
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
    3824,
    'INGRESO',
    '2022-12-05T04:01:45.560Z',
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
    3825,
    'INGRESO',
    '2022-12-05T04:02:12.385Z',
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
    3826,
    'SALIO',
    '2022-12-05T04:02:17.740Z',
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
    3827,
    'INGRESO',
    '2022-12-05T04:02:17.758Z',
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
    3828,
    'SALIO',
    '2022-12-05T04:02:18.119Z',
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
    3829,
    'INGRESO',
    '2022-12-05T04:02:18.229Z',
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
    3830,
    'INSERTO',
    '2022-12-05T04:02:46.688Z',
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
    3831,
    'SALIO',
    '2022-12-05T04:03:01.205Z',
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
    3832,
    'INGRESO',
    '2022-12-05T04:03:01.263Z',
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
    3833,
    'SALIO',
    '2022-12-05T04:03:01.503Z',
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
    3834,
    'INGRESO',
    '2022-12-05T04:03:01.565Z',
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
    3835,
    'ACTUALIZO',
    '2022-12-05T04:03:21.343Z',
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
    3836,
    'SALIO',
    '2022-12-05T04:03:25.728Z',
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
    3837,
    'INGRESO',
    '2022-12-05T04:03:25.764Z',
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
    3838,
    'INGRESO',
    '2022-12-05T04:04:32.644Z',
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
    3839,
    'INGRESO',
    '2022-12-05T04:04:58.664Z',
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
    3840,
    'INGRESO',
    '2022-12-05T04:05:12.677Z',
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
    3841,
    'SALIO',
    '2022-12-05T04:05:17.161Z',
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
    3842,
    'INGRESO',
    '2022-12-05T04:05:17.210Z',
    3,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3843,
    'SALIO',
    '2022-12-05T04:05:17.639Z',
    1,
    'PREGUNTAS'
  );
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3844,
    'INGRESO',
    '2022-12-05T04:05:17.682Z',
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
    3845,
    'ACTUALIZO',
    '2022-12-05T04:05:24.694Z',
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
    3846,
    'ACTUALIZO',
    '2022-12-05T04:05:32.157Z',
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
    3847,
    'SALIO',
    '2022-12-05T04:05:34.907Z',
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
    3848,
    'INGRESO',
    '2022-12-05T04:05:34.963Z',
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
    3849,
    'SALIO',
    '2022-12-05T04:05:49.878Z',
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
    3850,
    'INGRESO',
    '2022-12-05T04:05:49.937Z',
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
    3851,
    'ACTUALIZO',
    '2022-12-05T04:06:00.203Z',
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
    3852,
    'SALIO',
    '2022-12-05T04:06:28.327Z',
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
    3853,
    'INGRESO',
    '2022-12-05T04:06:28.414Z',
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
    3854,
    'ACTUALIZO',
    '2022-12-05T04:06:37.306Z',
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
    3855,
    'SALIO',
    '2022-12-05T04:06:44.064Z',
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
    3856,
    'INGRESO',
    '2022-12-05T04:06:44.099Z',
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
    3857,
    'SALIO',
    '2022-12-05T04:07:03.829Z',
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
    3858,
    'INGRESO',
    '2022-12-05T04:07:03.849Z',
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
    3859,
    'SALIO',
    '2022-12-05T04:07:06.424Z',
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
    3860,
    'INGRESO',
    '2022-12-05T04:07:06.486Z',
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
    3861,
    'SALIO',
    '2022-12-05T04:07:11.430Z',
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
    3862,
    'INGRESO',
    '2022-12-05T04:07:11.474Z',
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
    3863,
    'DESCARGO PDF',
    '2022-12-05T04:07:13.659Z',
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
    3864,
    'SALIO',
    '2022-12-05T04:07:25.765Z',
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
    3865,
    'INGRESO',
    '2022-12-05T04:07:25.808Z',
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
    3866,
    'DESCARGO PDF',
    '2022-12-05T04:07:27.050Z',
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
    3867,
    'SALIO',
    '2022-12-05T04:07:45.780Z',
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
    3868,
    'INGRESO',
    '2022-12-05T04:07:45.799Z',
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
    3869,
    'SALIO',
    '2022-12-05T04:07:54.587Z',
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
    3870,
    'INGRESO',
    '2022-12-05T04:07:54.627Z',
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
    3871,
    'SALIO',
    '2022-12-05T04:08:09.087Z',
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
    3872,
    'INGRESO',
    '2022-12-05T04:08:09.103Z',
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
    3873,
    'DESCARGO PDF',
    '2022-12-05T04:08:11.341Z',
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
    3874,
    'SALIO',
    '2022-12-05T04:08:17.949Z',
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
    3875,
    'INGRESO',
    '2022-12-05T04:08:17.980Z',
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
    3876,
    'DESCARGO PDF',
    '2022-12-05T04:08:19.518Z',
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
    3877,
    'SALIO',
    '2022-12-05T04:08:27.155Z',
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
    3878,
    'INGRESO',
    '2022-12-05T04:08:27.172Z',
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
    3879,
    'DESCARGO PDF',
    '2022-12-05T04:08:28.734Z',
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
    3880,
    'SALIO',
    '2022-12-05T04:08:49.597Z',
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
    3881,
    'INGRESO',
    '2022-12-05T04:08:49.615Z',
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
    3882,
    'INGRESO',
    '2022-12-05T04:08:50.725Z',
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
    3883,
    'SALIO',
    '2022-12-05T04:08:56.799Z',
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
    3884,
    'INGRESO',
    '2022-12-05T04:08:56.812Z',
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
    3885,
    'SALIO',
    '2022-12-05T04:08:57.649Z',
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
    3886,
    'INGRESO',
    '2022-12-05T04:08:57.671Z',
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
  (3887, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3888,
    'SALIO',
    '2022-12-05T04:09:04.323Z',
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
    3889,
    'INGRESO',
    '2022-12-05T04:09:04.330Z',
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
  (3890, NULL, NULL, NULL, NULL);
INSERT INTO
  `tbl_bitacora` (
    `COD_BITACORA`,
    `ACCION`,
    `FECHA`,
    `COD_USUARIO`,
    `TABLA_MODIFICADA`
  )
VALUES
  (
    3891,
    'SALIO',
    '2022-12-05T04:09:10.717Z',
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
    3892,
    'INGRESO',
    '2022-12-05T04:09:10.745Z',
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
    3893,
    'INGRESO',
    '2022-12-05T04:09:12.309Z',
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
    3894,
    'SALIO',
    '2022-12-05T04:09:20.622Z',
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
    3895,
    'INGRESO',
    '2022-12-05T04:09:20.730Z',
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
    3896,
    'SALIO',
    '2022-12-05T04:09:30.555Z',
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
    3897,
    'INGRESO',
    '2022-12-05T04:09:30.593Z',
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
    3898,
    'SALIO',
    '2022-12-05T04:09:31.612Z',
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
    3899,
    'INGRESO',
    '2022-12-05T04:09:31.624Z',
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
    3900,
    'SALIO',
    '2022-12-05T04:09:32.464Z',
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
    3901,
    'INGRESO',
    '2022-12-05T04:09:32.547Z',
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
    3902,
    'SALIO',
    '2022-12-05T04:09:37.658Z',
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
    3903,
    'INGRESO',
    '2022-12-05T04:09:37.706Z',
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
    3904,
    'DESCARGO PDF',
    '2022-12-05T04:09:41.727Z',
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
    3905,
    'DESCARGO PDF',
    '2022-12-05T04:10:35.490Z',
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
    3906,
    'INGRESO',
    '2022-12-05T04:12:11.125Z',
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
    3907,
    'INGRESO',
    '2022-12-05T04:12:42.157Z',
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
    3908,
    'INGRESO',
    '2022-12-05T04:13:07.450Z',
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
    3909,
    'INGRESO',
    '2022-12-05T04:13:18.056Z',
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
    3910,
    'INGRESO',
    '2022-12-05T04:14:16.578Z',
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
    3911,
    'INGRESO',
    '2022-12-05T04:14:36.703Z',
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
    3912,
    'INGRESO',
    '2022-12-05T04:14:51.947Z',
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
    3913,
    'SALIO',
    '2022-12-05T04:15:04.885Z',
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
    3914,
    'INGRESO',
    '2022-12-05T04:19:10.394Z',
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
    3915,
    'SALIO',
    '2022-12-05T04:19:21.711Z',
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
    3916,
    'INGRESO',
    '2022-12-05T04:19:21.797Z',
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
    3917,
    'INSERTO',
    '2022-12-05T04:20:09.521Z',
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
    3918,
    'INGRESO',
    '2022-12-05T04:21:36.098Z',
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
    3919,
    'INGRESO',
    '2022-12-05T04:21:57.594Z',
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
    3920,
    'INGRESO',
    '2022-12-05T04:22:24.486Z',
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
    3921,
    'INGRESO',
    '2022-12-05T04:23:00.862Z',
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
    3922,
    'INGRESO',
    '2022-12-05T04:24:04.918Z',
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
    3923,
    'INSERTO',
    '2022-12-05T04:24:49.574Z',
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
    3924,
    'SALIO',
    '2022-12-05T04:24:54.990Z',
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
    3925,
    'INGRESO',
    '2022-12-05T04:24:55.048Z',
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
    3926,
    'SALIO',
    '2022-12-05T04:25:13.521Z',
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
    3927,
    'INGRESO',
    '2022-12-05T04:25:13.608Z',
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
    3928,
    'INSERTO',
    '2022-12-05T04:26:44.117Z',
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
    3929,
    'SALIO',
    '2022-12-05T04:26:47.332Z',
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
    3930,
    'INGRESO',
    '2022-12-05T04:26:47.346Z',
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
    3931,
    'SALIO',
    '2022-12-05T04:26:47.457Z',
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
    3932,
    'INGRESO',
    '2022-12-05T04:26:47.477Z',
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
    3933,
    'SALIO',
    '2022-12-05T04:55:27.655Z',
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
    3934,
    'INGRESO',
    '2022-12-05T04:55:27.719Z',
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
    3935,
    'SALIO',
    '2022-12-05T04:56:37.405Z',
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
    3936,
    'INGRESO',
    '2022-12-05T19:34:08.372Z',
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
    3937,
    'SALIO',
    '2022-12-05T19:34:37.401Z',
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
    3938,
    'INGRESO',
    '2022-12-05T19:34:37.508Z',
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
    3939,
    'INGRESO',
    '2022-12-05T19:36:14.788Z',
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
    3940,
    'INGRESO',
    '2022-12-05T19:38:10.426Z',
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
    3941,
    'INGRESO',
    '2022-12-05T19:43:24.984Z',
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
    3942,
    'INGRESO',
    '2022-12-05T19:43:43.464Z',
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
    3943,
    'INGRESO',
    '2022-12-05T19:44:33.137Z',
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
    3944,
    'INGRESO',
    '2022-12-05T19:45:04.845Z',
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
    3945,
    'INGRESO',
    '2022-12-05T19:47:17.004Z',
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
    3946,
    'INGRESO',
    '2022-12-05T19:51:39.797Z',
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
    3947,
    'INGRESO',
    '2022-12-05T19:52:23.618Z',
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
    3948,
    'INGRESO',
    '2022-12-05T19:52:38.800Z',
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
    3949,
    'SALIO',
    '2022-12-05T19:57:57.587Z',
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
    3950,
    'INGRESO',
    '2022-12-05T20:06:33.114Z',
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
    3951,
    'SALIO',
    '2022-12-05T20:06:34.845Z',
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
    3952,
    'INGRESO',
    '2022-12-05T20:19:30.561Z',
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
    3953,
    'SALIO',
    '2022-12-05T20:19:43.239Z',
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
    3954,
    'INGRESO',
    '2022-12-05T20:19:43.318Z',
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
    3955,
    'ACTUALIZO',
    '2022-12-05T20:19:49.371Z',
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
    3956,
    'SALIO',
    '2022-12-05T20:21:54.763Z',
    1,
    'ROLES'
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
  (28, 3, NULL, '2022-12-02', NULL, 163, NULL, NULL);
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
  (35, 3, NULL, '2022-12-04', NULL, 163, NULL, NULL);
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
  (36, 3, NULL, '2022-12-04', NULL, 325, NULL, NULL);
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
  (37, 3, NULL, '2022-12-04', NULL, 163, NULL, NULL);

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
  (30, 28, 1, 12, 12, 163, '2022-12-02 14:15:41');
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
  (36, 35, 1, 12, 12, 163, '2022-12-04 22:20:09');
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
  (37, 36, 3, 12, 12, 163, '2022-12-04 22:24:49');
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
  (38, 36, 1, 12, 12, 163, '2022-12-04 22:24:49');
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
  (39, 37, 3, 12, 12, 163, '2022-12-04 22:26:44');

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
    23,
    18,
    1,
    2,
    2,
    4.48,
    0,
    '2022-12-02 13:47:05',
    '2022-12-02 13:47:05'
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
    24,
    19,
    1,
    12,
    2,
    27.60,
    0,
    '2022-12-02 14:18:18',
    '2022-12-02 14:18:18'
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
    31,
    26,
    1,
    12,
    2,
    27.60,
    0,
    '2022-12-02 14:33:30',
    '2022-12-02 14:33:30'
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
    34,
    29,
    1,
    23,
    2,
    55.20,
    0,
    '2022-12-02 16:06:30',
    '2022-12-02 16:06:30'
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
    35,
    29,
    2,
    2,
    20,
    48.00,
    0,
    '2022-12-02 16:06:30',
    '2022-12-02 16:06:30'
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
  (4, 1, 'Mercancia', 166, 0);
INSERT INTO
  `tbl_inventario` (
    `CODINVENTARIO`,
    `COD_ARTICULO`,
    `DESCRIPCIONPRODUCTO`,
    `EXISTENCIA`,
    `ESTADO`
  )
VALUES
  (5, 2, 'Mercancia', 17, 0);
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
  (7, 3, 'Mercancia', 122, 0);

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
  (9, 'SALIDA', '2', 1, '2022-12-02 13:47:05', '1');
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
  (10, 'ENTRADA', '12', 1, '2022-12-02 14:15:41', '1');
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
  (11, 'ENTRADA', '12', 1, '2022-12-02 14:16:59', '1');
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
  (12, 'ENTRADA', '12', 1, '2022-12-02 14:18:04', '1');
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
  (13, 'SALIDA', '12', 1, '2022-12-02 14:18:18', '1');
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
  (14, 'SALIDA', '12', 1, '2022-12-02 14:24:18', '1');
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
  (15, 'SALIDA', '2', 1, '2022-12-02 14:28:16', '1');
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
  (16, 'SALIDA', '2', 1, '2022-12-02 14:29:45', '1');
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
  (17, 'SALIDA', '2', 1, '2022-12-02 14:30:33', '1');
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
  (18, 'SALIDA', '2', 1, '2022-12-02 14:32:06', '1');
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
  (19, 'SALIDA', '12', 1, '2022-12-02 14:32:35', '1');
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
  (20, 'SALIDA', '12', 1, '2022-12-02 14:33:30', '1');
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
  (21, 'SALIDA', '2', 1, '2022-12-02 14:34:02', '1');
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
  (22, 'SALIDA', '20', 1, '2022-12-02 14:38:16', '1');
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
  (23, 'ENTRADA', '12', 1, '2022-12-02 15:44:24', '1');
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
  (24, 'SALIDA', '23', 1, '2022-12-02 16:06:30', '1');
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
  (25, 'SALIDA', '2', 2, '2022-12-02 16:06:30', '1');
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
  (26, 'ENTRADA', '12', 1, '2022-12-04 21:43:38', '1');
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
  (27, 'ENTRADA', '12', 2, '2022-12-04 21:58:59', '1');
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
  (28, 'SALIDA', '2', 1, '2022-12-04 22:02:46', '1');
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
  (29, 'SALIDA', '2', 3, '2022-12-04 22:02:46', '1');
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
  (30, 'ENTRADA', '12', 1, '2022-12-04 22:20:09', '1');
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
  (31, 'ENTRADA', '12', 3, '2022-12-04 22:24:49', '1');
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
  (32, 'ENTRADA', '12', 1, '2022-12-04 22:24:49', '1');
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
  (33, 'ENTRADA', '12', 3, '2022-12-04 22:26:44', '1');

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
  (6, 'IMPUESTO VENTA', '0.15', NULL, NULL, NULL);
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
  (5, 10, 'JONATHAN GJEVARA', 'HOLA MUNDO', NULL, NULL);

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
    'PRUE',
    '2022-11-27 11:17:10',
    '2022-12-05 14:19:49'
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
    11,
    10,
    1,
    'PRUEBA',
    'paulacevedo175@gmail.com',
    'Hola1234@',
    NULL,
    '2022-12-03 10:37:05',
    '2022-12-03 10:37:05',
    'Nuevo',
    NULL,
    NULL,
    NULL
  );
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
    12,
    11,
    1,
    'PEPEPe',
    'paulacevedod175@gmail.com',
    'Hola1234@',
    NULL,
    '2022-12-03 10:39:16',
    '2022-12-03 10:39:16',
    'Nuevo',
    NULL,
    NULL,
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
    18,
    11,
    '2022-12-02',
    11,
    4.00,
    12,
    4.48,
    NULL,
    '2022-12-02 13:47:05',
    '2022-12-02 13:47:05'
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
    19,
    11,
    '2022-12-02',
    11,
    24.00,
    12,
    27.60,
    NULL,
    '2022-12-02 14:18:18',
    '2022-12-02 14:18:18'
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
    26,
    11,
    '2022-12-02',
    11,
    24.00,
    0.12,
    27.60,
    NULL,
    '2022-12-02 14:33:30',
    '2022-12-02 14:33:30'
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
    29,
    11,
    '2022-12-02',
    11,
    132.00,
    0.2,
    103.20,
    NULL,
    '2022-12-02 16:06:30',
    '2022-12-02 16:06:30'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
