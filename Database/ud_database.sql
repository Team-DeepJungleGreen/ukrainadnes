DROP SCHEMA IF EXISTS `useful4_ukrainadnes` ;
CREATE SCHEMA IF NOT EXISTS `useful4_ukrainadnes` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `useful4_ukrainadnes` ;

-- -----------------------------------------------------
-- Table `useful4_ukrainadnes`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `useful4_ukrainadnes`.`Users` ;

CREATE TABLE IF NOT EXISTS `useful4_ukrainadnes`.`Users` (
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
-- Table `useful4_ukrainadnes`.`Categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `useful4_ukrainadnes`.`Categories` ;

CREATE TABLE IF NOT EXISTS `useful4_ukrainadnes`.`Categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `useful4_ukrainadnes`.`Posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `useful4_ukrainadnes`.`Posts` ;

CREATE TABLE IF NOT EXISTS `useful4_ukrainadnes`.`Posts` (
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
    REFERENCES `useful4_ukrainadnes`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posts_Categories1`
    FOREIGN KEY (`Categories_id`)
    REFERENCES `useful4_ukrainadnes`.`Categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `useful4_ukrainadnes`.`Tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `useful4_ukrainadnes`.`Tags` ;

CREATE TABLE IF NOT EXISTS `useful4_ukrainadnes`.`Tags` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tagName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `useful4_ukrainadnes`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `useful4_ukrainadnes`.`Comments` ;

CREATE TABLE IF NOT EXISTS `useful4_ukrainadnes`.`Comments` (
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
    REFERENCES `useful4_ukrainadnes`.`Posts` (`postsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `useful4_ukrainadnes`.`Likes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `useful4_ukrainadnes`.`Likes` ;

CREATE TABLE IF NOT EXISTS `useful4_ukrainadnes`.`Likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Posts_postsId` INT NOT NULL,
  `Users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Likes_Posts1_idx` (`Posts_postsId` ASC),
  INDEX `fk_Likes_Users1_idx` (`Users_id` ASC),
  CONSTRAINT `fk_Likes_Posts1`
    FOREIGN KEY (`Posts_postsId`)
    REFERENCES `useful4_ukrainadnes`.`Posts` (`postsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Likes_Users1`
    FOREIGN KEY (`Users_id`)
    REFERENCES `useful4_ukrainadnes`.`Users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;