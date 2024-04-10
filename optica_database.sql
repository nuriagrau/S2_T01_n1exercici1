-- -------------------------
-- Drop and create database
-- -------------------------

DROP DATABASE IF EXISTS `optica`;
CREATE DATABASE `optica` DEFAULT CHARACTER SET utf8;
USE `optica`;

-- ---------------------------
-- Create table `proveidors`
-- ---------------------------

CREATE TABLE IF NOT EXISTS `proveidors` (
    `proveidor_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `adreça` VARCHAR(80) NULL,
    `telefon` VARCHAR(50)NULL,
    `fax` VARCHAR(50),
    `NIF` VARCHAR(9),
    PRIMARY KEY(`PROVEIDOR_ID`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- -------------------------
-- Create table `marques`
-- -------------------------

CREATE TABLE IF NOT EXISTS `marques` (
    `marca_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `proveidor` TINYINT(4),
    PRIMARY KEY(`marca_id`),
    INDEX `proveidor_idx` (`proveidor` ASC) VISIBLE,
    CONSTRAINT `proveidor`
        FOREIGN KEY (`proveidor`) 
        REFERENCES `optica`.`proveidors` (`proveidor_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- -------------------------
-- Create table `ulleres` 
-- -------------------------

CREATE TABLE IF NOT EXISTS `ulleres` (
    `ulleres_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `marca` TINYINT(4) NOT NULL,
    `graduacio_E` ENUM("0.00", "+0.25", "-0.25", "+0.50", "-0.50", "+0.75", "-0.75", "+1.00", "-1.00", "+1.25", "-1.25", "+1.50", "-1.50", "+1.75", "-1.75", "+2.00", "-2.00", "+2.25", "-2.25", "+2.50", "-2.50", "+2.75", "-2.75", "+3.00", "-3.00") NOT NULL,
    `graduacio_D` ENUM("0.00", "+0.25", "-0.25", "+0.50", "-0.50", "+0.75", "-0.75", "+1.00", "-1.00", "+1.25", "-1.25", "+1.50", "-1.50", "+1.75", "-1.75", "+2.00", "-2.00", "+2.25", "-2.25", "+2.50", "-2.50", "+2.75", "-2.75", "+3.00", "-3.00")  NOT NULL,
    `montura` ENUM("flotant", "pasta", "metal.lica") NOT NULL,
    `col_montura` VARCHAR(50) NOT NULL,
    `col_vidre_E` VARCHAR(50) NOT NULL,
    `col_vidre_D` VARCHAR(50) NOT NULL,
    `preu` FLOAT NOT NULL,
    PRIMARY KEY(`ulleres_id`),
    INDEX `marca_idx` (`marca` ASC) VISIBLE,
    CONSTRAINT `marca`
        FOREIGN KEY (`marca`) 
        REFERENCES `optica`.`marques` (`marca_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- ------------------------
-- Create table `clients` 
-- ------------------------

CREATE TABLE IF NOT EXISTS `clients` (
    `client_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    `adreça` VARCHAR(50) NOT NULL,
    `telefon` VARCHAR(50) NOT NULL,
    `email` VARCHAR(80) NOT NULL,
    `data_registre` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `recomanat_per_client` TINYINT(4),
    PRIMARY KEY(`client_id`),
    INDEX `recomanat_per_client_idx` (`recomanat_per_client` ASC) VISIBLE,
    CONSTRAINT `recomanat_per_client`
        FOREIGN KEY (`recomanat_per_client`) 
        REFERENCES `optica`.`clients` (`client_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- -------------------------
-- Create table `venedors`
-- -------------------------

CREATE TABLE IF NOT EXISTS `venedors` (
    `venedor_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`venedor_id`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- ------------------------
-- Create table `compres` 
-- ------------------------

CREATE TABLE IF NOT EXISTS `compres` (
    `compra_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `client` TINYINT(4) NOT NULL,
    `ullera` TINYINT(4) NOT NULL,
    `venedor` TINYINT(4) NOT NULL,
    `data_compra` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`compra_id`),
    INDEX `client_idx` (`client` ASC) VISIBLE,
    INDEX `ullera_idx` (`ullera` ASC) VISIBLE,
    INDEX `venedor_idx` (`venedor` ASC) VISIBLE,
    CONSTRAINT `client`
        FOREIGN KEY (`client`) 
        REFERENCES `optica`.`clients` (`client_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `ullera`
        FOREIGN KEY (`ullera`) 
        REFERENCES `optica`.`ulleres` (`ulleres_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT `venedor`
        FOREIGN KEY (`venedor`) 
        REFERENCES `optica`.`venedors` (`venedor_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;