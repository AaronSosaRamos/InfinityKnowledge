-- MySQL Script generated by MySQL Workbench
-- Fri Sep  9 17:38:21 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema infinite_knowledge
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `infinite_knowledge` ;

-- -----------------------------------------------------
-- Schema infinite_knowledge
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `infinite_knowledge` DEFAULT CHARACTER SET utf8 ;
USE `infinite_knowledge` ;

-- -----------------------------------------------------
-- Table `infinite_knowledge`.`director_academico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`director_academico` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`director_academico` (
  `director_academico_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_paterno` VARCHAR(50) NOT NULL,
  `apellido_materno` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `anios_labor` TINYINT UNSIGNED NOT NULL,
  `genero` VARCHAR(6) NOT NULL,
  `numero_telefonico` CHAR(9) NOT NULL,
  `grado_academico` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`director_academico_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idx_director_academico_dni` ON `infinite_knowledge`.`director_academico` (`dni` ASC);

CREATE UNIQUE INDEX `idx_director_academico_numero_telefonico` ON `infinite_knowledge`.`director_academico` (`numero_telefonico` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`auxiliar_academico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`auxiliar_academico` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`auxiliar_academico` (
  `auxiliar_academico_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_paterno` VARCHAR(50) NOT NULL,
  `apellido_materno` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `n_docentes_a_cargo` TINYINT UNSIGNED NOT NULL,
  `genero` VARCHAR(6) NOT NULL,
  `numero_telefonico` CHAR(9) NOT NULL,
  `grado_academico` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`auxiliar_academico_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idx_auxiliar_academico_dni` ON `infinite_knowledge`.`auxiliar_academico` (`dni` ASC);

CREATE UNIQUE INDEX `idx_auxiliar_academico_numero_telefonico` ON `infinite_knowledge`.`auxiliar_academico` (`numero_telefonico` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`docente` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`docente` (
  `docente_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_paterno` VARCHAR(50) NOT NULL,
  `apellido_materno` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `genero` VARCHAR(6) NOT NULL,
  `numero_telefonico` CHAR(9) NOT NULL,
  `grado_academico` VARCHAR(40) NOT NULL,
  `especialidad_academica` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`docente_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idx_docente_dni` ON `infinite_knowledge`.`docente` (`dni` ASC);

CREATE UNIQUE INDEX `idx_docente_numero_telefonico` ON `infinite_knowledge`.`docente` (`numero_telefonico` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`estudiante` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`estudiante` (
  `estudiante_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido_paterno` VARCHAR(50) NOT NULL,
  `apellido_materno` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `genero` VARCHAR(6) NOT NULL,
  `numero_telefonico` CHAR(9) NOT NULL,
  PRIMARY KEY (`estudiante_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idx_estudiante_dni` ON `infinite_knowledge`.`estudiante` (`dni` ASC);

CREATE UNIQUE INDEX `idx_estudiante_numero_telefonico` ON `infinite_knowledge`.`estudiante` (`numero_telefonico` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`curso` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`curso` (
  `curso_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `n_horas_por_semana` TINYINT UNSIGNED NOT NULL,
  `enfoque` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`curso_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idx_curso_nombre` ON `infinite_knowledge`.`curso` (`nombre` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`registro_calificaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`registro_calificaciones` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`registro_calificaciones` (
  `docente_id` INT UNSIGNED NOT NULL,
  `estudiante_id` INT UNSIGNED NOT NULL,
  `curso_id` INT UNSIGNED NOT NULL,
  `salon_clases` CHAR(2) NOT NULL,
  `calif1` TINYINT UNSIGNED NULL,
  `calif2` TINYINT UNSIGNED NULL,
  `calif3` TINYINT UNSIGNED NULL,
  `promedio_final` TINYINT UNSIGNED NULL,
  `estado_aprobacion` VARCHAR(50) NULL,
  `fecha_emision` DATE NULL,
  PRIMARY KEY (`docente_id`, `estudiante_id`, `curso_id`),
  CONSTRAINT `fk_registro_calificaciones_docente_id`
    FOREIGN KEY (`docente_id`)
    REFERENCES `infinite_knowledge`.`docente` (`docente_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_calificaciones_estudiante_id`
    FOREIGN KEY (`estudiante_id`)
    REFERENCES `infinite_knowledge`.`estudiante` (`estudiante_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_calificaciones_curso_id`
    FOREIGN KEY (`curso_id`)
    REFERENCES `infinite_knowledge`.`curso` (`curso_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_registro_calificaciones_estudiante_id_idx` ON `infinite_knowledge`.`registro_calificaciones` (`estudiante_id` ASC);

CREATE INDEX `fk_registro_calificaciones_curso_id_idx` ON `infinite_knowledge`.`registro_calificaciones` (`curso_id` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`registro_asistencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`registro_asistencias` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`registro_asistencias` (
  `docente_id` INT UNSIGNED NOT NULL,
  `estudiante_id` INT UNSIGNED NOT NULL,
  `curso_id` INT UNSIGNED NOT NULL,
  `salon_clases` CHAR(2) NOT NULL,
  `n_asistencias_realizadas` SMALLINT UNSIGNED NULL,
  `n_faltas_realizadas` SMALLINT UNSIGNED NULL,
  `n_justificaciones_realizadas` SMALLINT UNSIGNED NULL,
  `n_total_asistencias` SMALLINT UNSIGNED NULL,
  `fecha_emision` DATE NULL,
  PRIMARY KEY (`docente_id`, `estudiante_id`, `curso_id`),
  CONSTRAINT `fk_registro_asistencias_docente_id`
    FOREIGN KEY (`docente_id`)
    REFERENCES `infinite_knowledge`.`docente` (`docente_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_asistencias_estudiante_id`
    FOREIGN KEY (`estudiante_id`)
    REFERENCES `infinite_knowledge`.`estudiante` (`estudiante_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_registro_asistencias_curso_id`
    FOREIGN KEY (`curso_id`)
    REFERENCES `infinite_knowledge`.`curso` (`curso_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_registro_asistencias_estudiante_id_idx` ON `infinite_knowledge`.`registro_asistencias` (`estudiante_id` ASC);

CREATE INDEX `fk_registro_asistencias_curso_id_idx` ON `infinite_knowledge`.`registro_asistencias` (`curso_id` ASC);


-- -----------------------------------------------------
-- Table `infinite_knowledge`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `infinite_knowledge`.`usuario` ;

CREATE TABLE IF NOT EXISTS `infinite_knowledge`.`usuario` (
  `usuario_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `correo_electronico` VARCHAR(100) NOT NULL,
  `contrasenia` VARCHAR(50) NOT NULL,
  `rol` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idx_usuario_correo_electronico` ON `infinite_knowledge`.`usuario` (`correo_electronico` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
