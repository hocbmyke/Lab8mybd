-- MySQL Script generated by MySQL Workbench
-- Sun Nov  6 15:58:17 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GamesDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GamesDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GamesDB` DEFAULT CHARACTER SET utf8 ;
USE `GamesDB` ;

-- -----------------------------------------------------
-- Table `GamesDB`.`Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`Game` (
  `GameId` INT NOT NULL,
  `GameName` VARCHAR(45) NULL,
  PRIMARY KEY (`GameId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`Developer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`Developer` (
  `Devid` INT NOT NULL,
  `Devname` VARCHAR(45) NULL,
  PRIMARY KEY (`Devid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`Platform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`Platform` (
  `PlatformId` INT NOT NULL,
  `Platformname` VARCHAR(45) NULL,
  PRIMARY KEY (`PlatformId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`GamePlatform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`GamePlatform` (
  `GameId` INT NOT NULL,
  `PlatformId` INT NOT NULL,
  PRIMARY KEY (`GameId`),
  INDEX `fk_GamePlatform_Game1_idx` (`GameId` ASC) VISIBLE,
  INDEX `fk_GamePlatform_Platform1_idx` (`PlatformId` ASC) VISIBLE,
  CONSTRAINT `fk_GamePlatform_Game1`
    FOREIGN KEY (`GameId`)
    REFERENCES `GamesDB`.`Game` (`GameId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GamePlatform_Platform1`
    FOREIGN KEY (`PlatformId`)
    REFERENCES `GamesDB`.`Platform` (`PlatformId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`GameDev`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`GameDev` (
  `GameId` INT NOT NULL,
  `DevId` INT NOT NULL,
  PRIMARY KEY (`GameId`),
  INDEX `fk_GameDev_Game_idx` (`GameId` ASC) VISIBLE,
  INDEX `fk_GameDev_Developer1_idx` (`DevId` ASC) VISIBLE,
  CONSTRAINT `fk_GameDev_Game`
    FOREIGN KEY (`GameId`)
    REFERENCES `GamesDB`.`Game` (`GameId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GameDev_Developer1`
    FOREIGN KEY (`DevId`)
    REFERENCES `GamesDB`.`Developer` (`Devid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`Genre` (
  `GenreId` INT NOT NULL,
  `GenreName` VARCHAR(45) NULL,
  PRIMARY KEY (`GenreId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`GameGenre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`GameGenre` (
  `GameId` INT NOT NULL,
  `GenreId` INT NOT NULL,
  PRIMARY KEY (`GameId`),
  INDEX `fk_GameGenre_Game1_idx` (`GameId` ASC) VISIBLE,
  INDEX `fk_GameGenre_Genre1_idx` (`GenreId` ASC) VISIBLE,
  CONSTRAINT `fk_GameGenre_Game1`
    FOREIGN KEY (`GameId`)
    REFERENCES `GamesDB`.`Game` (`GameId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GameGenre_Genre1`
    FOREIGN KEY (`GenreId`)
    REFERENCES `GamesDB`.`Genre` (`GenreId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`Currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`Currency` (
  `PriceCurrencyId` INT NOT NULL,
  `PriceCurrencyName` VARCHAR(45) NULL,
  PRIMARY KEY (`PriceCurrencyId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GamesDB`.`GamePrice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GamesDB`.`GamePrice` (
  `PriceValue` INT NULL,
  `GameId` INT NOT NULL,
  `PriceCurrencyId` INT NOT NULL,
  PRIMARY KEY (`GameId`),
  INDEX `fk_GamePrice_Game1_idx` (`GameId` ASC) VISIBLE,
  INDEX `fk_GamePrice_Currency1_idx` (`PriceCurrencyId` ASC) VISIBLE,
  CONSTRAINT `fk_GamePrice_Game1`
    FOREIGN KEY (`GameId`)
    REFERENCES `GamesDB`.`Game` (`GameId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GamePrice_Currency1`
    FOREIGN KEY (`PriceCurrencyId`)
    REFERENCES `GamesDB`.`Currency` (`PriceCurrencyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;