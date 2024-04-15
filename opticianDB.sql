-- -------------------------
-- Drop and create database
-- -------------------------

DROP DATABASE IF EXISTS `optician`;
CREATE DATABASE `optician` DEFAULT CHARACTER SET utf8;
USE `optician`;

-- ---------------------------
-- Create table `suppliers`
-- ---------------------------

CREATE TABLE IF NOT EXISTS `suppliers` (
    `supplierId` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `adress` VARCHAR(80) NULL,
    `phone` VARCHAR(50)NULL,
    `fax` VARCHAR(50),
    `NIF` VARCHAR(9),
    PRIMARY KEY(`supplierId`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- -------------------------
-- Create table `brands`
-- -------------------------

CREATE TABLE IF NOT EXISTS `brands` (
    `brandId` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `idSupplier` TINYINT(4),
    PRIMARY KEY(`brandId`),
    FOREIGN KEY (`idSupplier`) 
        REFERENCES `optician`.`suppliers` (`supplierId`)
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- -------------------------
-- Create table `glasses` 
-- -------------------------

CREATE TABLE IF NOT EXISTS `glasses` (
    `glassesId` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `idBrand` TINYINT(4) NOT NULL,
    `prescriptionL` ENUM("0.00", "+0.25", "-0.25", "+0.50", "-0.50", "+0.75", "-0.75", "+1.00", "-1.00", "+1.25", "-1.25", "+1.50", "-1.50", "+1.75", "-1.75", "+2.00", "-2.00", "+2.25", "-2.25", "+2.50", "-2.50", "+2.75", "-2.75", "+3.00", "-3.00") NOT NULL,
    `prescriptionR` ENUM("0.00", "+0.25", "-0.25", "+0.50", "-0.50", "+0.75", "-0.75", "+1.00", "-1.00", "+1.25", "-1.25", "+1.50", "-1.50", "+1.75", "-1.75", "+2.00", "-2.00", "+2.25", "-2.25", "+2.50", "-2.50", "+2.75", "-2.75", "+3.00", "-3.00")  NOT NULL,
    `frame` ENUM("rimless", "resin", "metal") NOT NULL,
    `frameColour` VARCHAR(50) NOT NULL,
    `glassColourL` VARCHAR(50) NOT NULL,
    `glassColourR` VARCHAR(50) NOT NULL,
    `price` FLOAT NOT NULL,
    PRIMARY KEY(`glassesId`),
    FOREIGN KEY (`idBrand`) 
        REFERENCES `optician`.`brands` (`brandId`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- ------------------------
-- Create table `customers` 
-- ------------------------

CREATE TABLE IF NOT EXISTS `customers` (
    `customerId` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `adress` VARCHAR(50),
    `phone` VARCHAR(50) NOT NULL,
    `email` VARCHAR(80) NOT NULL,
    `registerDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `idRecomendedFor` TINYINT(4),
    PRIMARY KEY(`customerId`),
    FOREIGN KEY (`idRecomendedFor`) 
        REFERENCES `optician`.`customers` (`customerId`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- -------------------------
-- Create table `sellers`
-- -------------------------

CREATE TABLE IF NOT EXISTS `sellers` (
    `sellerId` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`sellerId`))
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;

-- ------------------------
-- Create table `purchases` 
-- ------------------------

CREATE TABLE IF NOT EXISTS `purchases` (
    `purchaseId` TINYINT(4) NOT NULL AUTO_INCREMENT,
    `idCustomer` TINYINT(4) NOT NULL,
    `idGlasses` TINYINT(4) NOT NULL,
    `idSeller` TINYINT(4) NOT NULL,
    `purchaseDate` DATE NOT NULL,
    PRIMARY KEY(`purchaseId`),
    FOREIGN KEY (`idCustomer`) 
        REFERENCES `optician`.`customers` (`customerId`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (`idGlasses`) 
        REFERENCES `optician`.`glasses` (`glassesId`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (`idSeller`) 
        REFERENCES `optician`.`sellers` (`sellerId`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
ENGINE = InnoDB 
DEFAULT CHARACTER SET = utf8;