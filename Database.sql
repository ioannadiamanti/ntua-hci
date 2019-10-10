DROP SCHEMA IF EXISTS `jobify` ;

CREATE SCHEMA `jobify` ;

CREATE TABLE `jobify`.`employer`(
`employer_id` INT NOT NULL auto_increment,
`username` VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL,
`Last_Name` VARCHAR(45) NOT NULL,
`First_Name` VARCHAR(45) NOT NULL,
`email` VARCHAR(45) NOT NULL,
`phone_number` VARCHAR(45) NOT NULL,
`address` VARCHAR(45) NOT NULL,
`img` VARCHAR(45) NULL,
PRIMARY KEY (`employer_id`));


CREATE TABLE `jobify`.`employee`(
`employee_id` INT NOT NULL auto_increment,
`username` VARCHAR(45) NOT NULL,
`password` VARCHAR(45) NOT NULL,
`Last_Name` VARCHAR(45) NOT NULL,
`First_Name` VARCHAR(45) NOT NULL,
`age` INT NULL,
`email` VARCHAR(45) NOT NULL,
`phone_number` VARCHAR(45) NOT NULL,
`address` VARCHAR(45) NOT NULL,
`img` VARCHAR(45) NULL,
`avg_rating` VARCHAR(10) NULL,
`edu` VARCHAR(45) NULL,
PRIMARY KEY (`employee_id`));

  
CREATE TABLE `jobify`.`employee_interests` (
`employee_id` INT NOT NULL,
`interest` VARCHAR(45) NOT NULL,
PRIMARY KEY (`employee_id`,`interest`),
CONSTRAINT `b3`
	FOREIGN KEY (`employee_id`)
	REFERENCES `jobify`.`employee` (`employee_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
  
CREATE TABLE `jobify`.`employee_job_experiences` (
`employee_id` INT NOT NULL,
`experience` VARCHAR(45) NOT NULL,
PRIMARY KEY (`employee_id`,`experience`),
CONSTRAINT `b4`
	FOREIGN KEY (`employee_id`)
	REFERENCES `jobify`.`employee` (`employee_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
  
CREATE TABLE `jobify`.`speaks_languages`(
`employee_id` INT NOT NULL,
`language` VARCHAR(45) NOT NULL,
PRIMARY KEY(`employee_id`,`language`),
CONSTRAINT `b2`
	FOREIGN KEY(`employee_id`)
    REFERENCES `jobify`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `jobify`.`advertisement`(
`advertisement_id` INT NOT NULL auto_increment,
`employer_id` INT NOT NULL,
`employee_id` INT NULL,
`date_published` DATE NOT NULL,
`title` VARCHAR (45) NOT NULL,
`location` VARCHAR(45) NULL,
`date_confirmed` DATE NULL,
`description` VARCHAR(200) NULL,
`type_of_job` VARCHAR(200) NULL,
`payment` FLOAT NULL,
`experience_required` VARCHAR(45) NOT NULL,
`education_level` VARCHAR(45) NOT NULL,
PRIMARY KEY (`advertisement_id`),
CONSTRAINT `c1`
	FOREIGN KEY (`employer_id`)
	REFERENCES `jobify`.`employer` (`employer_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
CONSTRAINT `b5`
	FOREIGN KEY (`employee_id`)
	REFERENCES `jobify`.`employee` (`employee_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
   
CREATE TABLE `jobify`.`tags`(
`advertisement_id` INT NOT NULL,
`tag` VARCHAR(45) NOT NULL,
PRIMARY KEY(`advertisement_id`,`tag`),
CONSTRAINT `d1`
	FOREIGN KEY (`advertisement_id`)
    REFERENCES `jobify`.`advertisement` (`advertisement_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
   
CREATE TABLE `jobify`.`working_hours`(
`advertisement_id` INT NOT NULL,
`day` VARCHAR(20) NOT NULL,
`hours` VARCHAR(20) NOT NULL,
PRIMARY KEY(`advertisement_id`,`day`,`hours`),
CONSTRAINT `b6`
	FOREIGN KEY(`advertisement_id`)
    REFERENCES `jobify`.`advertisement`(`advertisement_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

    
CREATE TABLE `jobify`.`languages_required`(
`advertisement_id` INT NOT NULL,
`language` VARCHAR(45) NOT NULL,
PRIMARY KEY(`advertisement_id`,`language`),
CONSTRAINT `b1`
	FOREIGN KEY(`advertisement_id`)
    REFERENCES `jobify`.`advertisement` (`advertisement_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    

CREATE TABLE `jobify`.`comment_on_employee`(
`comment_id` INT NOT NULL auto_increment,
`employer_id` INT NOT NULL,
`employee_id` INT NOT NULL,
`date_published` DATE NOT NULL,
`comment` VARCHAR(200) NULL,
`rating` INT NULL,
PRIMARY KEY (`comment_id`),
CONSTRAINT `c2`
	FOREIGN KEY (`employee_id`)
    REFERENCES `jobify`.`employee` (`employee_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
CONSTRAINT `c3`
	FOREIGN KEY (`employer_id`)
	REFERENCES `jobify`.`employer` (`employer_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
    
CREATE TABLE `jobify`.`comment_on_employer`(
`comment_id` INT NOT NULL auto_increment,
`employee_id` INT NOT NULL,
`employer_id` INT NOT NULL,
`date_published` DATE NOT NULL,
`comment` VARCHAR(200) NULL,
`rating` INT NULL,
PRIMARY KEY (`comment_id`),
CONSTRAINT `c4`
	FOREIGN KEY (`employee_id`)
    REFERENCES `jobify`.`employee` (`employee_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
CONSTRAINT `c5`
	FOREIGN KEY (`employer_id`)
	REFERENCES `jobify`.`employer` (`employer_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE);

CREATE TABLE `jobify`.`interested`(
`employee_id` INT NOT NULL,
`advertisement_id` INT NOT NULL,
PRIMARY KEY (`employee_id`,`advertisement_id`),
CONSTRAINT `c6`
	FOREIGN KEY (`employee_id`)
    REFERENCES `jobify`.`employee` (`employee_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
CONSTRAINT `c7`
	FOREIGN KEY (`advertisement_id`)
    REFERENCES `jobify`.`advertisement` (`advertisement_id`)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
    
CREATE TABLE `jobify`.`employer_notification`(
`employer_id` INT NOT NULL,
`not_id` INT NOT NULL,
`date` DATE NOT NULL,
`type` VARCHAR(45) NOT NULL,
`content` VARCHAR (200) NOT NULL,
PRIMARY KEY (`not_id`),
CONSTRAINT `c8`
	FOREIGN KEY(`employer_id`)
    REFERENCES `jobify`.`employer` (`employer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `jobify`.`employee_notification`(
`employee_id` INT NOT NULL,
`not_id` INT NOT NULL,
`date` DATE NOT NULL,
`type` VARCHAR(45) NOT NULL,
`content` VARCHAR (200) NOT NULL,
PRIMARY KEY (`not_id`),
CONSTRAINT `c9`
	FOREIGN KEY(`employee_id`)
    REFERENCES `jobify`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
