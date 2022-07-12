-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Spotify` DEFAULT CHARACTER SET utf8 ;
USE `Spotify` ;

-- -----------------------------------------------------
-- Table `Spotify`.`paypal_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`paypal_account` (
  `paypal_account_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`paypal_account_id`),
  UNIQUE INDEX `paypal_account_id_UNIQUE` (`paypal_account_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`credit_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`credit_card` (
  `credit_card_id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(45) NOT NULL,
  `pass_code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`credit_card_id`),
  UNIQUE INDEX `credit_card_id_UNIQUE` (`credit_card_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`subscription` (
  `subscription_id` INT NOT NULL AUTO_INCREMENT,
  `subscribed_at` DATE NOT NULL,
  `date_of_renovation` DATE NOT NULL,
  `way_to_pay` ENUM("card", "paypal") NOT NULL,
  `paypal_account_paypal_account_id` INT NULL,
  `credit_card_credit_card_id` INT NULL,
  PRIMARY KEY (`subscription_id`),
  UNIQUE INDEX `subscription_id_UNIQUE` (`subscription_id` ASC) VISIBLE,
  INDEX `fk_subscription_paypal_account1_idx` (`paypal_account_paypal_account_id` ASC) VISIBLE,
  INDEX `fk_subscription_credit_card1_idx` (`credit_card_credit_card_id` ASC) VISIBLE,
  UNIQUE INDEX `credit_card_credit_card_id_UNIQUE` (`credit_card_credit_card_id` ASC) VISIBLE,
  UNIQUE INDEX `paypal_account_paypal_account_id_UNIQUE` (`paypal_account_paypal_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_paypal_account1`
    FOREIGN KEY (`paypal_account_paypal_account_id`)
    REFERENCES `Spotify`.`paypal_account` (`paypal_account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_credit_card1`
    FOREIGN KEY (`credit_card_credit_card_id`)
    REFERENCES `Spotify`.`credit_card` (`credit_card_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `sex` ENUM("Male", "Female") NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(10) NOT NULL,
  `subscription_subscription_id` INT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `fk_user_subscription1_idx` (`subscription_subscription_id` ASC) VISIBLE,
  UNIQUE INDEX `subscription_subscription_id_UNIQUE` (`subscription_subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_subscription1`
    FOREIGN KEY (`subscription_subscription_id`)
    REFERENCES `Spotify`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `order_number` VARCHAR(45) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE INDEX `payments_id_UNIQUE` (`payment_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`playlist` (
  `playlist_id` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATE NOT NULL,
  `status` ENUM("active", "deleted") NOT NULL,
  `removal_date` DATE NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `user_user_id`),
  UNIQUE INDEX `playlist_id_UNIQUE` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_playlist_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `Spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`artist` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image` MEDIUMBLOB NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE INDEX `artist_id_UNIQUE` (`artist_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `image` MEDIUMBLOB NULL,
  `artist_artist_id` INT NOT NULL,
  PRIMARY KEY (`album_id`, `artist_artist_id`),
  UNIQUE INDEX `album_id_UNIQUE` (`album_id` ASC) VISIBLE,
  INDEX `fk_album_artist1_idx` (`artist_artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_album_artist1`
    FOREIGN KEY (`artist_artist_id`)
    REFERENCES `Spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`song` (
  `song_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `duration_seconds` INT NOT NULL,
  `number_of_plays` DOUBLE NOT NULL,
  `album_album_id` INT NOT NULL,
  PRIMARY KEY (`song_id`, `album_album_id`),
  UNIQUE INDEX `song_id_UNIQUE` (`song_id` ASC) VISIBLE,
  INDEX `fk_song_album1_idx` (`album_album_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`album_album_id`)
    REFERENCES `Spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`shared_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`shared_playlist` (
  `playlist_playlist_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`playlist_playlist_id`, `user_user_id`),
  INDEX `fk_playlist_has_user_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_user_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_user_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `Spotify`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_user_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `Spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`song_has_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`song_has_playlist` (
  `song_song_id` INT NOT NULL,
  `playlist_playlist_id` INT NOT NULL,
  `added_by_user_id` INT NOT NULL,
  `added_date` DATE NOT NULL,
  PRIMARY KEY (`song_song_id`, `playlist_playlist_id`, `added_by_user_id`),
  INDEX `fk_song_has_playlist_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  INDEX `fk_song_has_playlist_song1_idx` (`song_song_id` ASC) VISIBLE,
  INDEX `fk_song_has_playlist_user1_idx` (`added_by_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_song_has_playlist_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `Spotify`.`song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song_has_playlist_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `Spotify`.`playlist` (`playlist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_song_has_playlist_user1`
    FOREIGN KEY (`added_by_user_id`)
    REFERENCES `Spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`followed_artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`followed_artist` (
  `artist_artist_id` INT NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`artist_artist_id`, `user_user_id`),
  INDEX `fk_artist_has_user_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_artist_has_user_artist1_idx` (`artist_artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist_has_user_artist1`
    FOREIGN KEY (`artist_artist_id`)
    REFERENCES `Spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artist_has_user_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `Spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`similar_artist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`similar_artist` (
  `artist_artist_id1` INT NOT NULL,
  `artist_artist_id2` INT NOT NULL,
  PRIMARY KEY (`artist_artist_id1`, `artist_artist_id2`),
  INDEX `fk_artist_has_artist_artist2_idx` (`artist_artist_id2` ASC) VISIBLE,
  INDEX `fk_artist_has_artist_artist1_idx` (`artist_artist_id1` ASC) VISIBLE,
  CONSTRAINT `fk_artist_has_artist_artist1`
    FOREIGN KEY (`artist_artist_id1`)
    REFERENCES `Spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artist_has_artist_artist2`
    FOREIGN KEY (`artist_artist_id2`)
    REFERENCES `Spotify`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`user_likes_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`user_likes_song` (
  `user_user_id` INT NOT NULL,
  `song_song_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `song_song_id`),
  INDEX `fk_user_has_song_song1_idx` (`song_song_id` ASC) VISIBLE,
  INDEX `fk_user_has_song_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_song_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `Spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_song_song1`
    FOREIGN KEY (`song_song_id`)
    REFERENCES `Spotify`.`song` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`user_likes_album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`user_likes_album` (
  `user_user_id` INT NOT NULL,
  `album_album_id` INT NOT NULL,
  PRIMARY KEY (`user_user_id`, `album_album_id`),
  INDEX `fk_user_has_album_album1_idx` (`album_album_id` ASC) VISIBLE,
  INDEX `fk_user_has_album_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_album_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `Spotify`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_album_album1`
    FOREIGN KEY (`album_album_id`)
    REFERENCES `Spotify`.`album` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spotify`.`payment_has_subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spotify`.`payment_has_subscription` (
  `payment_payment_id` INT NOT NULL,
  `subscription_subscription_id` INT NOT NULL,
  PRIMARY KEY (`payment_payment_id`, `subscription_subscription_id`),
  INDEX `fk_payment_has_subscription_subscription1_idx` (`subscription_subscription_id` ASC) VISIBLE,
  INDEX `fk_payment_has_subscription_payment1_idx` (`payment_payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_has_subscription_payment1`
    FOREIGN KEY (`payment_payment_id`)
    REFERENCES `Spotify`.`payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_has_subscription_subscription1`
    FOREIGN KEY (`subscription_subscription_id`)
    REFERENCES `Spotify`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
