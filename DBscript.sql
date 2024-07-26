-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NF3_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NF3_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NF3_DB` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema NF2_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NF2_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NF2_DB` ;
-- -----------------------------------------------------
-- Schema NF1_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NF1_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NF1_DB` ;
USE `NF3_DB` ;

-- -----------------------------------------------------
-- Table `NF3_DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NF3_DB`.`Customers` (
  `idCustomer` INT NOT NULL,
  `Customer_Address` VARCHAR(45) NOT NULL,
  `Customer_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NF3_DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NF3_DB`.`Orders` (
  `idOrder` INT NOT NULL,
  `Order_Date` DATE NOT NULL,
  `idCustomer` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_customer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_customer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `NF3_DB`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NF3_DB`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NF3_DB`.`Products` (
  `idOrder` INT NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Product_Quantity` INT NOT NULL,
  INDEX `fk_orders_idx` (`idOrder` ASC) VISIBLE,
  CONSTRAINT `fk_orders`
    FOREIGN KEY (`idOrder`)
    REFERENCES `NF3_DB`.`Orders` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `NF2_DB` ;

-- -----------------------------------------------------
-- Table `NF2_DB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NF2_DB`.`Customers` (
  `idCustomer` INT NOT NULL,
  `Customer_Address` VARCHAR(45) NOT NULL,
  `Customer_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NF2_DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NF2_DB`.`Orders` (
  `idOrder` INT NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Product_Quantity` INT NOT NULL,
  `Order_Date` DATE NOT NULL,
  `idCustomer` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_customer_idx` (`idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_customer`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `NF2_DB`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `NF1_DB` ;

-- -----------------------------------------------------
-- Table `NF1_DB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NF1_DB`.`Orders` (
  `idOrder` INT NOT NULL,
  `Product_Name` VARCHAR(45) NOT NULL,
  `Product_Quantity` INT NOT NULL,
  `Customer_Address` VARCHAR(45) NOT NULL,
  `Order_Date` DATE NOT NULL,
  `Customer_Name` VARCHAR(45) NOT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
