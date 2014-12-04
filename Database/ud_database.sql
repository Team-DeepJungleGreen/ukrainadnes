DROP SCHEMA IF EXISTS `ud_database` ;
CREATE SCHEMA IF NOT EXISTS `ud_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ud_database` ;

-- -----------------------------------------------------
-- Table `ud_database`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ud_database`.`Users` ;

CREATE TABLE IF NOT EXISTS `ud_database`.`Users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `pass` VARCHAR(150) NOT NULL,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `eMail` VARCHAR(150) NOT NULL,
  `priviledges` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ud_database`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ud_database`.`Categories` ;

CREATE TABLE IF NOT EXISTS `ud_database`.`Categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ud_database`.`Posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ud_database`.`Posts` ;

CREATE TABLE IF NOT EXISTS `ud_database`.`Posts` (
  `postsId` INT NOT NULL AUTO_INCREMENT,
  `postTitle` VARCHAR(45) NOT NULL,
  `postContent` TEXT NOT NULL,
  `postAuthorId` INT NOT NULL,
  `postDate` DATETIME NOT NULL,
  `postVisits` BIGINT NULL,
  `postHasComments` TINYINT NOT NULL DEFAULT 1,
  `postTags` TEXT NULL,
  `Categories_id` INT NOT NULL,
  PRIMARY KEY (`postsId`),
  INDEX `fk_Posts_Users1_idx` (`postAuthorId` ASC),
  INDEX `fk_Posts_Categories1_idx` (`Categories_id` ASC),
  CONSTRAINT `fk_Posts_Users1`
    FOREIGN KEY (`postAuthorId`)
    REFERENCES `ud_database`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posts_Categories1`
    FOREIGN KEY (`Categories_id`)
    REFERENCES `ud_database`.`Categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `ud_database`.`Tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ud_database`.`Tags` ;

CREATE TABLE IF NOT EXISTS `ud_database`.`Tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tagName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ud_database`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ud_database`.`Comments` ;

CREATE TABLE IF NOT EXISTS `ud_database`.`Comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `userEmail` VARCHAR(150) NOT NULL,
  `commentContent` TEXT NOT NULL,
  `commentDate` DATETIME NOT NULL,
  `postId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comments_Posts1_idx` (`postId` ASC),
  CONSTRAINT `fk_Comments_Posts1`
    FOREIGN KEY (`postId`)
    REFERENCES `ud_database`.`Posts` (`postsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `ud_database`.`Likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ud_database`.`Likes` ;

CREATE TABLE IF NOT EXISTS `ud_database`.`Likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Posts_postsId` INT NOT NULL,
  `Users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Likes_Posts1_idx` (`Posts_postsId` ASC),
  INDEX `fk_Likes_Users1_idx` (`Users_id` ASC),
  CONSTRAINT `fk_Likes_Posts1`
    FOREIGN KEY (`Posts_postsId`)
    REFERENCES `ud_database`.`Posts` (`postsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Likes_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `ud_database`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;