-- MySQL Script generated by MySQL Workbench
-- уторак, 27. децембар 2016. 18:23:43 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Olga_Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Olga_Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Olga_Store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Olga_Store` ;

-- -----------------------------------------------------
-- Table `Olga_Store`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `email` VARCHAR(45) NOT NULL COMMENT '',
  `password` VARCHAR(40) NOT NULL COMMENT '',
  `name` VARCHAR(45) NULL COMMENT '',
  `surname` VARCHAR(45) NULL COMMENT '',
  `address` VARCHAR(45) NULL COMMENT '',
  `city` VARCHAR(45) NULL COMMENT '',
  `country` VARCHAR(45) NULL COMMENT '',
  `telephone` VARCHAR(45) NULL COMMENT '',
  `confirmation_code` VARCHAR(40) NOT NULL COMMENT '',
  `status` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`Privilege`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`Privilege` (
  `id` CHAR(1) NOT NULL COMMENT '',
  `description` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`Has`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`Has` (
  `User_id` INT NOT NULL COMMENT '',
  `Privilege_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`User_id`, `Privilege_id`)  COMMENT '',
  INDEX `fk_Has_Privilege1_idx` (`Privilege_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Has_User`
    FOREIGN KEY (`User_id`)
    REFERENCES `Olga_Store`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Has_Privilege1`
    FOREIGN KEY (`Privilege_id`)
    REFERENCES `Olga_Store`.`Privilege` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`Order` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `date_of_creation` DATE NOT NULL COMMENT '',
  `status` VARCHAR(45) NOT NULL COMMENT '',
  `amount` DOUBLE NOT NULL COMMENT '',
  `User_id` INT NOT NULL COMMENT '',
  `comment` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Order_User1_idx` (`User_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Order_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `Olga_Store`.`User` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`Category` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `description` TEXT NOT NULL COMMENT '',
  `price_per_piece` DOUBLE NOT NULL COMMENT '',
  `in_stock` TINYINT(1) NOT NULL COMMENT '',
  `name` VARCHAR(45) NOT NULL COMMENT '',
  `Category_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_Product_Category1_idx` (`Category_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Product_Category1`
    FOREIGN KEY (`Category_id`)
    REFERENCES `Olga_Store`.`Category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`Contains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`Contains` (
  `quantity` INT NOT NULL COMMENT '',
  `Order_id` INT NOT NULL COMMENT '',
  `Product_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Order_id`, `Product_id`)  COMMENT '',
  INDEX `fk_Contains_Order1_idx` (`Order_id` ASC)  COMMENT '',
  INDEX `fk_Contains_Product1_idx` (`Product_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Contains_Order1`
    FOREIGN KEY (`Order_id`)
    REFERENCES `Olga_Store`.`Order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Contains_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `Olga_Store`.`Product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Olga_Store`.`ProductImage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Olga_Store`.`ProductImage` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `path` VARCHAR(45) NOT NULL COMMENT '',
  `Product_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_ProductImage_Product1_idx` (`Product_id` ASC)  COMMENT '',
  CONSTRAINT `fk_ProductImage_Product1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `Olga_Store`.`Product` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
