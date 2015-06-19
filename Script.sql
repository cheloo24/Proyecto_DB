SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Photolog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Photolog` ;

-- -----------------------------------------------------
-- Table `Photolog`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photolog`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Apodo` VARCHAR(45) NULL,
  `Contraseña` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `Mail` VARCHAR(45) NULL,
  `Cant_Fotos` INT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photolog`.`Foto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photolog`.`Foto` (
  `idFoto` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Descripcion` VARCHAR(200) NULL,
  `Cant_comentarios` INT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idFoto`, `Usuario_idUsuario`),
  INDEX `fk_Foto_Usuario_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Foto_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `Photolog`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photolog`.`Calificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photolog`.`Calificacion` (
  `idCalificacion` INT NOT NULL,
  `Puntuacion` INT NULL,
  `Foto_idFoto` INT NOT NULL,
  `Foto_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCalificacion`, `Foto_idFoto`, `Foto_Usuario_idUsuario`),
  INDEX `fk_Calificacion_Foto1_idx` (`Foto_idFoto` ASC, `Foto_Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Calificacion_Foto1`
    FOREIGN KEY (`Foto_idFoto` , `Foto_Usuario_idUsuario`)
    REFERENCES `Photolog`.`Foto` (`idFoto` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photolog`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photolog`.`Comentario` (
  `idComentario` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Caracteres_comentarios` VARCHAR(200) NULL,
  `Foto_idFoto` INT NOT NULL,
  `Foto_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentario`, `Foto_idFoto`, `Foto_Usuario_idUsuario`),
  INDEX `fk_Comentario_Foto1_idx` (`Foto_idFoto` ASC, `Foto_Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Comentario_Foto1`
    FOREIGN KEY (`Foto_idFoto` , `Foto_Usuario_idUsuario`)
    REFERENCES `Photolog`.`Foto` (`idFoto` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Photolog`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Photolog`.`Administrador` (
  `idAdministrador` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Contraseña` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
