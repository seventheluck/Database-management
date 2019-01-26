-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `StudentID` INT NOT NULL,
  `LastName` VARCHAR(45) NULL,
  `FirstName` VARCHAR(45) NULL,
  `DateOfBirth` VARCHAR(45) NULL,
  PRIMARY KEY (`StudentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Course` (
  `CourseID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Term`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Term` (
  `TermID` INT NOT NULL,
  `Year` VARCHAR(45) NULL,
  `Term` VARCHAR(45) NULL,
  PRIMARY KEY (`TermID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enrollment` (
  `EnrollmentID` INT NOT NULL,
  `StudentID` INT NULL,
  `CourseID` INT NULL,
  `TermID` INT NULL,
  PRIMARY KEY (`EnrollmentID`),
  INDEX `StudentID_idx` (`StudentID` ASC) VISIBLE,
  INDEX `TermID_idx` (`TermID` ASC) VISIBLE,
  INDEX `CourseID_idx` (`CourseID` ASC) VISIBLE,
  CONSTRAINT `StudentID`
    FOREIGN KEY (`StudentID`)
    REFERENCES `mydb`.`Student` (`StudentID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `TermID`
    FOREIGN KEY (`TermID`)
    REFERENCES `mydb`.`Term` (`TermID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `mydb`.`Course` (`CourseID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
