-- MySQL Workbench Synchronization
-- Generated: 2024-04-10 10:10
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: MacBook Pro de Nuria

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`proveidor` (
  `proveidor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(80) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`proveidor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`marca` (
  `marca_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `proveidor` INT(11) NOT NULL,
  PRIMARY KEY (`marca_id`),
  INDEX `proveidor_id_idx` (`proveidor` ASC) VISIBLE,
  CONSTRAINT `proveidor`
    FOREIGN KEY (`proveidor`)
    REFERENCES `mydb`.`proveidor` (`proveidor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`ulleres` (
  `ulleres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `marca` INT(11) NOT NULL,
  `graduacio_e` FLOAT(11) NOT NULL,
  `graduacio_d` FLOAT(11) NOT NULL,
  `montura` ENUM("flotant", "pasta", "metal.lica") NULL DEFAULT NULL,
  `color_montura` VARCHAR(45) NULL DEFAULT NULL,
  `color_vidre_e` VARCHAR(45) NULL DEFAULT NULL,
  `color_vidre_d` VARCHAR(45) NULL DEFAULT NULL,
  `preu` FLOAT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ulleres_id`),
  INDEX `marca_id_idx` (`marca` ASC) VISIBLE,
  CONSTRAINT `marca`
    FOREIGN KEY (`marca`)
    REFERENCES `mydb`.`marca` (`marca_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`clients` (
  `clients_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(80) NULL DEFAULT NULL,
  `telefon` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(80) NULL DEFAULT NULL,
  `data_registe` DATE NULL DEFAULT NULL,
  `recomanat_per_client` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`clients_id`),
  INDEX `recomanat_per_client_idx` (`recomanat_per_client` ASC) VISIBLE,
  CONSTRAINT `recomanat_per_client`
    FOREIGN KEY (`recomanat_per_client`)
    REFERENCES `mydb`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`venedor` (
  `venedor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`venedor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`compres` (
  `compres_id` INT(11) NOT NULL AUTO_INCREMENT,
  `client` INT(11) NOT NULL,
  `ullera` INT(11) NOT NULL,
  `venedor` INT(11) NOT NULL,
  PRIMARY KEY (`compres_id`),
  INDEX `client_idx` (`client` ASC) VISIBLE,
  INDEX `ullera_idx` (`ullera` ASC) VISIBLE,
  INDEX `venedor_idx` (`venedor` ASC) VISIBLE,
  CONSTRAINT `client`
    FOREIGN KEY (`client`)
    REFERENCES `mydb`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ullera`
    FOREIGN KEY (`ullera`)
    REFERENCES `mydb`.`ulleres` (`ulleres_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `venedor`
    FOREIGN KEY (`venedor`)
    REFERENCES `mydb`.`venedor` (`venedor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
