CREATE SCHEMA `light_management` ;

/*utworzenie tabeli z pomieszczeniami*/
CREATE TABLE `light_management`.`rooms_table` (
  `roomId` INT NOT NULL AUTO_INCREMENT,
  `roomName` VARCHAR(45) NOT NULL,
  `roomDescription` VARCHAR(45) NOT NULL,
  `roomStatus` TINYINT NOT NULL,

  `roomBuildingId` INT,
    
  `roomDateOfCreation` DATETIME NOT NULL,
  `roomDateOfModification` DATETIME NOT NULL,
  
  PRIMARY KEY (`roomId`)
  );

/*utworzenie tabeli z oświetleniem*/
CREATE TABLE `light_management`.`lights_table` (
  `lightId` INT NOT NULL AUTO_INCREMENT,
  `lightName` VARCHAR(45) NOT NULL,
  `lightDescription` VARCHAR(45) NOT NULL,
  `lightStatus` TINYINT NOT NULL,
  `lightType` VARCHAR(45) NOT NULL,
  `lightProducer` VARCHAR(45) NOT NULL,
  `lightQuantity` INT NOT NULL,
  
  PRIMARY KEY (`lightId`)
  );

/*utworzenie tabeli z punktami oświetlenia*/
CREATE TABLE `light_management`.`lightPoints_table` (
  `lightPointId` INT NOT NULL AUTO_INCREMENT,
  `lightPointName` VARCHAR(45) NOT NULL,
  `lightPointDescription` VARCHAR(45) NOT NULL,
  `lightPointStatus` TINYINT NOT NULL,

  `lightPointRoomId` INT NOT NULL,
  `lightPointLightId` INT NOT NULL,
  `lightPointBulbId` INT NOT NULL,
    
  `lightPointDateOfCreation` DATETIME NOT NULL,
  `lightPointDateOfModification` DATETIME NOT NULL,
  
  PRIMARY KEY (`lightPointId`)
  );
  
  /*utworzenie tabeli z żarówkami*/
CREATE TABLE `light_management`.`bulbs_table` (
  `bulbId` INT NOT NULL AUTO_INCREMENT,
  `bulbName` VARCHAR(45) NOT NULL,
  `bulbDescription` VARCHAR(45) NOT NULL,
  `bulbStatus` TINYINT NOT NULL,
  `bulbType` VARCHAR(45) NOT NULL,
  `bulbPower` INT NOT NULL,
  `bulbProducer` VARCHAR(45) NOT NULL,
  
   PRIMARY KEY (`bulbId`)
  );
  
    /*utworzenie tabeli z budynkami*/
CREATE TABLE `light_management`.`buildings_table` (
  `buildingId` INT NOT NULL AUTO_INCREMENT,
  `buildingName` VARCHAR(45) NOT NULL,
  `buildingDescription` VARCHAR(45) NOT NULL,
  `buildingStatus` TINYINT NOT NULL,

  `buildingAddress` VARCHAR(100) NOT NULL,
  
  `buildingDateOfCreation` DATETIME NOT NULL,
  `buildingDateOfModification` DATETIME NOT NULL,
  
   PRIMARY KEY (`buildingId`)
  );
  
  
      /*utworzenie tabeli z uzytkownikami*/
CREATE TABLE `light_management`.`users_table` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(45) NOT NULL,
  `userDescription` VARCHAR(45) NOT NULL,
  `userStatus` TINYINT NOT NULL,
  `userLogin` VARCHAR(45) NOT NULL,
  `userPassword` VARCHAR(45) NOT NULL,

  `userDateOfCreation` DATETIME NOT NULL,
  `userDateOfModification` DATETIME NOT NULL,
  
   PRIMARY KEY (`userId`)
  );
  
  /*utworzenie tabeli z session_log*/
CREATE TABLE `light_management`.`sessionLogs_table` (
  `sessionLogId` INT NOT NULL AUTO_INCREMENT,
  `roomId` INT NOT NULL,
  `lightPointId` INT NOT NULL,
  
  `sessionLogDateStart` DATETIME NOT NULL,
  `sessionLogDateEnd` DATETIME NOT NULL,
  `sessionLogDuration` INT NOT NULL,
  
  PRIMARY KEY (`sessionLogId`)
  );