-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_telecon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_telecon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_telecon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db_telecon` ;

-- -----------------------------------------------------
-- Table `db_telecon`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `document` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db_telecon`.`authentication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`authentication` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_UNIQUE` (`user` ASC) VISIBLE,
  INDEX `fk_credenciais_person_idx` (`person_id` ASC) VISIBLE,
  UNIQUE INDEX `person_id_UNIQUE` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_credenciais_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `db_telecon`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_telecon`.`line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`line` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `number_UNIQUE` (`number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_telecon`.`type_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`type_services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_telecon`.`line_has_type_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`line_has_type_services` (
  `line_id` INT NOT NULL,
  `type_services_id` INT NOT NULL,
  PRIMARY KEY (`line_id`, `type_services_id`),
  INDEX `fk_line_has_type_services_type_services1_idx` (`type_services_id` ASC) VISIBLE,
  INDEX `fk_line_has_type_services_line1_idx` (`line_id` ASC) VISIBLE,
  CONSTRAINT `fk_line_has_type_services_line1`
    FOREIGN KEY (`line_id`)
    REFERENCES `db_telecon`.`line` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_line_has_type_services_type_services1`
    FOREIGN KEY (`type_services_id`)
    REFERENCES `db_telecon`.`type_services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_telecon`.`line_has_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`line_has_person` (
  `line_id` INT NOT NULL,
  `person_id` INT NOT NULL,
  PRIMARY KEY (`line_id`, `person_id`),
  INDEX `fk_line_has_person_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_line_has_person_line1_idx` (`line_id` ASC) VISIBLE,
  CONSTRAINT `fk_line_has_person_line1`
    FOREIGN KEY (`line_id`)
    REFERENCES `db_telecon`.`line` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_line_has_person_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `db_telecon`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_telecon`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_telecon`.`request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(100) NULL,
  `status` VARCHAR(100) NULL,
  `type_services_id` INT NOT NULL,
  `line_id` INT NOT NULL,
  PRIMARY KEY (`id`, `type_services_id`, `line_id`),
  INDEX `fk_request_type_services1_idx` (`type_services_id` ASC) VISIBLE,
  INDEX `fk_request_line1_idx` (`line_id` ASC) VISIBLE,
  CONSTRAINT `fk_request_type_services1`
    FOREIGN KEY (`type_services_id`)
    REFERENCES `db_telecon`.`type_services` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_request_line1`
    FOREIGN KEY (`line_id`)
    REFERENCES `db_telecon`.`line` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
