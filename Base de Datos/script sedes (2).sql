-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sedes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sedes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sedes` DEFAULT CHARACTER SET utf8 ;
USE `sedes` ;

-- -----------------------------------------------------
-- Table `sedes`.`sede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`sede` (
  `id_sede` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre_sede` VARCHAR(50) NOT NULL,
  `Horario_sede` VARCHAR(100) NOT NULL,
  `observaciones_sede` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_sede`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`tipo_aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`tipo_aula` (
  `id_tipo_aula` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_aula` VARCHAR(50) NOT NULL,
  `descripcion_tipo_aula` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_tipo_aula`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`aula` (
  `id_aula` BIGINT(20) NOT NULL,
  `id_tipo_aula` BIGINT(20) NOT NULL,
  `id_sede` BIGINT(20) NOT NULL,
  `nombre_aula` VARCHAR(50) NOT NULL,
  `observaciones_aula` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_aula`),
  INDEX `fk_aula_tipo_aula` (`id_tipo_aula` ASC),
  INDEX `fk_aula_sede` (`id_sede` ASC),
  CONSTRAINT `fk_aula_sede`
    FOREIGN KEY (`id_sede`)
    REFERENCES `sedes`.`sede` (`id_sede`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_aula_tipo_aula`
    FOREIGN KEY (`id_tipo_aula`)
    REFERENCES `sedes`.`tipo_aula` (`id_tipo_aula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`programa` (
  `id_programa` BIGINT(20) NOT NULL,
  `nombre_programa` VARCHAR(50) NOT NULL,
  `version_programa` BIGINT(20) NOT NULL,
  `descripcion_programa` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_programa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`ficha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`ficha` (
  `numero_ficha` BIGINT(20) NOT NULL,
  `id_programa` BIGINT(20) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  PRIMARY KEY (`numero_ficha`),
  INDEX `fk_ficha_programa` (`id_programa` ASC),
  CONSTRAINT `fk_ficha_programa`
    FOREIGN KEY (`id_programa`)
    REFERENCES `sedes`.`programa` (`id_programa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`aula_ficha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`aula_ficha` (
  `id_aula_ficha` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `numero_ficha` BIGINT(20) NOT NULL,
  `id_aula` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id_aula_ficha`),
  INDEX `fk_aula_ficha_ficha` (`numero_ficha` ASC),
  INDEX `fk_aula_ficha_aula` (`id_aula` ASC),
  CONSTRAINT `fk_aula_ficha_aula`
    FOREIGN KEY (`id_aula`)
    REFERENCES `sedes`.`aula` (`id_aula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_aula_ficha_ficha`
    FOREIGN KEY (`numero_ficha`)
    REFERENCES `sedes`.`ficha` (`numero_ficha`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`estado` (
  `Id_Estado` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `Nombre_Estado` VARCHAR(45) NULL DEFAULT NULL,
  `Observaciones_Estado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Estado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`marca` (
  `idMarca` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `Nombre_Marca` VARCHAR(100) NOT NULL,
  `Descripcion_Marca` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idMarca`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`tipo_elemento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`tipo_elemento` (
  `idTipo_Elemento` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Elemento` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipo_Elemento`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`tipo_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`tipo_inventario` (
  `Id_Tipo_Inventario` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Inventario` VARCHAR(50) NOT NULL,
  `Descripcion_Tipo_Inventario` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`Id_Tipo_Inventario`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`elementos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`elementos` (
  `Id_Elemento` BIGINT(15) NOT NULL,
  `idTipo_Elemento` BIGINT(20) NOT NULL,
  `Id_Tipo_Inventario` BIGINT(15) NOT NULL,
  `idMarca` BIGINT(20) NOT NULL,
  `Id_Estado` BIGINT(15) NOT NULL,
  `Nombre_Elemento` VARCHAR(50) CHARACTER SET 'utf8' NOT NULL,
  `Descripcion_Elemento` VARCHAR(500) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`Id_Elemento`),
  INDEX `fk_Elementos_Tipo_Elemento` (`idTipo_Elemento` ASC),
  INDEX `fk_Elementos_Marca` (`idMarca` ASC),
  INDEX `fk_Elementos_Estado` (`Id_Estado` ASC),
  INDEX `fk_elementos_tipo_inventario1_idx` (`Id_Tipo_Inventario` ASC),
  CONSTRAINT `fk_Elementos_Estado`
    FOREIGN KEY (`Id_Estado`)
    REFERENCES `sedes`.`estado` (`Id_Estado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Elementos_Marca`
    FOREIGN KEY (`idMarca`)
    REFERENCES `sedes`.`marca` (`idMarca`),
  CONSTRAINT `fk_Elementos_Tipo_Elemento`
    FOREIGN KEY (`idTipo_Elemento`)
    REFERENCES `sedes`.`tipo_elemento` (`idTipo_Elemento`),
  CONSTRAINT `fk_elementos_tipo_inventario1`
    FOREIGN KEY (`Id_Tipo_Inventario`)
    REFERENCES `sedes`.`tipo_inventario` (`Id_Tipo_Inventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `sedes`.`tipo_persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`tipo_persona` (
  `id_Tipo_Persona` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_Persona` VARCHAR(50) NOT NULL,
  `Descripcion_Tipo_Persona` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Tipo_Persona`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`tipo_documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`tipo_documento` (
  `id_tipo_documento` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_documento` VARCHAR(50) NOT NULL,
  `descripcion_tipo_documento` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`persona` (
  `documento_Persona` BIGINT(20) NOT NULL,
  `id_tipo_documento` BIGINT(20) NOT NULL,
  `Id_Tipo_Persona` BIGINT(15) NOT NULL,
  `Nombre_Persona` VARCHAR(50) NOT NULL,
  `Apellido_Persona` VARCHAR(50) NOT NULL,
  `Direccion_Persona` VARCHAR(100) NOT NULL,
  `Telefono_Persona` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`documento_Persona`),
  INDEX `fk_Persona_tipo_documento` (`id_tipo_documento` ASC),
  INDEX `fk_Persona_Tipo_Persona` (`Id_Tipo_Persona` ASC),
  CONSTRAINT `fk_Persona_Tipo_Persona`
    FOREIGN KEY (`Id_Tipo_Persona`)
    REFERENCES `sedes`.`tipo_persona` (`id_Tipo_Persona`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Persona_tipo_documento`
    FOREIGN KEY (`id_tipo_documento`)
    REFERENCES `sedes`.`tipo_documento` (`id_tipo_documento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`persona_ficha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`persona_ficha` (
  `id_Persona_ficha` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `numero_ficha` BIGINT(20) NOT NULL,
  `documento_Persona` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id_Persona_ficha`),
  INDEX `fk_Persona_ficha_ficha` (`numero_ficha` ASC),
  INDEX `fk_Persona_ficha_Persona` (`documento_Persona` ASC),
  CONSTRAINT `fk_Persona_ficha_Persona`
    FOREIGN KEY (`documento_Persona`)
    REFERENCES `sedes`.`persona` (`documento_Persona`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Persona_ficha_ficha`
    FOREIGN KEY (`numero_ficha`)
    REFERENCES `sedes`.`ficha` (`numero_ficha`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`profesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`profesion` (
  `id_profesion` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `nombre_profesion` VARCHAR(50) NOT NULL,
  `descripcion_profesion` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_profesion`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`persona_profesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`persona_profesion` (
  `id_Persona_profesion` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `documento_Persona` BIGINT(20) NOT NULL,
  `id_profesion` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id_Persona_profesion`),
  INDEX `fk_Personar_profesion_Persona` (`documento_Persona` ASC),
  INDEX `fk_Persona_profesion_Persona` (`id_profesion` ASC),
  CONSTRAINT `fk_Persona_profesion_Persona`
    FOREIGN KEY (`id_profesion`)
    REFERENCES `sedes`.`profesion` (`id_profesion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Personar_profesion_Persona`
    FOREIGN KEY (`documento_Persona`)
    REFERENCES `sedes`.`persona` (`documento_Persona`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`prestamos` (
  `Id_Prestamos` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `documento_Persona` BIGINT(20) NOT NULL,
  `Id_Elemento` BIGINT(15) NOT NULL,
  `Fecha_Prestamos` DATE NOT NULL,
  `Hora_Prestamos` TIME NOT NULL,
  `Fecha_Entrega` DATE NULL DEFAULT NULL,
  `Hora_entrega` TIME NULL DEFAULT NULL,
  `Observaciones` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Prestamos`),
  INDEX `fk_Prestamos_Persona` (`documento_Persona` ASC),
  INDEX `fk_Prestamos_Elementos` (`Id_Elemento` ASC),
  CONSTRAINT `fk_Prestamos_Elementos`
    FOREIGN KEY (`Id_Elemento`)
    REFERENCES `sedes`.`elementos` (`Id_Elemento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Prestamos_Persona`
    FOREIGN KEY (`documento_Persona`)
    REFERENCES `sedes`.`persona` (`documento_Persona`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`sede_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`sede_inventario` (
  `Id_Sede_inventario` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `Id_sede` BIGINT(20) NOT NULL,
  `Id_Tipo_Inventario` BIGINT(15) NOT NULL,
  PRIMARY KEY (`Id_Sede_inventario`),
  INDEX `fk_Sede_inventario_sede` (`Id_sede` ASC),
  INDEX `fk_Sede_inventario_Tipo_Inventario` (`Id_Tipo_Inventario` ASC),
  CONSTRAINT `fk_Sede_inventario_Tipo_Inventario`
    FOREIGN KEY (`Id_Tipo_Inventario`)
    REFERENCES `sedes`.`tipo_inventario` (`Id_Tipo_Inventario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Sede_inventario_sede`
    FOREIGN KEY (`Id_sede`)
    REFERENCES `sedes`.`sede` (`id_sede`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`tipo_usuario` (
  `Id_Tipo_usuario` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `Nombre_Tipo_usuario` VARCHAR(50) NOT NULL,
  `Descripcion_Tipo_usuario` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`Id_Tipo_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sedes`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sedes`.`usuario` (
  `Nombre_Usuario` VARCHAR(50) NOT NULL,
  `Contraseña_Usuario` VARCHAR(50) NOT NULL,
  `documento_Persona` BIGINT(20) NOT NULL,
  `Id_Tipo_usuario` BIGINT(20) NOT NULL,
  PRIMARY KEY (`Nombre_Usuario`),
  INDEX `fk_Usuario_Persona` (`documento_Persona` ASC),
  INDEX `fk_Usuario_Tipo_usuario` (`Id_Tipo_usuario` ASC),
  CONSTRAINT `fk_Usuario_Persona`
    FOREIGN KEY (`documento_Persona`)
    REFERENCES `sedes`.`persona` (`documento_Persona`),
  CONSTRAINT `fk_Usuario_Tipo_usuario`
    FOREIGN KEY (`Id_Tipo_usuario`)
    REFERENCES `sedes`.`tipo_usuario` (`Id_Tipo_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into tipo_usuario (Nombre_Tipo_usuario,Descripcion_Tipo_usuario) values ('Administrador','Coordinador o Persona encargada de Administrar la sede');
insert into tipo_documento (nombre_tipo_documento,descripcion_tipo_documento) values ('Cedula de Ciudadania', 'Documento que reciben las personas mayores de 18 años');
insert into Tipo_Documento (nombre_tipo_documento,descripcion_tipo_documento) values ('Tarjeta de Identidad', 'Documento que reciben las personas mayores los 7 años y menor de 18 años');
insert into tipo_persona (Nombre_Tipo_Persona,Descripcion_Tipo_Persona)values ('Coordinador','Persona encargada de Administrar la sede');
insert into profesion (nombre_profesion, descripcion_profesion) values ('Ingeniero de sistemas', 'Aplicacion tecnologica de la teoria de sistemas a los esfuerzos de la ingeniería'),
('Ingeniero Ambiental', 'que estudia los problemas ambientales de forma científica e integrada'),
('Topografo', 'Estudia el conjunto de principios y procedimientos que tienen por objeto la representaciín gráfica de la superficie'),
('Ingeniero Quimico', 'Se encarga del diseño, manutencion, evaluación, optimización, simulación, planificación, construcción y operación de todo tipo de elementos en la industria de procesos'),
('Ingeniero de minas', 'que posee los conocimientos específicos en minas'),
('Otro', 'Otra Profesion'),('Aprendiz','Aprendiz en Formación');
